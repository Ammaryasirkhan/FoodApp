import 'package:food_panda/builders/Apis/apiclient_api.dart';
import 'package:food_panda/utils/app_constants.dart';
import 'package:get/get.dart';

class FamousProductRepo extends GetxService {
  final ApiClient apiClient;
  FamousProductRepo({required this.apiClient});

  Future<Response> getFamousProductList() async {
    return await apiClient
        .getData(AppConstants.FAMOUS_PRODUCT_URI);
  }
}
