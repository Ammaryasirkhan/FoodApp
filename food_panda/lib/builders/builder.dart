import 'package:food_panda/builders/Apis/apiclient_api.dart';
import 'package:food_panda/builders/repository/cart_repository.dart';
import 'package:food_panda/builders/repository/fam_product_repo.dart';
import 'package:food_panda/builders/repository/recommended_food_repository.dart';
import 'package:food_panda/controlers/cart_controller.dart';
import 'package:food_panda/controlers/famous_product_controller.dart';
import 'package:food_panda/controlers/recommended_food_controller.dart';
import 'package:food_panda/utils/app_constants.dart';
import 'package:get/get.dart';

Future<void> init() async {
  //api
  Get.lazyPut(() => ApiClient(
      appBaseUrl: AppConstants.BASE_URL));

  //repository
  Get.lazyPut(
    () =>
        FamousProductRepo(apiClient: Get.find()),
  );
  Get.lazyPut(
    () => RecommendedProductRepo(
        apiClient: Get.find()),
  );
  Get.lazyPut(
    () => CartRepo(),
  );

  //controller
  Get.lazyPut(
    () => FamousProductCon(
        famousProductRepo: Get.find()),
  );
  Get.lazyPut(
    () => RecommendedProductCon(
        recommendedProductRepo: Get.find()),
  );
  Get.lazyPut(
    () => CartCon(cartRepo: Get.find()),
  );
}
