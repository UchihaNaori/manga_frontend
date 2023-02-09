class Chapter {
  int id;
  String name;
  int chapter;
  int comicId;
  bool isRecent;
  List<dynamic> listPaths;
  bool isVolume;
  Chapter({required this.id, required this.name, required this.chapter, required this.comicId, required this.isRecent, required this.listPaths, required this.isVolume});

  factory Chapter.fromMap(Map<String, dynamic> map) => Chapter(
    id: map['id'],
    name: map['name'],
    chapter: map['chapter'],
    comicId: map['comic_id'],
    isRecent: map['isRecent'] ?? false,
    listPaths: map['listChap'] ?? [],
    isVolume: map['is_volume'] == 1 ? true : false
  );
}