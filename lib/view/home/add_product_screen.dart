import 'package:demo_ecommerce/controller/home_controller.dart';
import 'package:demo_ecommerce/model/product_model.dart';
import 'package:demo_ecommerce/widgets/custom_rounded_button.dart';
import 'package:flutter/material.dart';
import 'package:demo_ecommerce/core/size_config.dart';
import 'package:demo_ecommerce/view/home/control_screen.dart';
import 'package:demo_ecommerce/widgets/custom_text.dart';
import 'package:demo_ecommerce/widgets/custom_text_form_field.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

import '../../constants.dart';

class AddProductScreen extends StatelessWidget {
  final globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final defaultSize = SizeConfig.defaultSize;
    final homeProvider = Provider.of<HomeController>(context);
    final appBar = AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          homeProvider.imageFileProductModel = null;
          Get.offAll(ControlScreen());
        },
        color: Color(0xffC5CCD6),
      ),
    );

    return Scaffold(
      appBar: appBar,
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: SingleChildScrollView(
          child: Form(
            key: globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  label: 'Title',
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter the title';
                    return null;
                  },
                  onSaved: (value) {
                    homeProvider.productModel!.title = value;
                  },
                ),
                SizedBox(
                  height: defaultSize * 2,
                ),
                CustomTextFormField(
                  label: 'Description',
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter the Description';
                    return null;
                  },
                  onSaved: (value) {
                    homeProvider.productModel!.description = value;
                  },
                ),
                SizedBox(
                  height: defaultSize * 2,
                ),
                CustomTextFormField(
                  label: 'Price',
                  textInputType: TextInputType.number,
                  suffixIcon: Icon(Icons.money_off),
                  validator: (value) {
                    if (value!.isEmpty) return 'Please enter the Price';
                    if (int.parse(value) < 0) return 'Invalid number';
                    return null;
                  },
                  onSaved: (value) {
                    homeProvider.productModel!.price = value;
                  },
                ),
                SizedBox(
                  height: defaultSize * 2,
                ),
                CustomTextFormField(
                  label: 'Sale price',
                  textInputType: TextInputType.number,
                  suffixIcon: Icon(Icons.money_off),
                  onSaved: (value) {
                    homeProvider.productModel!.salePrice = value;
                  },
                ),
                SizedBox(
                  height: defaultSize * 2,
                ),
                CustomTextFormField(
                  label: 'The number of pieces',
                  textInputType: TextInputType.number,
                  validator: (value) {
                    if (value!.isEmpty)
                      return 'Please enter the the number of pieces';
                    if (int.parse(value) < 0) return 'Invalid number';
                    return null;
                  },
                  onSaved: (value) {
                    homeProvider.productModel!.countInStock = value;
                  },
                ),
                SizedBox(
                  height: defaultSize * 2,
                ),
                AllSizesWidgets(defaultSize: defaultSize),
                SizedBox(
                  height: defaultSize * 5,
                ),
                AllCategoriesWidgets(defaultSize: defaultSize),
                SizedBox(
                  height: defaultSize * 5,
                ),
                CustomText(
                  'Image',
                  fontSize: defaultSize * 2,
                ),
                SizedBox(
                  height: defaultSize * 2,
                ),
                ImageWidget(
                    homeProvider: homeProvider, defaultSize: defaultSize),
                SizedBox(
                  height: defaultSize * 5,
                ),
                CustomRoundedButton(
                  onPressed: () {
                    /// Add a product here
                    if (globalKey.currentState!.validate()) {
                      if (homeProvider.imageFile == null) {
                        Fluttertoast.showToast(msg: 'Image is required');
                      } else if (homeProvider.getSelectedSize() == null) {
                        Fluttertoast.showToast(msg: 'Size is required');
                      } else if (homeProvider.getSelectedCategory() == null) {
                        Fluttertoast.showToast(msg: 'Category is required');
                      } else {
                        globalKey.currentState!.save();
                        homeProvider.addProduct(homeProvider.productModel!);
                        homeProvider.imageFileProductModel = null;
                        homeProvider.imageFile = null;
                        homeProvider.productModel = ProductModel();
                        homeProvider.makeSizesAndCategoriesNull();
                        Fluttertoast.showToast(
                            msg: 'Product added successfully');
                        Get.back();
                        print(homeProvider.productModels.first);
                      }
                    }
                  },
                  height: defaultSize * 4.5,
                  color: Color(kButtonColor),
                  width: double.infinity,
                  child: CustomText(
                    'Add',
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ImageWidget extends StatelessWidget {
  const ImageWidget({
    Key? key,
    required this.homeProvider,
    required this.defaultSize,
  }) : super(key: key);

  final HomeController homeProvider;
  final double defaultSize;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () async {
          await homeProvider.getImage();
        },
        child: Container(
          child: Center(
            child: homeProvider.isLoading
                ? CircularProgressIndicator()
                : (homeProvider.imageFile == null
                    ? Text('Pick the image')
                    : ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.file(
                          homeProvider.imageFile!,
                          height: defaultSize * 25,
                          width: defaultSize * 25,
                          fit: BoxFit.fill,
                        ),
                      )),
          ),
          height: defaultSize * 25,
          width: defaultSize * 25,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class AllCategoriesWidgets extends StatelessWidget {
  const AllCategoriesWidgets({
    Key? key,
    required this.defaultSize,
  }) : super(key: key);

  final double defaultSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          'Category',
          fontSize: defaultSize * 2,
        ),
        SizedBox(
          height: defaultSize * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CategoryWidget(
              defaultSize: defaultSize,
              size: 'Male',
              index: 0,
            ),
            CategoryWidget(
              defaultSize: defaultSize,
              size: 'Female',
              index: 1,
            ),
            CategoryWidget(
              defaultSize: defaultSize,
              size: 'Kids',
              index: 2,
            ),
          ],
        ),
      ],
    );
  }
}

class AllSizesWidgets extends StatelessWidget {
  const AllSizesWidgets({
    Key? key,
    required this.defaultSize,
  }) : super(key: key);

  final double defaultSize;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
          'Size',
          fontSize: defaultSize * 2,
        ),
        SizedBox(
          height: defaultSize * 2,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizeWidget(
              defaultSize: defaultSize,
              size: 'S',
              index: 0,
            ),
            SizeWidget(
              defaultSize: defaultSize,
              size: 'M',
              index: 1,
            ),
            SizeWidget(
              defaultSize: defaultSize,
              size: 'L',
              index: 2,
            ),
            SizeWidget(
              defaultSize: defaultSize,
              size: 'XL',
              index: 3,
            ),
          ],
        ),
      ],
    );
  }
}

class SizeWidget extends StatelessWidget {
  final double? defaultSize;
  final String? size;
  final int? index;

  SizeWidget({this.defaultSize, this.size, this.index});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HomeController>(context);
    return GestureDetector(
      onTap: () {
        prov.changeSelectedSize(index!);
      },
      child: Container(
        child: Center(
          child: CustomText(
            size!,
            fontSize: defaultSize! * 1.8,
            color: prov.sizesBool[index!] ? Colors.white : Colors.black,
          ),
        ),
        height: defaultSize! * 5,
        width: defaultSize! * 5,
        color: prov.sizesBool[index!] ? Colors.blueAccent : Color(0xffF3F3F3),
      ),
    );
  }
}

class CategoryWidget extends StatelessWidget {
  final double? defaultSize;
  final String? size;
  final int? index;

  CategoryWidget({this.defaultSize, this.size, this.index});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<HomeController>(context);
    return GestureDetector(
      onTap: () {
        prov.changeSelectedCategory(index!);
      },
      child: Container(
        child: Center(
          child: CustomText(
            size!,
            fontSize: defaultSize! * 1.8,
            color: prov.categoriesBool[index!] ? Colors.white : Colors.black,
          ),
        ),
        height: defaultSize! * 5,
        width: defaultSize! * 9,
        color:
            prov.categoriesBool[index!] ? Colors.blueAccent : Color(0xffF3F3F3),
      ),
    );
  }
}
