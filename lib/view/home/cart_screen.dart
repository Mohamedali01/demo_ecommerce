import 'package:demo_ecommerce/controller/home_controller.dart';
import 'package:demo_ecommerce/core/size_config.dart';
import 'package:demo_ecommerce/view/home/product_details_screen.dart';
import 'package:demo_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeController>(context);
    final defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomText(
                'Total: ${homeProvider.totalAmount()}',
                color: Colors.white,
                fontSize: defaultSize * 2.5,
              ),
            ),
            Expanded(
              child: ListView.separated(
                itemBuilder: (_, index) {
                  return GestureDetector(
                    onTap: () {
                      Get.to(
                          ProductDetailsScreen(homeProvider.cartModels[index]));
                    },
                    child: Container(
                      width: double.infinity,
                      height: SizeConfig.screenHeight * 0.21,
                      padding: EdgeInsets.all(25),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CustomText(
                                homeProvider.cartModels[index].title,
                                fontSize: defaultSize * 2,
                                fontWeight: FontWeight.bold,
                              ),
                              SizedBox(
                                height: defaultSize * 1.5,
                              ),
                              CustomText(
                                'Total Price: \$${homeProvider.cartModels[index].price}',
                                fontSize: defaultSize * 2,
                              ),
                              SizedBox(
                                height: defaultSize * 2,
                              ),
                              Container(
                                width: SizeConfig.screenWidth * 0.4,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      child: FaIcon(FontAwesomeIcons.minus),
                                      onTap: () {
                                        /// Remove cart item
                                        homeProvider
                                            .decreaseCartItemCount(index);
                                      },
                                    ),
                                    CustomText(homeProvider
                                        .cartModels[index].numberOfPieces
                                        .toString()),
                                    IconButton(
                                      icon: Icon(Icons.add),
                                      onPressed: () {
                                        /// Add a cart item
                                        homeProvider
                                            .increaseCartItemCount(index);
                                      },
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          Container(
                              height: double.infinity,
                              color: Colors.black,
                              width: 1),
                          homeProvider.productModels[index].imageFilePath ==
                                  null
                              ? Container(
                                  height: SizeConfig.screenWidth * 0.45,
                                  width: SizeConfig.screenWidth * 0.35,
                                  child: Image.asset(
                                    homeProvider.productModels[index].image!,
                                    fit: BoxFit.fill,
                                  ),
                                )
                              : Container(
                                  height: SizeConfig.screenWidth * 0.45,
                                  width: SizeConfig.screenWidth * 0.5,
                                  child: Image.file(
                                    homeProvider
                                        .productModels[index].imageFilePath!,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                        ],
                      ),
                    ),
                  );
                },
                itemCount: homeProvider.cartModels.length,
                separatorBuilder: (BuildContext context, int index) {
                  return SizedBox(
                    height: defaultSize * 2,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
