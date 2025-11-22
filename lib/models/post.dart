class Post {
  final int? id;
  final String title;
  final String description;
  final String? type;
  final String? city;
  final String? state;
  final String? userName;
  final List<String> images;

  Post({
    this.id,
    required this.title,
    required this.description,
    this.type,
    this.city,
    this.state,
    this.userName,
    this.images = const [],
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      type: map['type'],
      city: map['city'],
      state: map['state'],
      userName: map['userName'],
      images: map['images'] != null
          ? (map['images'] as String).split(',')
          : [],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'type': type,
      'city': city,
      'state': state,
      'userName': userName,
      'images': images.join(','),
    };
  }
}
