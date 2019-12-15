import * as React from 'react';
import {Card, Title, Paragraph, Button} from 'react-native-paper';
import {Text} from 'react-native';
const VerseItem = props => {
  console.log(props);

  return (
    <Card>
      <Card.Content>
        <Paragraph>{props.verse.meaning}</Paragraph>
        {/* <Title>{props.verse.meaning}</Title> */}
        {/* <Paragraph>{props.chapter.chapter_summary}</Paragraph>
        <Card.Actions style={{justifyContent: 'flex-end'}}>
          <Button mode="contained" color="yellow" onPress={_onPressHandle}>
            Verses
          </Button> 
        </Card.Actions> */}
      </Card.Content>
    </Card>
  );
};

export default VerseItem;
