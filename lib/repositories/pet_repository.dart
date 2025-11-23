import 'package:meadote_inicio/models/animal.dart';

class PetRepository {
  final List<Animal> _adoptedPets = [];
  final List<Animal> _helpedPets = [];

  Future<List<Animal>> getAdoptedPets(String userId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _adoptedPets;
  }

  Future<List<Animal>> getHelpedPets(String userId) async {
    await Future.delayed(const Duration(milliseconds: 400));
    return _helpedPets;
  }

  void addAdopted(Animal pet) {
    _adoptedPets.add(pet);
  }

  void addHelped(Animal pet) {
    _helpedPets.add(pet);
  }
}
