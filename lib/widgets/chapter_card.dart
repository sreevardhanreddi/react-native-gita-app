import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gita_app/models/chapters_model.dart';

class ChapterCard extends StatefulWidget {
  final Chapter chapter;

  ChapterCard({this.chapter});

  @override
  _ChapterCardState createState() => _ChapterCardState();
}

class _ChapterCardState extends State<ChapterCard> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    final chapter = widget.chapter;

    double titleSize = height / 35;
    double sanskritTitleSize = height / 45;
    double descriptionSize = height / 40;
    double versesCountSize = height / 40;

    final title = json.decode(chapter.nameMeaning);
    final sanskritTitle = json.decode(chapter.name);
    String description;
    try {
      description = json.decode(json.encode(chapter.chapterSummary).toString());
    } catch (e) {
      description = chapter.chapterSummary;
    }

    return Container(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Container(
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: titleSize,
                  ),
                ),
              ),
            ),
            Container(
              child: Container(
                child: Text(
                  sanskritTitle,
                  style: TextStyle(
                    fontSize: sanskritTitleSize,
                  ),
                ),
              ),
            ),
            Divider(),
            Container(
              child: Container(
                child: Text(
                  description,
                  style: TextStyle(
                    fontSize: descriptionSize,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
