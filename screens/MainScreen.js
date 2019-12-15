import React, {useState, useEffect} from 'react';

import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  ActivityIndicator,
  View,
  Text,
  StatusBar,
} from 'react-native';
import {axiosInst, getToken} from './../utils/axios_utils';
import {getChapters, getVersesInChapter} from './../utils/api_functions';
import {LoadingIndicator} from './../components/LoadingIndicator';
import Chapters from '../components/Chapters';

const MainApp = () => {
  const [data, setData] = useState({});
  const [isLoading, setIsLoading] = useState(false);
  const [errorMsg, setErrorMsg] = useState('');

  const _getChapters = async () => {
    try {
      setIsLoading(true);
      setErrorMsg('');
      await getToken();
      setData(await getChapters());
      setIsLoading(false);
    } catch (error) {
      setErrorMsg('Something went wrong');
      setIsLoading(false);
    }
  };

  useEffect(() => {
    console.log('in use effect');
    _getChapters()
      .then()
      .catch(e => console.log(e));
    return () => {
      //   cleanup;
    };
  }, []);

  return isLoading ? (
    <LoadingIndicator />
  ) : errorMsg.length > 0 ? (
    <View>
      <Text>something went wrong</Text>
    </View>
  ) : (
    <Chapters chapters={data} />
    // <View>
    //   <Text>main app {JSON.stringify(data)}</Text>
    // </View>
  );
};

export default MainApp;
