class AdoptionRequest {
  final String id;
  final String userId;
  final String animalId;
  final String organizationName;
  final String status; 
  final DateTime requestedAt;

  AdoptionRequest({
    required this.id,
    required this.userId,
    required this.animalId,
    required this.organizationName,
    required this.status,
    required this.requestedAt,
  });

  factory AdoptionRequest.fromJson(Map<String, dynamic> json) {
    return AdoptionRequest(
      id: json['id'],
      userId: json['userId'],
      animalId: json['animalId'],
      organizationName: json['organizationName'],
      status: json['status'],
      requestedAt: DateTime.parse(json['requestedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'userId': userId,
      'animalId': animalId,
      'organizationName': organizationName,
      'status': status,
      'requestedAt': requestedAt.toIso8601String(),
    };
  }
}
