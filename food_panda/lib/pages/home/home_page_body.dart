import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:food_panda/controlers/famous_product_controller.dart';
import 'package:food_panda/controlers/recommended_food_controller.dart';
import 'package:food_panda/models/famous_products_model.dart';
import 'package:food_panda/utils/app_constants.dart';
import 'package:food_panda/utils/colors.dart';
import 'package:food_panda/utils/dimensions.dart';
import 'package:food_panda/widgets/Texts/big_text.dart';
import 'package:food_panda/widgets/Texts/small_text.dart';
import 'package:food_panda/widgets/food_column.dart';
import 'package:food_panda/widgets/icon_and_text.dart';
import 'package:get/get.dart';

import '../../Routes/routes_help.dart';

class HomePageBody extends StatefulWidget {
  const HomePageBody({super.key});

  @override
  State<HomePageBody> createState() =>
      _HomePageBodyState();
}

class _HomePageBodyState
    extends State<HomePageBody> {
  PageController pageController =
      PageController(viewportFraction: 0.85);
  var _currentPageValue = 0.0;
  double _scaleFactor = 0.8;
  double _height = 220;

  @override
  void initState() {
    super.initState();
    pageController.addListener(() {
      setState(() {
        _currentPageValue = pageController.page!;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GetBuilder<FamousProductCon>(
          builder: (famousProducts) {
            return famousProducts.isLoaded
                ? Container(
                    height: Dimensions.pageView,
                    //color: ColorRes.app,
                    child: GestureDetector(
                      // onTap: () {
                      //   Get.toNamed(Routes
                      //       .getFamousProducts(index));
                      // },
                      child: PageView.builder(
                        controller:
                            pageController,
                        itemCount: famousProducts
                            .famousProductsList
                            .length,
                        itemBuilder:
                            (context, position) {
                          return _buildPageItems(
                              position,
                              famousProducts
                                      .famousProductsList[
                                  position]);
                        },
                      ),
                    ),
                  )
                : CircularProgressIndicator(
                    color: ColorRes.app,
                  );
          },
        ),
        GetBuilder<FamousProductCon>(
          builder: (famousProducts) {
            return DotsIndicator(
              dotsCount: famousProducts
                      .famousProductsList.isEmpty
                  ? 1
                  : famousProducts
                      .famousProductsList.length,
              position: _currentPageValue,
              decorator: DotsDecorator(
                activeColor: ColorRes.app,
                size: const Size.square(9.0),
                activeSize: const Size(18.0, 9.0),
                activeShape:
                    RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(
                                5.0)),
              ),
            );
          },
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        Container(
          margin: EdgeInsets.only(
              left: Dimensions.height30),
          child: Row(
              crossAxisAlignment:
                  CrossAxisAlignment.end,
              children: [
                BigText(
                  text: "Recommeneded",
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 3),
                  child: BigText(
                    text: ".",
                  ),
                ),
                SizedBox(
                  width: Dimensions.width10,
                ),
                Container(
                  margin:
                      EdgeInsets.only(bottom: 3),
                  child: SmallText(
                    text: "Food Pairing",
                    color: Colors.grey,
                  ),
                )
              ]),
        ),
        SizedBox(
          height: Dimensions.height30,
        ),
        GetBuilder<RecommendedProductCon>(
            builder: (recommendedProducts) {
          return recommendedProducts.isLoaded
              ? ListView.builder(
                  shrinkWrap: true,
                  itemCount: recommendedProducts
                      .recommendedProductsList
                      .length,
                  physics:
                      NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        Get.toNamed(Routes
                            .getRecommendedProducts(
                                index));
                      },
                      child: Container(
                        height: Dimensions
                            .pageViewTextContainer,
                        width: Dimensions
                            .pageViewTextContainer,
                        margin: EdgeInsets.only(
                            left: Dimensions
                                .width20,
                            right: Dimensions
                                .width20,
                            bottom: Dimensions
                                .height10),
                        child: Row(children: [
                          Container(
                            height: Dimensions
                                .pageViewTextContainer,
                            width: Dimensions
                                .pageViewTextContainer,
                            decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.circular(
                                        Dimensions
                                            .height20),
                                color:
                                    Colors
                                        .white24,
                                image: DecorationImage(
                                    image: NetworkImage(AppConstants
                                            .BASE_URL +
                                        AppConstants
                                            .UPLOAD_URL +
                                        recommendedProducts
                                            .recommendedProductsList[
                                                index]
                                            .img!),
                                    fit: BoxFit
                                        .cover)),
                          ),
                          Expanded(
                            child: Container(
                              height: Dimensions
                                  .pageViewTextContainer,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(
                                          Dimensions
                                              .height20),
                                      bottomRight:
                                          Radius.circular(Dimensions
                                              .height20)),
                                  color: ColorRes
                                      .whiteSmoke),
                              child: Padding(
                                padding:
                                    const EdgeInsets
                                        .only(
                                        left: 8),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                    mainAxisAlignment:
                                        MainAxisAlignment
                                            .center,
                                    children: [
                                      BigText(
                                        text:
                                            "Street food in Pakistan ",
                                        overflow:
                                            TextOverflow
                                                .ellipsis,
                                      ),
                                      SizedBox(
                                        height: Dimensions
                                            .height12,
                                      ),
                                      SmallText(
                                        text: recommendedProducts
                                            .recommendedProductsList[
                                                index]
                                            .name!,
                                      ),
                                      SizedBox(
                                        height: Dimensions
                                            .height12,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment
                                                .spaceEvenly,
                                        children: [
                                          const IconAndTextWidget(
                                            icon:
                                                Icons.circle,
                                            text:
                                                'Normal',
                                            iconColor:
                                                ColorRes.bittersweet,
                                          ),
                                          SizedBox(
                                              width:
                                                  Dimensions.width5),
                                          const IconAndTextWidget(
                                            icon:
                                                Icons.location_on,
                                            text:
                                                '17km',
                                            iconColor:
                                                ColorRes.ferrariRed,
                                          ),
                                          SizedBox(
                                              width:
                                                  Dimensions.width5),
                                          const IconAndTextWidget(
                                            icon:
                                                Icons.access_time,
                                            text:
                                                '23 min',
                                            iconColor:
                                                ColorRes.black,
                                          )
                                        ],
                                      )
                                    ]),
                              ),
                            ),
                          )
                        ]),
                      ),
                    );
                  },
                )
              : CircularProgressIndicator(
                  color: ColorRes.app,
                );
        })
      ],
    );
  }

  Widget _buildPageItems(int index,
      ProductModel famousProductsList) {
    Matrix4 matrix = new Matrix4.identity();
    if (index == _currentPageValue.floor()) {
      var currScale = 1 -
          (_currentPageValue - index) *
              (1 - _scaleFactor);
      var currTrans =
          _height * (1 - currScale) / 2;
      matrix =
          Matrix4.diagonal3Values(1, currScale, 1)
            ..setTranslationRaw(0, currTrans, 0);
    } else if (index ==
        _currentPageValue.floor() + 1) {
      var currScale = _scaleFactor +
          (_currentPageValue - index + 1);
      var currTrans =
          _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(
          1, currScale, 1);
      matrix =
          Matrix4.diagonal3Values(1, currScale, 1)
            ..setTranslationRaw(0, currTrans, 0);
    } else if (index ==
        _currentPageValue.floor() - 1) {
      var currScale = 1 -
          (_currentPageValue - index) *
              (1 - _scaleFactor);
      var currTrans =
          _height * (1 - currScale) / 2;
      matrix = Matrix4.diagonal3Values(
          1, currScale, 1);
      matrix =
          Matrix4.diagonal3Values(1, currScale, 1)
            ..setTranslationRaw(0, currTrans, 0);
    } else {
      var currScale = 0.8;
      matrix =
          Matrix4.diagonal3Values(1, currScale, 1)
            ..setTranslationRaw(
                0,
                _height * (1 - _scaleFactor) / 2,
                1);
    }
    return Transform(
      transform: matrix,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              Get.toNamed(
                  Routes.getFamousProducts(
                      index));
            },
            child: Container(
              height:
                  Dimensions.pageViewContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.width5,
                  right: Dimensions.width5),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(
                          Dimensions.height30),
                  color: ColorRes.iceberg,
                  image: DecorationImage(
                      image: NetworkImage(
                          AppConstants
                                  .BASE_URL +
                              AppConstants
                                  .UPLOAD_URL +
                              famousProductsList
                                  .img!),
                      fit: BoxFit.cover)),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              // height: 150,
              height: Dimensions
                  .pageViewTextContainer,
              margin: EdgeInsets.only(
                  left: Dimensions.height30,
                  right: Dimensions.height30,
                  bottom: Dimensions.height30),
              // padding: EdgeInsets.only(bottom: 10),
              decoration: BoxDecoration(
                  borderRadius:
                      BorderRadius.circular(
                          Dimensions.height20),
                  color: ColorRes.aquaHaze,
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xFFe8e8e8),
                        blurRadius: 5,
                        offset: Offset(0, 5)),
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        offset: Offset(-5, 0)),
                    BoxShadow(
                        color: Colors.white,
                        blurRadius: 5,
                        offset: Offset(5, 0))
                  ]
                  // image: DecorationImage(
                  //     image: AssetImage("assets/image/food1.jpg"),
                  //     fit: BoxFit.cover)),
                  ),
              child: Container(
                padding: EdgeInsets.only(
                    left: Dimensions.height15,
                    right: Dimensions.height15,
                    top: Dimensions.height15),
                child: FoodColumnWidget(
                  text: "Nehari Lahore",
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
