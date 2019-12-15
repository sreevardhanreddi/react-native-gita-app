import React from 'react';
import {
  ActivityIndicator,
  StyleSheet,
  Text,
  Dimensions,
  View,
} from 'react-native';

export const LoadingIndicator = () => {
  return (
    <View style={styles.container}>
      <ActivityIndicator
        style={styles.container}
        size="large"
        color="#0000ff"
      />
    </View>
  );
};

const styles = StyleSheet.create({
  container: {
    alignItems: 'center',
    justifyContent: 'center',
    marginTop: Dimensions.get('window').height / 5,
  },
});
