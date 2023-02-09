class User {
  final String name;
  final String password;
  final String email;
  final String phone;
  final String token;
  final String image;
  final int amountComic;
  final int id;
  final int cntToShared;
  final int cntFriend;

  const User({
    required this.name,
    required this.id,
    required this.password,
    required this.email,
    required this.phone,
    required this.image,
    required this.token,
    required this.amountComic,
    required this.cntToShared,
    required this.cntFriend
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['id'],
    name: json['name'],
    password: json['password']?? '',
    email: json['email'],
    phone: json['phone'],
    image: json['image'],
    token: json['token'] ?? '',
    amountComic: json['amount_comic'] ?? 0,
    cntToShared: json['cntToShared'] ?? 0,
    cntFriend: json['cnt_friend'] ?? 0
  );

  Map<String, dynamic> toJson() => {
    'name': name,
    'password': password,
    'email': email,
    'phone': phone,
    'token': token,
    'image': image
  };
}