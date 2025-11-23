import 'package:meadote_inicio/models/adoption_request.dart';

class AdoptionRequestRepository {
  final List<AdoptionRequest> _requests = [];

  Future<List<AdoptionRequest>> getRequestsByUser(String userId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _requests.where((r) => r.userId == userId).toList();
  }

  Future<void> addRequest(AdoptionRequest request) async {
    _requests.add(request);
  }

  Future<void> updateRequestStatus(String id, String newStatus) async {
    final index = _requests.indexWhere((r) => r.id == id);
    if (index != -1) {
      _requests[index] = AdoptionRequest(
        id: _requests[index].id,
        userId: _requests[index].userId,
        animalId: _requests[index].animalId,
        organizationName: _requests[index].organizationName,
        status: newStatus,
        requestedAt: _requests[index].requestedAt,
      );
    }
  }
}
