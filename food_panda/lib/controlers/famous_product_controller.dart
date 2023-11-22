import 'package:food_panda/builders/repository/fam_product_repo.dart';
import 'package:food_panda/controlers/cart_controller.dart';
import 'package:food_panda/models/cart_model.dart';
import 'package:food_panda/models/famous_products_model.dart';
import 'package:food_panda/utils/colors.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/utils/utils.dart';

class FamousProductCon extends GetxController {
  final FamousProductRepo famousProductRepo;
  FamousProductCon(
      {required this.famousProductRepo});
  List<dynamic> _famousProductsList = [];
  List<dynamic> get famousProductsList =>
      _famousProductsList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;
  int _quantity = 0;
  int get quantity => _quantity;
  int _inCartItems = 0;
  int get inCartItem => _inCartItems + _quantity;
  late CartCon _cart;

  Future<void> getFamousProductList() async {
    Response response = await famousProductRepo
        .getFamousProductList();
    if (response.statusCode == 200) {
      print("GOT IT");
      _famousProductsList = [];
      _famousProductsList.addAll(
          Product.fromJson(response.body)
              .products);
      print(_famousProductsList);
      _isLoaded = true;

      update();
    } else {
      print("didnt products GOT IT");
    }
  }

  void setQuantity(bool isIncrement) {
    if (isIncrement) {
      _quantity = checkQuantity(_quantity + 1);
    } else {
      _quantity = checkQuantity(_quantity - 1);
    }
    update();
  }

  int checkQuantity(int quantity) {
    if (_inCartItems + quantity < 0) {
      Get.snackbar("Item Account",
          " You can't reduce more",
          backgroundColor: ColorRes.app,
          colorText: ColorRes.white);
      if (_inCartItems > 0) {
        _quantity = -_inCartItems;
        return quantity;
      }
      return 0;
    } else if (_inCartItems + quantity > 20) {
      Get.snackbar(
          "Item Account", " You can't add more",
          backgroundColor: ColorRes.app,
          colorText: ColorRes.white);

      return 20;
    } else {
      return quantity;
    }
  }

  void initProduct(
      ProductModel product, CartCon cart) {
    _quantity = 0;
    _inCartItems = 0;
    _cart = cart;
    var exist = false;
    exist = _cart.existInCart(product);

    if (exist) {
      _inCartItems = _cart.getQuantity(product);
    }

    // get from storage
  }

  void addItem(ProductModel product) {
    // if (quantity > 0) {
    _cart.addItem(product, _quantity);
    _quantity = 0;
    _inCartItems = _cart.getQuantity(product);
    _cart.items.forEach((key, value) {
      print("the id is ");
    });
    update();
  }

  int get totalItems {
    return _cart.totalItems;
  }

  List<CartModel> get getItems {
    return _cart.getItems;
  }
}
