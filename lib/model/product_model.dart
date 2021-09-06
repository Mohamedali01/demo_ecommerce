import 'dart:io';

import 'package:demo_ecommerce/constants.dart';

class ProductModel {
  File? imageFilePath;
  String? image;
  String? title;
  String? description;
  String? price;
  String? salePrice;
  double? rating;
  int? numberOfReviews;
  Categories? category;
  Sizes? size;
  int? numberOfPieces;

  bool favourite;

  String? countInStock;

  ProductModel(
      {this.imageFilePath,
      this.title,
      this.description,
      this.price,
      this.size,
      this.rating = 0.0,
      this.numberOfReviews = 0,
      this.category,
      this.countInStock,
      this.image,
      this.salePrice,
      this.favourite = false,
      this.numberOfPieces = 0
      });
}
