import 'package:flutter/material.dart';
import 'package:food_panda/controlers/recommended_food_controller.dart';
import 'package:food_panda/pages/cart/cart_page.dart';
import 'package:food_panda/pages/home/home_page_body.dart';
import 'package:food_panda/pages/home/main_page.dart';
import 'package:food_panda/utils/app_constants.dart';
import 'package:get/get.dart';
import 'Routes/localhost.dart';
import 'Routes/routes_help.dart';
import 'builders/builder.dart' as dep;

import 'controlers/famous_product_controller.dart';
import 'pages/food/food_details_page.dart';
import 'pages/food/rec_food_details.dart';

void main() async {
  await checkLocalhostConnection();
  // WidgetsFlutterBinding.ensureInitialized();
  await dep.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Get.find<FamousProductCon>()
        .getFamousProductList();
    Get.find<RecommendedProductCon>()
        .getRecommendedProductList();
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
            seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: CartPage(),
      // initialRoute: Routes.famousFood,
      getPages: Routes.routes,
    );
  }
}
