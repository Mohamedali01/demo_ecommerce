import 'package:demo_ecommerce/controller/home_controller.dart';
import 'package:demo_ecommerce/core/size_config.dart';
import 'package:demo_ecommerce/view/home/product_details_screen.dart';
import 'package:demo_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class FavouritesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeController>(context);
    final defaultSize = SizeConfig.defaultSize;
    homeProvider.getNumberOfFavourites();
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.blueAccent,
        leading: Container(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 15,
              mainAxisSpacing: 30),
          itemCount: homeProvider.getNumberOfFavourites(),
          itemBuilder: (BuildContext context, int index) {
            return GestureDetector(
              onTap: () {
              print('Mohamed Ali ${homeProvider.favouriteModels[index].title}');
                Get.to(
                    ProductDetailsScreen(homeProvider.favouriteModels[index]));
              },
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    homeProvider.favouriteModels[index].imageFilePath == null
                        ? Container(
                            height: SizeConfig.screenWidth * 0.45,
                            width: SizeConfig.screenWidth * 0.5,
                            child: Image.asset(
                              homeProvider.favouriteModels[index].image!,
                              fit: BoxFit.fill,
                            ),
                          )
                        : Container(
                            height: SizeConfig.screenWidth * 0.45,
                            width: SizeConfig.screenWidth * 0.5,
                            child: Image.file(
                              homeProvider.favouriteModels[index].imageFilePath!,
                              fit: BoxFit.fill,
                            ),
                          ),
                    SizedBox(
                      height: defaultSize,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (homeProvider.favouriteModels[index].salePrice != null)
                          CustomText(
                            '\$${homeProvider.favouriteModels[index].price!}',
                            color: Colors.green,
                            fontSize: defaultSize * 2,
                          ),
                        CustomText(
                          '\$${homeProvider.favouriteModels[index].price!}',
                          color: homeProvider.favouriteModels[index].salePrice !=
                                  null
                              ? Colors.red
                              : Colors.black,
                          deletedText:
                              homeProvider.favouriteModels[index].salePrice !=
                                      null
                                  ? true
                                  : false,
                          fontSize: defaultSize * 2,
                        ),
                      ],
                    ),
                    // SizedBox(
                    //   height: SizeConfig.screenHeight * 0.01,
                    // ),
                    Container(
                      height: SizeConfig.screenHeight * 0.022,
                      child: CustomText(
                        homeProvider.favouriteModels[index].title!,
                        color: Colors.black,
                        overflow: TextOverflow.ellipsis,
                        fontSize: SizeConfig.screenHeight * 0.02,
                        // fontSize: defaultSize,
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
