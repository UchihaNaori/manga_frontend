class Chapter {
  int id;
  String name;
  int chapter;
  int comicId;
  bool isRecent;
  List<dynamic> listPaths;
  int volume;
  Chapter({required this.id, required this.name, required this.chapter, required this.comicId, required this.isRecent, required this.listPaths, required this.volume});

  factory Chapter.fromMap(Map<String, dynamic> map) => Chapter(
    id: map['id'],
    name: map['name'],
    chapter: map['chapter'],
    comicId: map['comic_id'],
    isRecent: map['isRecent'] ?? false,
    listPaths: map['listChap'] ?? [],
    volume: map['volume']?? 0
  );
}