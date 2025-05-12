import 'package:cloud_firestore/cloud_firestore.dart';

class ProductCategoryModel{
  final String productId;
  final String categoryId;

  ProductCategoryModel({required this.productId, required this.categoryId});

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'productId': productId,
    };
  }
  factory ProductCategoryModel.fromSnapShot(DocumentSnapshot snapshot) {
    final data = snapshot.data() as Map<String, dynamic>;
    return ProductCategoryModel(
      categoryId: data['categoryId'] as String,
      productId: data['productId'] as String,
    );
  }
}