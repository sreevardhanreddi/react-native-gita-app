import axios from 'axios';
import qs from 'qs';
import {client_secret, client_id, grant_type, scope} from './api_access_tokens';

export const axiosInst = axios.create({
  baseURL: 'https://bhagavadgita.io/api/v1/',
});

axiosInst.interceptors.request.use(
  async config => {
    console.log('in interceptors');
    console.log(config);
    // const token = await getToken();
    // if (token) {
    //   config.headers['Authorization'] = 'Bearer ' + token;
    // }
    // // config.headers['Content-Type'] = 'application/json';
    return config;
  },
  error => {
    Promise.reject(error);
  },
);

axiosInst.interceptors.response.use(
  response => response,
  error => {
    if (error.response.status === 401) {
      getToken()
        .then(token => {
          setToken(token);
        })
        .catch(e => console.log(e, e.response));
    }
  },
);

const setToken = token => {
  axiosInst.defaults.headers.common['Authorization'] = 'Bearer ' + token;
};

export const getToken = async () => {
  try {
    let data = {
      client_id: client_id,
      client_secret: client_secret,
      grant_type: grant_type,
    };
    console.log(data);
    let response = await axios.post(
      'https://bhagavadgita.io/auth/oauth/token',
      qs.stringify(data),
      {
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
      },
    );

    if (response.status === 200) {
      console.log('-------------------------------------');
      console.log(response.data);
      //   axiosInst.defaults.headers.common['Authorization'] =
      //     'Bearer ' + response.data['access_token'];
      setToken(response.data['access_token']);
      return response.data['access_token'];
    } else {
      console.log(response);
      return null;
    }
  } catch (error) {
    console.log(error);
    console.log(error.response);
    return null;
  }
};
