import * as React from 'react';
import {Card, Title, Paragraph} from 'react-native-paper';
import {Text} from 'react-native';
const ChapterItem = props => {
  console.log(props);
  return (
    <Card>
      <Card.Content>
        <Title>{props.chapter.name_meaning}</Title>
        <Paragraph>{props.chapter.chapter_summary}</Paragraph>
      </Card.Content>
    </Card>
  );
};

export default ChapterItem;
