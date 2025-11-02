class Animal {
  final String name;
  final String species;
  final String breed;
  final int age;
  final String size;
  final String imageUrl;

  Animal({
    required this.name,
    required this.species,
    required this.breed,
    required this.age,
    required this.size,
    required this.imageUrl,
  });
}

// Lista de animais simulada (mock data)
final mockAnimals = [
  Animal(
    name: 'Thor',
    species: 'Cachorro', 
    breed: 'Bulldog',
    age: 1,
    size: 'Pequeno',
    imageUrl: 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee',
  ),
  Animal(
    name: 'Mimi',
    species: 'Gato',
    breed: 'Siames',
    age: 3,
    size: 'Pequeno',
    imageUrl: 'https://images.unsplash.com/photo-1574158622682-e40e69881006',
  ),
];
