import 'package:food_panda/builders/Apis/apiclient_api.dart';
import 'package:food_panda/utils/app_constants.dart';
import 'package:get/get.dart';

class RecommendedProductRepo extends GetxService {
  final ApiClient apiClient;
  RecommendedProductRepo(
      {required this.apiClient});

  Future<Response>
      getRecommendedProductList() async {
    return await apiClient
        .getData(AppConstants.REC_PRODUCT_URI);
  }
}
