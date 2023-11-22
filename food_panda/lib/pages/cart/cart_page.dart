import 'package:flutter/material.dart';
import 'package:food_panda/controlers/cart_controller.dart';
import 'package:food_panda/utils/app_constants.dart';
import 'package:food_panda/utils/colors.dart';
import 'package:food_panda/utils/dimensions.dart';
import 'package:food_panda/widgets/Texts/big_text.dart';
import 'package:food_panda/widgets/Texts/small_text.dart';
import 'package:food_panda/widgets/icons/app_icon.dart';
import 'package:get/get.dart';

import '../../Routes/routes_help.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        Positioned(
          left: Dimensions.width40,
          right: Dimensions.width40,
          top: 100,
          child: Row(
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween,
              children: [
                AppIconsWidget(
                  icon: Icons.arrow_back_ios,
                  backgroundColor: ColorRes.app,
                  iconColor: ColorRes.white,
                  size: Dimensions.iconsize24,
                ),
                GestureDetector(
                  onTap: () {
                    Get.to(Routes.initialroute);
                  },
                  child: AppIconsWidget(
                    icon: Icons.home_outlined,
                    backgroundColor: ColorRes.app,
                    iconColor: ColorRes.white,
                    size: Dimensions.iconsize24,
                  ),
                ),
                AppIconsWidget(
                  icon: Icons.shopping_cart,
                  backgroundColor: ColorRes.app,
                  iconColor: ColorRes.white,
                  size: Dimensions.iconsize24,
                )
              ]),
        ),
        Positioned(
          top: Dimensions.height20 * 5,
          left: Dimensions.width20,
          right: Dimensions.width20,
          bottom: 0,
          child: Container(
            // color: Colors.amber,
            child: MediaQuery.removePadding(
                context: context,
                removeTop: true,
                child: GetBuilder<CartCon>(
                  builder: (cartController) {
                    return ListView.builder(
                        itemCount: cartController
                            .getItems.length,
                        itemBuilder: (_, index) {
                          return Container(
                            // color: Colors.black12,
                            height: Dimensions
                                .bottomheight,
                            width:
                                double.infinity,
                            margin: EdgeInsets.only(
                                bottom: Dimensions
                                    .height10),
                            child: Row(children: [
                              Container(
                                height: Dimensions
                                        .width20 *
                                    5,
                                width: Dimensions
                                        .width20 *
                                    5,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        image: NetworkImage(AppConstants.BASE_URL +
                                            AppConstants
                                                .BASE_URL +
                                            cartController
                                                .getItems[
                                                    index]
                                                .img!),
                                        fit: BoxFit
                                            .cover),
                                    color: Colors
                                        .blueAccent,
                                    borderRadius:
                                        BorderRadius.circular(
                                            Dimensions
                                                .height20)),
                              ),
                              SizedBox(
                                width: Dimensions
                                    .height12,
                              ),
                              Expanded(
                                child: Container(
                                  height: Dimensions
                                          .height20 *
                                      5,
                                  child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment
                                              .start,
                                      mainAxisAlignment:
                                          MainAxisAlignment
                                              .spaceEvenly,
                                      children: [
                                        BigText(
                                            text: cartController
                                                .getItems[index]
                                                .name!),
                                        SmallText(
                                          text:
                                              'Amazing',
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            BigText(
                                              text:
                                                  cartController.getItems[index].price!.toString(),
                                              color:
                                                  Colors.red,
                                            ),
                                            Container(
                                              padding:
                                                  EdgeInsets.all(Dimensions.width10),
                                              decoration:
                                                  BoxDecoration(
                                                color: ColorRes.whiteSmoke,
                                                borderRadius: BorderRadius.circular(Dimensions.height20),
                                              ),
                                              child:
                                                  Row(children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    //  famousProducts.setQuantity(false);
                                                  },
                                                  child: Icon(
                                                    Icons.remove,
                                                    color: ColorRes.black,
                                                  ),
                                                ),
                                                SizedBox(
                                                  width: Dimensions.height10 / 2,
                                                ),
                                                BigText(text: "0"
                                                    //famousProducts.inCartItem.toString(),
                                                    ),
                                                SizedBox(
                                                  width: Dimensions.height10 / 2,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    // famousProducts.setQuantity(true);
                                                  },
                                                  child: Icon(
                                                    Icons.add,
                                                    color: ColorRes.black,
                                                  ),
                                                )
                                              ]),
                                            ),
                                          ],
                                        )
                                      ]),
                                ),
                              )
                            ]),
                          );
                        });
                  },
                )),
          ),
        )
      ]),
    );
  }
}
