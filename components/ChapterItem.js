import * as React from 'react';
import {Card, Title, Paragraph, Button} from 'react-native-paper';
import {Text} from 'react-native';
import {withNavigation} from 'react-navigation';

const ChapterItem = props => {
  console.log(props);

  const _onPressHandle = () => {
    console.log(props);
    console.log(props.chapter.chapter_number);
    props.navigation.navigate('Verses', {
      chapterNumber: props.chapter.chapter_number,
      title: props.chapter.name_meaning,
    });
  };

  return (
    <Card>
      <Card.Content>
        <Title>{props.chapter.name_meaning}</Title>
        <Paragraph>{props.chapter.chapter_summary}</Paragraph>
        <Card.Actions style={{justifyContent: 'flex-end'}}>
          <Button mode="contained" color="yellow" onPress={_onPressHandle}>
            Verses
          </Button>
        </Card.Actions>
      </Card.Content>
    </Card>
  );
};

export default withNavigation(ChapterItem);
