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

import {getVersesInChapter} from './../utils/api_functions';
import {LoadingIndicator} from './../components/LoadingIndicator';
import Verses from '../components/Verses';

const VersesScreen = props => {
  const [data, setData] = useState({});
  const [isLoading, setIsLoading] = useState(false);
  const [errorMsg, setErrorMsg] = useState('');

  const _getVersesInChapter = async chapterNumber => {
    try {
      setIsLoading(true);
      setErrorMsg('');
      setData(await getVersesInChapter(chapterNumber));
      setIsLoading(false);
    } catch (error) {
      setErrorMsg('Something went wrong');
      setIsLoading(false);
    }
  };

  useEffect(() => {
    console.log('in use effect');
    console.log(props);
    console.log(props.navigation.getParam('chapterNumber'));
    _getVersesInChapter(props.navigation.getParam('chapterNumber'))
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
    <Verses verses={data} />
    // <View>
    //   <Text>main app {JSON.stringify(data)}</Text>
    // </View>
  );
};

VersesScreen.navigationOptions = ({navigation}) => {
  return {
    title: navigation.getParam('title'),
    headerTintColor: 'black',
    headerStyle: {
      backgroundColor: 'orange',
    },
  };
};

export default VersesScreen;
