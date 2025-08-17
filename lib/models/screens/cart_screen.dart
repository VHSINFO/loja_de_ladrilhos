import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:loja_de_ladrilhos/models/cart_model.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  void _launchWhatsApp(BuildContext context, CartModel cart) async {
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');
    String numeroWhatsapp = "+5573998667174"; // INSIRA AQUI O NÚMERO DE WHATSAPP DA LOJA

    String message = "Olá! Gostaria de fazer um pedido:\n\n";
    for (var item in cart.items) {
      message += "${item.quantity}x ${item.product.name} - ${formatCurrency.format(item.product.price * item.quantity)}\n";
    }
    message += "\n*Total: ${formatCurrency.format(cart.totalPrice)}*";

    // Codifica a mensagem para URL
    final Uri whatsappUrl = Uri.parse(
      "https://wa.me/$numeroWhatsapp?text=${Uri.encodeComponent(message)}",
    );

    if (await canLaunchUrl(whatsappUrl)) {
      await launchUrl(whatsappUrl, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Não foi possível abrir o WhatsApp. Verifique se ele está instalado."),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartModel>(context);
    final formatCurrency = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Scaffold(
      appBar: AppBar(
        title: const Text('Meu Carrinho'),
        backgroundColor: Colors.blue[800],
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart_outlined, size: 80, color: Colors.grey),
                  SizedBox(height: 20),
                  Text(
                    'Seu carrinho está vazio!',
                    style: TextStyle(fontSize: 20, color: Colors.grey),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: cart.items.length,
              itemBuilder: (ctx, i) {
                final cartItem = cart.items[i];
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundImage: AssetImage(cartItem.product.imageAsset),
                      onBackgroundImageError: (_, __) {}, // Evita erro se a imagem não carregar
                    ),
                    title: Text(cartItem.product.name),
                    subtitle: Text(formatCurrency.format(cartItem.product.price * cartItem.quantity)),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(icon: const Icon(Icons.remove), onPressed: () => cart.decrement(cartItem)),
                        Text('${cartItem.quantity}'),
                        IconButton(icon: const Icon(Icons.add), onPressed: () => cart.increment(cartItem)),
                      ],
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: cart.items.isEmpty
          ? null
          : Container(
              padding: const EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.3),
                    spreadRadius: 1,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Total:',
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        formatCurrency.format(cart.totalPrice),
                        style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.blue),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      icon: const Icon(Icons.chat),
                      label: const Text('Finalizar Pedido via WhatsApp'),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        textStyle: const TextStyle(fontSize: 16),
                      ),
                      onPressed: () => _launchWhatsApp(context, cart),
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}