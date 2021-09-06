import 'package:demo_ecommerce/constants.dart';
import 'package:demo_ecommerce/controller/home_controller.dart';
import 'package:demo_ecommerce/core/size_config.dart';
import 'package:demo_ecommerce/model/product_model.dart';
import 'package:demo_ecommerce/view/home/add_product_screen.dart';
import 'package:demo_ecommerce/view/home/cart_screen.dart';
import 'package:demo_ecommerce/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  final ProductModel productModel;

  ProductDetailsScreen(this.productModel);

  final List<String> listOfSizes = ['S', 'M', 'L', 'XL'];

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeController>(context);
    final defaultSize = SizeConfig.defaultSize;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        actions: [
          IconButton(
              onPressed: () {
                homeProvider.toggleFavourite(productModel);
                },
              icon: productModel.favourite
                  ? Icon(
                      Icons.favorite,
                      color: Colors.red,
                      size: 30,
                    )
                  : Icon(
                      Icons.favorite_border,
                      color: Colors.red,
                    ))
        ],
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  productModel.imageFilePath == null
                      ? Container(
                          height: SizeConfig.screenWidth * 0.7,
                          width: double.infinity,
                          child: Image.asset(
                            productModel.image!,
                            fit: BoxFit.fill,
                          ),
                        )
                      : Container(
                          height: SizeConfig.screenWidth * 0.45,
                          width: SizeConfig.screenWidth * 0.5,
                          child: Image.file(
                            productModel.imageFilePath!,
                            fit: BoxFit.fill,
                          ),
                        ),
                  SizedBox(
                    height: defaultSize * 2,
                  ),
                  CustomText(
                    productModel.title,
                    fontSize: defaultSize * 2.5,
                  ),
                  SizedBox(
                    height: defaultSize * 2,
                  ),
                  SizedBox(
                    width: SizeConfig.screenWidth * 0.2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        if (productModel.salePrice != null)
                          CustomText(
                            '\$${productModel.salePrice}',
                            color: Colors.blueAccent,
                            fontSize: defaultSize * 2,
                          ),
                        CustomText(
                          '\$${productModel.price}',
                          deletedText: productModel.salePrice != null,
                          color: Colors.black,
                          fontSize: productModel.salePrice != null
                              ? defaultSize * 1.4
                              : defaultSize * 2,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: defaultSize * 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        // width: SizeConfig.screenWidth * 0.4,
                        child: Container(
                          child: Center(
                            child: CustomText(
                              productModel.rating!.toStringAsFixed(1),
                              color: Colors.white,
                              fontSize: defaultSize * 1.9,
                            ),
                          ),
                          width: defaultSize * 8,
                          height: defaultSize * 6,
                          decoration: BoxDecoration(
                              color: Colors.blueAccent,
                              borderRadius: BorderRadius.circular(10)),
                        ),
                      ),
                      CustomText(
                        '${productModel.numberOfReviews.toString()} Reviews',
                        color: Colors.blueAccent,
                        fontSize: defaultSize * 2,
                        fontWeight: FontWeight.bold,
                      )
                    ],
                  ),
                  SizedBox(
                    height: defaultSize * 4,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black12,
                  ),
                  SizedBox(
                    height: defaultSize * 4,
                  ),
                  CustomText(
                    'Description',
                    fontSize: defaultSize * 2,
                  ),
                  SizedBox(
                    height: defaultSize * 2,
                  ),
                  RichText(
                    text: TextSpan(
                      text: productModel.description,
                      style: TextStyle(
                          fontSize: defaultSize * 1.7, color: Colors.black),
                    ),
                  ),
                  SizedBox(
                    height: defaultSize * 4,
                  ),
                  Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.black12,
                  ),
                  SizedBox(
                    height: defaultSize * 4,
                  ),
                  CustomText(
                    'Selected Size',
                    fontSize: defaultSize * 2,
                  ),
                  SizedBox(
                    height: defaultSize * 4,
                  ),
                  SizedBox(
                    height: defaultSize * 5,
                    child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (_, index) {
                        Sizes? size = productModel.size;
                        return Container(
                          height: defaultSize * 5,
                          width: defaultSize * 5,
                          decoration: BoxDecoration(
                            color: homeProvider.checkWhichSize(
                                    size!, listOfSizes[index])
                                ? Colors.blueAccent
                                : Color(0xffF3F3F3),
                          ),
                          child: Center(
                            child: CustomText(
                              listOfSizes[index],
                              fontSize: defaultSize * 2,
                              color: homeProvider.checkWhichSize(
                                      size, listOfSizes[index])
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) {
                        return SizedBox(
                          width: defaultSize * 5,
                        );
                      },
                      itemCount: listOfSizes.length,
                    ),
                  ),
                  SizedBox(
                    height: defaultSize * 10,
                  )
                ],
              ),
            ),
            InkWell(
              onTap: () {
                homeProvider.addToCart(
                  ProductModel(
                      numberOfReviews: productModel.numberOfReviews,
                      rating: productModel.rating,
                      size: productModel.size,
                      category: productModel.category,
                      favourite: productModel.favourite,
                      salePrice: productModel.salePrice,
                      price: productModel.price,
                      description: productModel.description,
                      image: productModel.image,
                      countInStock: productModel.countInStock,
                      imageFilePath: productModel.imageFilePath,
                      title: productModel.title,
                      numberOfPieces: 1),
                );
                Fluttertoast.showToast(
                    msg: 'Product added to cart successfully');
                Get.back();
              },
              child: Container(
                height: SizeConfig.screenHeight * 0.08,
                color: Colors.blueAccent,
                child: Center(
                    child: CustomText(
                  'Add to cart',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: defaultSize * 3,
                )),
              ),
            )
          ],
        ),
      ),
    );
  }
}
