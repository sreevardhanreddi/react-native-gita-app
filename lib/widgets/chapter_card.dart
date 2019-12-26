import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gita_app/models/chapters_model.dart';
import 'package:gita_app/provider/app_provider.dart';
import 'package:provider/provider.dart';

class ChapterCard extends StatefulWidget {
  final Chapter chapter;

  ChapterCard({this.chapter});

  @override
  _ChapterCardState createState() => _ChapterCardState();
}

class _ChapterCardState extends State<ChapterCard> {
  @override
  Widget build(BuildContext context) {
    final chapter = widget.chapter;
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;

    final appProvider = Provider.of<AppProvider>(context);

    double titleSize = height / 40 + appProvider.fontScale;
    double sanskritTitleSize = height / 60 + appProvider.fontScale;
    double descriptionSize = height / 50 + appProvider.fontScale;
    double versesCountSize = height / 50 + appProvider.fontScale;

    String font = appProvider.font;

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
            InkWell(
              onTap: () {
                appProvider.setSelectedChapter = chapter.chapterNumber;
                Navigator.pushNamed(context, 'verses');
              },
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
                            fontFamily: font,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(5.0),
                    ),
                    Container(
                      child: Container(
                        child: Text(
                          sanskritTitle,
                          style: TextStyle(
                            fontSize: sanskritTitleSize,
                            fontFamily: font,
                          ),
                        ),
                      ),
                    ),
                  ],
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
                    fontFamily: font,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(
                top: height / 60,
              ),
              child: Container(
                child: Text(
                  'Verses ${chapter.versesCount}',
                  style: TextStyle(
                    fontFamily: 'Roboto',
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
