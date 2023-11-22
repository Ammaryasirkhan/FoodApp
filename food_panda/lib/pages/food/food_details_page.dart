import 'package:flutter/material.dart';
import 'package:food_panda/controlers/cart_controller.dart';
import 'package:food_panda/pages/cart/cart_page.dart';
import 'package:food_panda/utils/app_constants.dart';
import 'package:food_panda/utils/dimensions.dart';
import 'package:food_panda/widgets/Texts/expanded_text_widget.dart';
import 'package:food_panda/widgets/icons/app_icon.dart';
import 'package:get/get.dart';

import '../../Routes/routes_help.dart';
import '../../controlers/famous_product_controller.dart';
import '../../utils/colors.dart';
import '../../widgets/Texts/big_text.dart';
import '../../widgets/food_column.dart';

// ignore: must_be_immutable
class FoodDetailsPage extends StatelessWidget {
  int pageId;
  FoodDetailsPage(
      {Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product = Get.find<FamousProductCon>()
        .famousProductsList[pageId];
    Get.find<FamousProductCon>().initProduct(
        product, Get.find<CartCon>());
    return Scaffold(
        backgroundColor: Colors.white,
        body: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Container(
                width: double.maxFinite,
                height: Dimensions.fooddetails,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                  AppConstants.BASE_URL +
                      AppConstants
                          .FAMOUS_PRODUCT_URI +
                      product.img!,
                ))),
              )),
          Positioned(
            top: Dimensions.height45,
            left: Dimensions.height20,
            right: Dimensions.height20,
            child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Get.to(Routes.getInitial());
                  },
                  child: AppIconsWidget(
                    icon: Icons.arrow_back_ios,
                    size: Dimensions.iconsize24,
                  ),
                ),
                GetBuilder<FamousProductCon>(
                  builder: (controller) {
                    return Stack(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.to(
                                () => CartPage());
                          },
                          child: AppIconsWidget(
                            icon: Icons
                                .shopping_bag_sharp,
                            size: Dimensions
                                .iconsize24,
                          ),
                        ),
                        Get.find<FamousProductCon>()
                                    .totalItems >=
                                1
                            ? Positioned(
                                right: 0,
                                top: 0,
                                child:
                                    const AppIconsWidget(
                                  icon: Icons
                                      .circle,
                                  backgroundColor:
                                      ColorRes
                                          .app,
                                  iconColor: Colors
                                      .transparent,
                                  size: 20,
                                ),
                              )
                            : Container(),
                        Get.find<FamousProductCon>()
                                    .totalItems >=
                                1
                            ? Positioned(
                                right: 3,
                                top: 3,
                                child: BigText(
                                    size: 12,
                                    color: ColorRes
                                        .white,
                                    text: Get.find<
                                            FamousProductCon>()
                                        .totalItems
                                        .toString()),
                              )
                            : Container()
                      ],
                    );
                  },
                )
              ],
            ),
          ),
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            top: Dimensions.fooddetails - 20,
            child: Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20,
                  top: Dimensions.height20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(
                          Dimensions.height20),
                      topLeft: Radius.circular(
                          Dimensions.height20)),
                  color: Colors.white),
              child: Column(
                crossAxisAlignment:
                    CrossAxisAlignment.start,
                children: [
                  FoodColumnWidget(
                    text: product.name!,
                  ),
                  SizedBox(
                    height: Dimensions.height20,
                  ),
                  BigText(
                    text: "Introduce",
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: ExpandedTextWidget(
                          text: product
                              .description!),
                    ),
                  )
                ],
              ),
            ),
          )
        ]),
        bottomNavigationBar:
            GetBuilder<FamousProductCon>(
                builder: (famousProducts) {
          return Container(
            height: Dimensions.bottomheight,
            padding: EdgeInsets.all(
              Dimensions.height30,
            ),
            decoration: BoxDecoration(
                color: ColorRes.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(
                        Dimensions.height20 * 2),
                    topRight: Radius.circular(
                        Dimensions.height20 *
                            2))),
            child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.all(
                        Dimensions.height15),
                    decoration: BoxDecoration(
                      color: ColorRes.whiteSmoke,
                      borderRadius:
                          BorderRadius.circular(
                              Dimensions
                                  .height20),
                    ),
                    child: Row(children: [
                      GestureDetector(
                        onTap: () {
                          famousProducts
                              .setQuantity(false);
                        },
                        child: Icon(
                          Icons.remove,
                          color: ColorRes.black,
                        ),
                      ),
                      SizedBox(
                        width:
                            Dimensions.height10 /
                                2,
                      ),
                      BigText(
                        text: famousProducts
                            .inCartItem
                            .toString(),
                      ),
                      SizedBox(
                        width:
                            Dimensions.height10 /
                                2,
                      ),
                      GestureDetector(
                        onTap: () {
                          famousProducts
                              .setQuantity(true);
                        },
                        child: Icon(
                          Icons.add,
                          color: ColorRes.black,
                        ),
                      )
                    ]),
                  ),
                  GestureDetector(
                    onTap: () {
                      famousProducts
                          .addItem(product);
                    },
                    child: Container(
                      padding: EdgeInsets.all(
                          Dimensions.height15),
                      decoration: BoxDecoration(
                        color: ColorRes.app,
                        borderRadius:
                            BorderRadius.circular(
                                Dimensions
                                    .height20),
                      ),
                      child: BigText(
                        text:
                            "\$ ${product.price!}| Add to cart ",
                        color: Colors.white,
                      ),
                    ),
                  )
                ]),
          );
        }));
  }
}
