class User {
  final String name;
  final String email;
  final String profileImage;
  final DateTime createdAt;

  User({
    required this.name,
    required this.email,
    this.profileImage = 'https://cdn-icons-png.flaticon.com/512/149/149071.png',
    required this.createdAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        name: json['name'],
        email: json['email'],
        profileImage: json['profileImage'] ??
            'https://cdn-icons-png.flaticon.com/512/149/149071.png',
        createdAt: DateTime.parse(json['createdAt']),
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'email': email,
        'profileImage': profileImage,
        'createdAt': createdAt.toIso8601String(),
      };
}
