import 'package:flutter/material.dart';
import 'package:gita_app/db_helpers/db_class.dart';
import 'package:gita_app/models/verses_model.dart';
import 'package:gita_app/provider/app_provider.dart';
import 'package:gita_app/widgets/bottom_sheet_options.dart';
import 'package:gita_app/widgets/verse_card.dart';
import 'package:provider/provider.dart';

class VerseScreen extends StatelessWidget {
  static const String routeName = 'verses';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Title'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              showModalBottomSheet(
                context: context,
                builder: (context) => BottomSheetOptions(),
              );
            },
          ),
        ],
      ),
      body: VerseContainer(),
    );
  }
}

class VerseContainer extends StatefulWidget {
  @override
  _VerseContainerState createState() => _VerseContainerState();
}

class _VerseContainerState extends State<VerseContainer> {
  bool _isLoading = false;
  List<Verse> verses = [];

  @override
  void didChangeDependencies() async {
    setState(() {
      _isLoading = true;
    });
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    verses = await GitaDb.getVersesFromChapter(appProvider.selectedChapter);
    setState(() {
      _isLoading = false;
      verses = verses;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return _isLoading
        ? Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          )
        : Container(
            padding: EdgeInsets.all(height / 50),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: verses.length,
              itemBuilder: (BuildContext context, int index) {
                return VerseCard(
                  verse: verses[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) => Container(
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(
                          height / 100,
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
