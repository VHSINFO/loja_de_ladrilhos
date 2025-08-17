import 'package:flutter/foundation.dart';
import 'product_model.dart';

class CartItem {
  final Product product;
  int quantity;

  CartItem({required this.product, this.quantity = 1});
}

class CartModel extends ChangeNotifier {
  final List<CartItem> _items = [];

  List<CartItem> get items => _items;

  double get totalPrice {
    return _items.fold(0.0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  int get itemCount {
    return _items.fold(0, (sum, item) => sum + item.quantity);
  }

  String add(Product product) {
    if (product.stock <= 0) {
      return 'Desculpe, este produto está esgotado.';
    }

    // Verifica se o produto já existe no carrinho
    for (var item in _items) {
      if (item.product.id == product.id) {
        if (item.quantity < product.stock) {
          item.quantity++;
          notifyListeners();
          return '${product.name} adicionado ao carrinho!';
        } else {
          return 'Você atingiu o limite de estoque para este item.';
        }
      }
    }
    // Se não existir, adiciona um novo
    _items.add(CartItem(product: product));
    notifyListeners();
    return '${product.name} adicionado ao carrinho!';
  }

  void remove(CartItem cartItem) {
    _items.remove(cartItem);
    notifyListeners();
  }
  
  String increment(CartItem cartItem) {
      if (cartItem.quantity < cartItem.product.stock) {
        cartItem.quantity++;
        notifyListeners();
        return 'Quantidade atualizada.';
      } else {
        return 'Limite de estoque atingido.';
      }
  }

  void decrement(CartItem cartItem) {
      if (cartItem.quantity > 1) {
          cartItem.quantity--;
      } else {
          _items.remove(cartItem);
      }
      notifyListeners();
  }

  void clear() {
    _items.clear();
    notifyListeners();
  }
}