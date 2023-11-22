import 'package:flutter/material.dart';
import 'package:food_panda/controlers/famous_product_controller.dart';
import 'package:food_panda/controlers/recommended_food_controller.dart';
import 'package:food_panda/pages/cart/cart_page.dart';
import 'package:food_panda/utils/app_constants.dart';
import 'package:food_panda/utils/colors.dart';
import 'package:food_panda/utils/dimensions.dart';
import 'package:food_panda/widgets/Texts/big_text.dart';
import 'package:food_panda/widgets/Texts/expanded_text_widget.dart';
import 'package:food_panda/widgets/icons/app_icon.dart';
import 'package:get/get.dart';

import '../../Routes/routes_help.dart';
import '../../controlers/cart_controller.dart';

// ignore: must_be_immutable
class RecFoodDetails extends StatelessWidget {
  int pageId;
  RecFoodDetails({Key? key, required this.pageId})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var product =
        Get.find<RecommendedProductCon>()
            .recommendedProductsList[pageId];
    Get.find<FamousProductCon>().initProduct(
        product, Get.find<CartCon>());
    return Scaffold(
        backgroundColor: ColorRes.white,
        body: CustomScrollView(slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            automaticallyImplyLeading: false,
            title: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      Get.toNamed(
                          Routes.getInitial());
                    },
                    child: AppIconsWidget(
                      icon: Icons.cancel,
                    ),
                  ),
                  // AppIconsWidget(
                  //   icon: Icons.shopping_cart,
                  // )
                  GetBuilder<FamousProductCon>(
                    builder: (controller) {
                      return Stack(
                        children: [
                          GestureDetector(
                            onTap: () {
                              Get.to(() =>
                                  CartPage());
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
                ]),
            bottom: PreferredSize(
                preferredSize:
                    Size.fromHeight(20),
                child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft:
                              Radius.circular(
                                  Dimensions
                                      .height20),
                          topRight:
                              Radius.circular(
                                  Dimensions
                                      .height20)),
                      color: ColorRes.white,
                    ),
                    padding: EdgeInsets.only(
                        bottom:
                            Dimensions.height10,
                        top: Dimensions.height10),
                    // color: ColorRes.white,
                    width: double.maxFinite,
                    child: Center(
                        child: BigText(
                      size: Dimensions.text26,
                      text: product.name!,
                    )))),
            pinned: true,
            backgroundColor: ColorRes.app,
            expandedHeight: 300,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.network(
                AppConstants.BASE_URL +
                    AppConstants.UPLOAD_URL +
                    product.img!,
                fit: BoxFit.cover,
                width: double.maxFinite,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                    padding: EdgeInsets.symmetric(
                        horizontal:
                            Dimensions.width20),
                    child: ExpandedTextWidget(
                      text: product.description,
                    )),
              ],
            ),
          )
        ]),
        bottomNavigationBar:
            GetBuilder<FamousProductCon>(
          builder: (controller) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical:
                          Dimensions.height15,
                      horizontal:
                          Dimensions.height20 *
                              2),
                  child: Row(
                    mainAxisAlignment:
                        MainAxisAlignment
                            .spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller
                              .setQuantity(false);
                        },
                        child: AppIconsWidget(
                          icon: Icons.remove,
                          backgroundColor:
                              ColorRes.app,
                          iconColor: Colors.white,
                        ),
                      ),
                      BigText(
                        size: Dimensions.text26,
                        text:
                            " \$ ${product.price!} X ${controller.inCartItem} ",
                      ),
                      GestureDetector(
                        onTap: () {
                          controller
                              .setQuantity(true);
                        },
                        child:
                            const AppIconsWidget(
                          icon: Icons.add,
                          backgroundColor:
                              ColorRes.app,
                          iconColor: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: Dimensions.bottomheight,
                  padding: EdgeInsets.all(
                    Dimensions.height30,
                  ),
                  decoration: BoxDecoration(
                      color: ColorRes.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius
                              .circular(Dimensions
                                      .height20 *
                                  2),
                          topRight: Radius
                              .circular(Dimensions
                                      .height20 *
                                  2))),
                  child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment
                              .spaceBetween,
                      children: [
                        Container(
                            padding: EdgeInsets
                                .all(Dimensions
                                    .height15),
                            decoration:
                                BoxDecoration(
                              color: ColorRes
                                  .whiteSmoke,
                              borderRadius:
                                  BorderRadius.circular(
                                      Dimensions
                                          .height20),
                            ),
                            child: Icon(
                              Icons.favorite,
                              color: ColorRes.app,
                            )),
                        GestureDetector(
                          onTap: () {
                            controller
                                .addItem(product);
                          },
                          child: Container(
                            padding: EdgeInsets
                                .all(Dimensions
                                    .height15),
                            decoration:
                                BoxDecoration(
                              color: ColorRes.app,
                              borderRadius:
                                  BorderRadius.circular(
                                      Dimensions
                                          .height20),
                            ),
                            child: BigText(
                              text:
                                  '\$ ${product.price!} | Add to cart ',
                              color: Colors.white,
                            ),
                          ),
                        )
                      ]),
                )
              ],
            );
          },
        ));
  }
}
