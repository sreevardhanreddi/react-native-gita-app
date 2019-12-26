import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gita_app/db_helpers/db_class.dart';
import 'package:gita_app/models/chapters_model.dart';
import 'package:gita_app/provider/app_provider.dart';
import 'package:gita_app/screens/verses_screen.dart';
import 'package:gita_app/widgets/bottom_sheet_options.dart';
import 'package:gita_app/widgets/chapter_card.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:sqflite/sqflite.dart' as sql;
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => AppProvider(),
        ),
      ],
      child: Consumer<AppProvider>(
        builder: (context, appProvider, _) {
          return MaterialApp(
            home: ScaffoldContainer(),
            theme: appProvider.selectedTheme,
            routes: <String, WidgetBuilder>{
              VerseScreen.routeName: (context) => VerseScreen(),
            },
          );
        },
      ),
    );
  }
}

class ScaffoldContainer extends StatefulWidget {
  const ScaffoldContainer({Key key}) : super(key: key);

  @override
  _ScaffoldContainerState createState() => _ScaffoldContainerState();
}

class _ScaffoldContainerState extends State<ScaffoldContainer> {
  @override
  void didChangeDependencies() async {
    final appProvider = Provider.of<AppProvider>(context, listen: false);
    await appProvider.setAppDataFromStorage();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Gita App'),
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
      body: GitaApp(),
    );
  }
}

class GitaApp extends StatefulWidget {
  GitaApp({Key key}) : super(key: key);

  @override
  _GitaAppState createState() => _GitaAppState();
}

class _GitaAppState extends State<GitaApp> {
  List<Chapter> chapters = [];
  bool _isLoading = false;

  void didChangeDependencies() async {
    setState(() {
      _isLoading = true;
    });
    final dbPath = await sql.getDatabasesPath();
    final gitaDbPath = p.join(dbPath, 'gita.db');
    // Only copy if the database doesn't exist
    if (FileSystemEntity.typeSync(gitaDbPath) ==
        FileSystemEntityType.notFound) {
      // Load database from asset and copy
      ByteData data = await rootBundle.load(p.join('assets', 'db.sqlite3'));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Save copied asset to documents
      await new File(gitaDbPath).writeAsBytes(bytes);
    }
    chapters = await GitaDb.getChapters();
    setState(() {
      chapters = chapters;
      _isLoading = false;
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return _isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.all(height / 60),
            child: ListView.separated(
              physics: BouncingScrollPhysics(),
              itemCount: chapters.length,
              itemBuilder: (BuildContext context, int index) {
                return ChapterCard(
                  chapter: chapters[index],
                );
              },
              separatorBuilder: (BuildContext context, int index) => Container(
                padding: EdgeInsets.all(height / 60),
              ),
            ),
          );
  }
}
