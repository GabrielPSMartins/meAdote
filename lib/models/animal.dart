class Animal {
  final String nome;
  final String especie;
  final String raca;
  final int idade;
  final String porte;
  final String imagemUrl;

  Animal({
    required this.nome,
    required this.especie,
    required this.raca,
    required this.idade,
    required this.porte,
    required this.imagemUrl,
  });
}

final mockAnimals = [
  Animal(
    nome: 'Thor',
    especie: 'Cachorro',
    raca: 'Bulldog',
    idade: 1,
    porte: 'Pequeno',
    imagemUrl: 'https://images.unsplash.com/photo-1583337130417-3346a1be7dee',
  ),
  Animal(
    nome: 'Mimi',
    especie: 'Gato',
    raca: 'Siames',
    idade: 3,
    porte: 'Pequeno',
    imagemUrl: 'https://images.unsplash.com/photo-1574158622682-e40e69881006',
  ),
];
