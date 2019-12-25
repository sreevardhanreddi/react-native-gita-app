class Verse {
  int chapterNumber;
  String meaning;
  String text;
  String transliteration;
  String verseNumber;
  String wordMeanings;
  bool isBookmarked;
  bool isFavourite;

  Verse({
    this.chapterNumber,
    this.meaning,
    this.text,
    this.transliteration,
    this.verseNumber,
    this.wordMeanings,
    this.isBookmarked,
    this.isFavourite,
  });

  Verse.fromJson(Map<String, dynamic> json) {
    chapterNumber = json['chapter_number'];
    meaning = json['meaning'];
    text = json['text'];
    transliteration = json['transliteration'];
    verseNumber = json['verse_number'];
    wordMeanings = json['word_meanings'];
    isBookmarked = (json['is_bookmarked'] == 0) ? false : true;
    isFavourite = (json['is_favourite'] == 0) ? false : true;
  }
}
