import 'dart:io';

import 'package:demo_ecommerce/model/product_model.dart';
import 'package:demo_ecommerce/view/home/cart_screen.dart';
import 'package:demo_ecommerce/view/home/favourites_screen.dart';
import 'package:demo_ecommerce/view/home/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

import '../constants.dart';

class HomeController with ChangeNotifier {
  /// Lists
  List<ProductModel> _productModels = [
    ProductModel(
        title: 'Shirt ',
        image: 'assets/images/shirt.jpg',
        description:
            'This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt This is a nice shirt ',
        price: '25',
        salePrice: '10',
        favourite: true,
        category: Categories.MEN,
        size: Sizes.S,
        rating: 4.2,
        numberOfReviews: 10),
    ProductModel(
        title: 'T-Shirt',
        image: 'assets/images/t-shirt.jpg',
        description: 'This is a nice shirt',
        price: '80',
        salePrice: '70',
        category: Categories.MEN,
        size: Sizes.M,
        rating: 4.9,
        numberOfReviews: 10),
    ProductModel(
        title: 'Skirt',
        image: 'assets/images/skirt.jpg',
        description: 'This is a nice shirt',
        price: '100',
        salePrice: '20',
        favourite: true,
        size: Sizes.L,
        category: Categories.WOMEN,
        rating: 3.2,
        numberOfReviews: 10),
    ProductModel(
        title: 'Socks',
        image: 'assets/images/socks.jpg',
        description: 'This is a nice shirt',
        price: '25',
        size: Sizes.XL,
        favourite: true,

        category: Categories.MEN,
        rating: 2.2,
        numberOfReviews: 10),
    ProductModel(
        title: 'Shoes',
        image: 'assets/images/shoes.jpg',
        description: 'This is a nice shirt',
        price: '25',
        size: Sizes.S,
        category: Categories.KIDS,
        rating: 4.3,
        numberOfReviews: 10),
  ];
  List<ProductModel> _favouriteModels = [];
  List<ProductModel> _cartModels = [
    ProductModel(
        title: 'Shirt ',
        image: 'assets/images/shirt.jpg',
        description: 'This is a nice shirt',
        price: '25',
        salePrice: '10',
        favourite: true,
        category: Categories.MEN,
        countInStock: '10'),
    ProductModel(
        title: 'T-Shirt',
        image: 'assets/images/t-shirt.jpg',
        description: 'This is a nice shirt',
        price: '80',
        salePrice: '70',
        category: Categories.MEN,
        countInStock: '46'),
  ];

  List<ProductModel> get productModels => _productModels;

  List<ProductModel> get favouriteModels => _favouriteModels;

  List<ProductModel> get cartModels => _cartModels;

  int getNumberOfFavourites() {
    int count = 0;
    for (int i = 0; i < _productModels.length; i++) {
      if (_productModels[i].favourite) {
        _favouriteModels.add(_productModels[i]);
        notifyListeners();
        count++;
      }
    }
    return count;
  }

  void increaseCartItemCount(int index) {
    int count = _cartModels[index].numberOfPieces!;
    count++;
    _cartModels[index].numberOfPieces = count;
    notifyListeners();
  }

  void decreaseCartItemCount(int index) {
    int count = _cartModels[index].numberOfPieces!;
    count--;
    _cartModels[index].numberOfPieces = count;
    notifyListeners();
  }

  double? totalAmount() {
    double price = 0.0;
    for (int i = 0; i < _cartModels.length; i++) {
      price = price +
          (_cartModels[i].numberOfPieces! *
              double.parse(_cartModels[i].price!));
    }
    return price;
  }

  /// UI HANDLING
  File? imageFile;
  bool _isLoading = false;

  File? imageFileProductModel;

  bool get isLoading => _isLoading;
  final picker = ImagePicker();

  Future getImage() async {
    _isLoading = true;
    notifyListeners();
    XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      File file = File(pickedFile.path);
      productModel!.imageFilePath = file;
      _isLoading = false;
      notifyListeners();
      imageFile = file;
      notifyListeners();
    }
  }

  int _currentBottomNavIndex = 0;

  int get currentBottomNavIndex => _currentBottomNavIndex;

  List screens = [HomeScreen(), FavouritesScreen(), CartScreen()];

  void changeBottomNavIndex(int value) {
    _currentBottomNavIndex = value;
    notifyListeners();
  }

  List sizesBool = [false, false, false, false];
  Categories? categories;

  void changeSelectedSize(int number) {
    for (int i = 0; i < sizesBool.length; i++) {
      if (i == number) {
        sizesBool[i] = true;
        notifyListeners();
      } else {
        sizesBool[i] = false;
        notifyListeners();
      }
    }
  }

  List categoriesBool = [false, false, false];

  void changeSelectedCategory(int number) {
    for (int i = 0; i < categoriesBool.length; i++) {
      if (i == number) {
        categoriesBool[i] = true;
        notifyListeners();
      } else {
        categoriesBool[i] = false;
        notifyListeners();
      }
    }
  }

  Sizes? getSelectedSize() {
    int? index;
    for (int i = 0; i < sizesBool.length; i++) {
      if (sizesBool[i] == true) {
        index = i;
        break;
      }
    }
    if (index == null)
      return null;
    else {
      if (index == 0) return Sizes.S;
      if (index == 1) return Sizes.M;
      if (index == 2) return Sizes.L;
      if (index == 3) return Sizes.XL;
    }
  }

  Categories? getSelectedCategory() {
    int? index;
    for (int i = 0; i < categoriesBool.length; i++) {
      if (categoriesBool[i] == true) {
        index = i;
        break;
      }
    }
    if (index == null)
      return null;
    else {
      if (index == 0) return Categories.MEN;
      if (index == 1) return Categories.WOMEN;
      if (index == 2) return Categories.KIDS;
    }
  }

  void makeSizesAndCategoriesNull() {
    for (int i = 0; i < sizesBool.length; i++) {
      sizesBool[i] = false;
      notifyListeners();
    }
    for (int i = 0; i < categoriesBool.length; i++) {
      categoriesBool[i] = false;
      notifyListeners();
    }
  }


  bool checkWhichSize(Sizes size,String sizeString){
    if(sizeString == 'S' && size == Sizes.S)
      return true;
    if(sizeString == 'M' && size == Sizes.M)
      return true;
    if(sizeString == 'L' && size == Sizes.L)
      return true;
    if(sizeString == 'XL' && size == Sizes.XL)
      return true;
    return false;
  }
  /// Lists CRUD handling
  void addProduct(ProductModel productModel) {
    _productModels.add(productModel);
    notifyListeners();
  }

  void addToCart(ProductModel productModel) {
    _cartModels.add(productModel);
    notifyListeners();
  }
void addToFav(ProductModel productModel) {
    _favouriteModels.add(productModel);
    notifyListeners();
  }

  /// Form variables Handling
  ProductModel? productModel = ProductModel();
}
