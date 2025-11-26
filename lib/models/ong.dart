class Ong {
  final int? id;
  final String name;
  final String email;
  final String password;
  final String city;
  final String imageUrl;

  Ong({
    this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.city,
    required this.imageUrl,
  });

  Map<String, dynamic> toMap() => {
        'id': id,
        'name': name,
        'email': email,
        'password': password,
        'city': city,
        'imageUrl': imageUrl,
      };

  factory Ong.fromMap(Map<String, dynamic> map) => Ong(
        id: map['id'],
        name: map['name'],
        email: map['email'],
        password: map['password'],
        city: map['city'],
        imageUrl: map['imageUrl'],
      );
}
