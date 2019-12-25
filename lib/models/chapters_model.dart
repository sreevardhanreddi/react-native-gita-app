class Chapter {
  int chapterNumber;
  String chapterSummary;
  String name;
  String nameMeaning;
  String nameTranslation;
  String nameTransliterated;
  int versesCount;
  bool isBookmarked;
  bool isFavourite;

  Chapter({
    this.chapterNumber,
    this.chapterSummary,
    this.name,
    this.nameMeaning,
    this.nameTranslation,
    this.nameTransliterated,
    this.versesCount,
    this.isBookmarked,
    this.isFavourite,
  });

  Chapter.fromJson(Map<String, dynamic> json) {
    chapterNumber = json['chapter_number'];
    chapterSummary = json['chapter_summary'];
    name = json['name'];
    nameMeaning = json['name_meaning'];
    nameTranslation = json['name_translation'];
    nameTransliterated = json['name_transliterated'];
    versesCount = json['verses_count'];
    isBookmarked = (json['is_bookmarked'] == 0) ? false : true;
    isFavourite = (json['is_favourite'] == 0) ? false : true;
  }
}
