class Category {
  int id;
  String title;
  String description;

  Category({required this.id, required this.title, required this.description});

  Map<String, dynamic> toMap() => {
    'id': id,
    'title': title,
    'description': description
  };

  factory Category.fromMap(Map<String, dynamic> map) => Category(
    id: map['id'],
    title: map['title'],
    description: map['description']
  );
}