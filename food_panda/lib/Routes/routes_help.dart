import 'package:food_panda/pages/food/food_details_page.dart';
import 'package:food_panda/pages/home/main_page.dart';
import 'package:get/get.dart';

import '../pages/food/rec_food_details.dart';

class Routes {
  static const String initialroute = "/";
  static const String famousFood = "/famous-food";
  static const String recommendedFood =
      "/rec-food";

  //Functions For ROUTES
  static String getFamousProducts(int pageId) =>
      '$famousFood? padeId=$pageId';
  static String getInitial() => '$initialroute';
  static String getRecommendedProducts(
          int pageId) =>
      '$recommendedFood? padeId=$pageId';

  static List<GetPage> routes = [
    GetPage(
      name: initialroute,
      page: () {
        return MainPage();
      },
      // transition: Transition.fadeIn
    ),
    GetPage(
      name: famousFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return FoodDetailsPage(
            pageId: int.parse(pageId!));
      },
      //transition: Transition.fadeIn
    ),
    GetPage(
      name: recommendedFood,
      page: () {
        var pageId = Get.parameters['pageId'];
        return RecFoodDetails(
            pageId: int.parse(pageId!));
      },
      // transition: Transition.fadeIn
    )
  ];
  //   static const String initialroute = "/";
  //     static const String initialroute = "/";

  // static const String initialroute = "/";
  // static const String initialroute = "/";
  // static const String initialroute = "/";
}
