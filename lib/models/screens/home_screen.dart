import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:loja_de_ladrilhos/models/cart_model.dart';
import 'package:loja_de_ladrilhos/models/product_model.dart';
import 'product_detail_screen.dart';
import 'cart_screen.dart';
import 'about_screen.dart';
import 'contact_screen.dart';
import 'package:intl/intl.dart';

enum MenuOptions { about, contact }

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Loja de Ladrilhos'),
        backgroundColor: Colors.blue[800],
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Stack(
                children: [
                  IconButton(
                    icon: const Icon(Icons.shopping_cart),
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen()));
                    },
                  ),
                  if (cart.itemCount > 0)
                    Positioned(
                      right: 8, top: 8,
                      child: Container(
                        padding: const EdgeInsets.all(2),
                        decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                        constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                        child: Text(cart.itemCount.toString(), style: const TextStyle(color: Colors.white, fontSize: 10), textAlign: TextAlign.center),
                      ),
                    ),
                ],
              );
            },
          ),
          PopupMenuButton<MenuOptions>(
            onSelected: (MenuOptions result) {
              switch (result) {
                case MenuOptions.about:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutScreen()));
                  break;
                case MenuOptions.contact:
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const ContactScreen()));
                  break;
              }
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<MenuOptions>>[
              const PopupMenuItem<MenuOptions>(value: MenuOptions.about, child: Text('Sobre a Empresa')),
              const PopupMenuItem<MenuOptions>(value: MenuOptions.contact, child: Text('Contato')),
            ],
          ),
        ],
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        itemCount: productList.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 0.75, crossAxisSpacing: 10.0, mainAxisSpacing: 10.0),
        itemBuilder: (ctx, i) => ProductCard(product: productList[i], formatCurrency: formatCurrency),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.formatCurrency});
  final Product product;
  final NumberFormat formatCurrency;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          GridTile(
            footer: GridTileBar(
              backgroundColor: Colors.black54,
              title: Text(product.name, textAlign: TextAlign.center, style: const TextStyle(fontSize: 12)),
              subtitle: Text(formatCurrency.format(product.price), textAlign: TextAlign.center, style: const TextStyle(fontSize: 11, color: Colors.white, fontWeight: FontWeight.bold)),
            ),
            child: GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetailScreen(product: product)));
              },
              child: Hero(
                tag: product.id,
                child: Image.asset(
                  product.imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(color: Colors.blue[100], child: Center(child: Icon(Icons.image_not_supported, color: Colors.blue[300], size: 50)));
                  },
                ),
              ),
            ),
          ),
          if (product.stock == 0)
            Container(
              decoration: BoxDecoration(color: Colors.black.withOpacity(0.5), borderRadius: BorderRadius.circular(10)),
              child: const Center(child: Text('ESGOTADO', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18))),
            ),
        ],
      ),
    );
  }
}