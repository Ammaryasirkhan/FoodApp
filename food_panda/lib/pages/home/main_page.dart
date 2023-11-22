import 'package:flutter/material.dart';
import 'package:food_panda/pages/home/home_page_body.dart';
import 'package:food_panda/utils/colors.dart';
import 'package:food_panda/utils/dimensions.dart';

import '../../widgets/Texts/big_text.dart';
import '../../widgets/Texts/small_text.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() =>
      _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    // print("current" +
    // MediaQuery.of(context).size.height.toString() +
    // MediaQuery.of(context).size.width.toString());
    return Scaffold(
      body: Column(
        children: [
          Container(
              margin: EdgeInsets.only(
                  top: Dimensions.height45,
                  bottom: Dimensions.height30),
              padding: EdgeInsets.only(
                  left: Dimensions.width20,
                  right: Dimensions.width20),
              // height: Dimensions.pageViewContainer,
              // width: Dimensions.pageViewContainer,
              color: ColorRes.white,
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment
                        .spaceBetween,
                children: [
                  Column(
                    //crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BigText(
                        text: "Ammar Yasir Khan",
                        color: ColorRes.app,
                        size: 20,
                        overflow:
                            TextOverflow.ellipsis,
                      ),
                      Row(
                        children: [
                          SmallText(
                            text: "city",
                            height: 1,
                          ),
                          Icon(Icons
                              .arrow_drop_down_rounded)
                        ],
                      )
                    ],
                  ),
                  Center(
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(
                                10),
                        color: ColorRes.app,
                      ),
                      child: Icon(Icons.search),
                    ),
                  )
                ],
              )),
          Expanded(
              child: SingleChildScrollView(
                  child: HomePageBody())),
        ],
      ),
    );
  }
}
