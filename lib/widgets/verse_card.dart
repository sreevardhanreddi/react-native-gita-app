import 'package:flutter/material.dart';
import 'package:gita_app/models/verses_model.dart';
import 'package:gita_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class VerseCard extends StatelessWidget {
  final Verse verse;
  const VerseCard({this.verse});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    String meaning = verse.meaning;
    final appProvider = Provider.of<AppProvider>(context);

    double descriptionSize = height / 50 + appProvider.fontScale;

    String font = appProvider.font;
    String sanskritText = verse.text;
    String verseNumber = verse.verseNumber;

    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            child: Text(
              '#$verseNumber',
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.0),
          ),
          Container(
            child: Text(
              meaning,
              style: TextStyle(
                fontFamily: font,
                fontSize: descriptionSize,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
