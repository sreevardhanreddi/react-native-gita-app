import React, {useEffect} from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  View,
  Text,
  StatusBar,
  LinearGradient,
} from 'react-native';
import MainApp from './screens/MainScreen';
import {createAppContainer} from 'react-navigation';
import {createStackNavigator} from 'react-navigation-stack';
import VersesScreen from './screens/VersesScreen';

const App = () => {
  return (
    <>
      <StatusBar barStyle="dark-content" />
      <SafeAreaView>
        <MainApp />
      </SafeAreaView>
    </>
  );
};

App.navigationOptions = ({navigation}) => {
  return {
    title: 'Gita',
    headerTintColor: 'black',
    headerStyle: {
      backgroundColor: 'orange',
    },
  };
};

const AppNavigator = createStackNavigator({
  Home: {
    screen: App,
  },
  Verses: {
    screen: VersesScreen,
  },
});

export default createAppContainer(AppNavigator);

// export default App;
