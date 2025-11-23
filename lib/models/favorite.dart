class Favorite {
  final String id;
  final String userId;
  final String animalId;

  Favorite({
    required this.id,
    required this.userId,
    required this.animalId,
  });

  factory Favorite.fromJson(Map<String, dynamic> json) {
    return Favorite(
      id: json['id'] ?? '',
      userId: json['userId'] ?? '',
      animalId: json['animalId'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'animalId': animalId,
    };
  }
}
