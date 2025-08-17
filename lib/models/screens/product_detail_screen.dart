import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:loja_de_ladrilhos/models/cart_model.dart';
import 'package:loja_de_ladrilhos/models/product_model.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product product;

  const ProductDetailScreen({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        backgroundColor: Colors.blue[800],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
              tag: product.id,
              child: SizedBox(
                height: 300,
                width: double.infinity,
                child: Image.asset(
                  product.imageAsset,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.blue[100],
                      child: Center(
                        child: Icon(
                          Icons.image_not_supported,
                          color: Colors.blue[300],
                          size: 100,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(
                product.name,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              formatCurrency.format(product.price),
              style: TextStyle(
                fontSize: 22,
                color: Colors.grey[800],
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            // NOVO: Exibição do estoque
            Text(
              product.stock > 0
                  ? 'Disponível: ${product.stock} unidades'
                  : 'Produto Esgotado',
              style: TextStyle(
                fontSize: 16,
                color: product.stock > 0 ? Colors.green[700] : Colors.red,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                product.description,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
      // NOVO: Lógica para habilitar/desabilitar o botão
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(12.0),
        child: ElevatedButton.icon(
          icon: Icon(product.stock > 0 ? Icons.add_shopping_cart : Icons.cancel_outlined),
          label: Text(product.stock > 0 ? 'Adicionar ao Carrinho' : 'Produto Esgotado'),
          style: ElevatedButton.styleFrom(
            backgroundColor: product.stock > 0 ? Colors.blue[700] : Colors.grey,
            padding: const EdgeInsets.symmetric(vertical: 15),
            textStyle: const TextStyle(fontSize: 18),
          ),
          onPressed: product.stock > 0 ? () {
            final cart = Provider.of<CartModel>(context, listen: false);
            final resultMessage = cart.add(product);
            
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(resultMessage),
                duration: const Duration(seconds: 2),
              ),
            );
          } : null, // onPressed: null desabilita o botão
        ),
      ),
    );
  }
}