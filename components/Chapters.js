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
import ChapterItem from './ChapterItem';
const Chapters = chapters => {
  const props = chapters.chapters;
  const onPress = item => {
    console.log('tapped ', item.chapter_number);
  };

  return (
    <View>
      {/* <Text>{JSON.stringify(props)}</Text> */}
      <FlatList
        data={props}
        keyExtractor={(item, index) => item.chapter_number.toString()}
        renderItem={({item, index, separators}) => (
          //   <TouchableOpacity
          //     onPress={() => onPress(item)}
          //     // onShowUnderlay={separators.highlight}
          //     // onHideUnderlay={separators.unhighlight}
          //   >
          //     {/* <View style={{backgroundColor: 'white'}}>
          //       <Text>{item.name}</Text>
          //     </View> */}
          //   </TouchableOpacity>
          <ChapterItem chapter={item} />
        )}
      />
    </View>
  );
};

export default Chapters;
