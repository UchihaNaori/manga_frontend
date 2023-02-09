class Comic {
  int id;
  String name;
  String otherName;
  String introductionContent;
  List<String> listCategory;
  String image;
  int active;
  int status;
  int userId;
  String coverImage;
  String author;
  String last_chapter;
  int isShared;

  Comic({
    required this.id,
    required this.name,
    required this.otherName,
    required this.introductionContent,
    required this.listCategory,
    required this.image,
    required this.active,
    required this.status,
    required this.userId,
    required this.author,
    required this.coverImage,
    required this.last_chapter,
    this.isShared = 0
  });

  Map<String, dynamic> toMap() => {
    'id': id,
    'name': name,
    'other_name': otherName,
    'introduction_content': introductionContent,
    'list_category': listCategory.join(', '),
    'image': image,
    'active': active,
    'status': status,
    'user_id': userId
  };

  factory Comic.fromMap(Map< String, dynamic> map) => Comic(
    id: map['id'],
    name: map['name'],
    otherName: map['other_name'],
    introductionContent: map['introduction_content'],
    listCategory: map['list_category'].toString().split(', '),
    image: map['image'],
    active: map['active'],
    status: map['status'],
    userId: map['user_id'],
    author: map['author'],
    coverImage: map['cover_image'],
    last_chapter: map['last_chapter'] ?? 'Chapter 1'
  );


}