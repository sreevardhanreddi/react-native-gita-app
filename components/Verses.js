import * as React from 'react';
import {
  SafeAreaView,
  StyleSheet,
  ScrollView,
  ActivityIndicator,
  View,
  Text,
  StatusBar,
  FlatList,
  TouchableHighlight,
  TouchableOpacity,
} from 'react-native';
import VerseItem from './VerseItem';
const Verses = verse => {
  const props = verse.verses;

  return (
    <View>
      {/* <Text>{JSON.stringify(props)}</Text> */}
      <FlatList
        data={props}
        keyExtractor={(item, index) => item.verse_number.toString()}
        renderItem={({item, index, separators}) => <VerseItem verse={item} />}
      />
    </View>
  );
};

export default Verses;
