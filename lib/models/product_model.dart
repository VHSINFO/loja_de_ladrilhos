
class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String imageAsset;
  final int stock; // NOVO: Controle de estoque

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
    required this.stock, // NOVO
  });
}

// Lista de produtos de exemplo com estoque
final List<Product> productList = [
  Product(
    id: 1,
    name: 'Ladrilho 1',
    description:
        'Um ladrilho de estilo clássico com padrões geométricos. Perfeito para cozinhas e áreas de lazer.',
    price: 12.50,
    imageAsset: 'assets/images/tile1.jpg',
    stock: 150,
  ),
  Product(
    id: 2,
    name: 'Ladrilho 2',
    description:
        'Sofisticação e elegância do mármore com a durabilidade do porcelanato. Ideal para salas e banheiros.',
    price: 89.90,
    imageAsset: 'assets/images/tile2.jpg',
    stock: 80,
  ),
  Product(
    id: 3,
    name: 'Ladrilho 3',
    description:
        'Ladrilho com a cor e o charme do estilo colonial português. Ótimo para fachadas e detalhes decorativos.',
    price: 9.80,
    imageAsset: 'assets/images/tile3.jpg',
    stock: 0, // Exemplo de produto esgotado
  ),
  Product(
    id: 4,
    name: 'Ladrilho 4',
    description:
        'Mix de pastilhas em tons de azul, perfeitas para piscinas, banheiros e cozinhas.',
    price: 25.00,
    imageAsset: 'assets/images/tile4.jpg',
    stock: 120,
  ),
  Product(
    id: 5,
    name: 'Ladrilho 5',
    description:
        'Estilo industrial e moderno. Porcelanato de alta resistência com aparência de cimento queimado.',
    price: 110.00,
    imageAsset: 'assets/images/tile5.jpg',
    stock: 45,
  ),
  Product(
    id: 6,
    name: 'Ladrilho 6',
    description:
        'Um toque vintage e delicado para o seu ambiente. Ideal para cozinhas e lavabos.',
    price: 15.20,
    imageAsset: 'assets/images/tile6.jpg',
    stock: 95,
  ),
  Product(
    id: 7,
    name: 'Ladrilho 7',
    description:
        'O famoso "subway tile". Versátil, limpo e moderno, combina com qualquer ambiente.',
    price: 5.50,
    imageAsset: 'assets/images/tile7.jpg',
    stock: 300,
  ),
  Product(
    id: 8,
    name: 'Ladrilho 8',
    description:
        'Aconchego e estilo rústico para áreas externas e internas. Acabamento natural.',
    price: 18.00,
    imageAsset: 'assets/images/tile8.jpg',
    stock: 0, // Exemplo de produto esgotado
  ),
  Product(
    id: 9,
    name: 'Ladrilho 9',
    description:
        'Crie paredes com relevo e um visual impressionante. Revestimento cimentício.',
    price: 45.00,
    imageAsset: 'assets/images/tile9.jpg',
    stock: 30,
  ),
  Product(
    id: 10,
    name: 'Ladrilho 10',
    description:
        'O calor da madeira com a praticidade do porcelanato. Ideal para todos os ambientes da casa.',
    price: 95.70,
    imageAsset: 'assets/images/tile10.jpg',
    stock: 60,
  ),
];
