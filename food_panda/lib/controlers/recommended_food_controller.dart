import 'package:food_panda/models/famous_products_model.dart';
import 'package:get/get.dart';

import '../builders/repository/recommended_food_repository.dart';

class RecommendedProductCon
    extends GetxController {
  final RecommendedProductRepo
      recommendedProductRepo;
  RecommendedProductCon(
      {required this.recommendedProductRepo});
  List<dynamic> _recommendedProductsList = [];
  List<dynamic> get recommendedProductsList =>
      _recommendedProductsList;
  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  Future<void> getRecommendedProductList() async {
    Response response =
        await recommendedProductRepo
            .getRecommendedProductList();
    if (response.statusCode == 200) {
      print("GOT IT");
      _recommendedProductsList = [];
      _recommendedProductsList.addAll(
          Product.fromJson(response.body)
              .products);
      print(_recommendedProductsList);
      _isLoaded = true;

      update();
    } else {
      print(" didnt GOT IT");
    }
  }
}
