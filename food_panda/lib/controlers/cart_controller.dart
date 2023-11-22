import 'package:food_panda/builders/repository/cart_repository.dart';
import 'package:food_panda/models/famous_products_model.dart';
import 'package:get/get.dart';

import '../models/cart_model.dart';
import '../utils/colors.dart';

class CartCon extends GetxController {
  final CartRepo cartRepo;
  CartCon({required this.cartRepo});
  Map<int, CartModel> _items = {};
  Map<int, CartModel> get items => _items;

  void addItem(
      ProductModel product, int quantity) {
    var totalQuantity = 0;
    if (_items.containsKey(product.id!)) {
      _items.update(product.id!, (value) {
        totalQuantity =
            value.quantity! + quantity;
        return CartModel(
          id: value.id,
          img: value.img,
          name: value.name,
          price: value.price,
          quantity: value.quantity! + quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
      if (totalQuantity <= 0) {
        _items.remove(product.id);
      }
    } else if (quantity > 0) {
      _items.putIfAbsent(product.id!, () {
        print("");

        return CartModel(
          id: product.id,
          img: product.img,
          name: product.name,
          price: product.price,
          quantity: quantity,
          isExist: true,
          time: DateTime.now().toString(),
        );
      });
    } else {
      Get.snackbar("Item Account",
          " You should atleast add one item",
          backgroundColor: ColorRes.app,
          colorText: ColorRes.white);
    }
  }

  bool existInCart(ProductModel product) {
    if (_items.containsKey(product.id)) {
      return true;
    }
    return false;
  }

  int getQuantity(ProductModel product) {
    var quantity = 0;
    if (_items.containsKey(product.id)) {
      _items.forEach(
        (key, value) {
          if (key == product.id) {
            quantity = value.quantity!;
          }
        },
      );
    }
    return quantity;
  }

  int get totalItems {
    var totalQuantity = 0;
    _items.forEach(
      (key, value) {
        totalQuantity += value.quantity!;
      },
    );
    return totalQuantity;
  }

  List<CartModel> get getItems {
    return _items.entries.map(
      (e) {
        return e.value;
      },
    ).toList();
  }
}
