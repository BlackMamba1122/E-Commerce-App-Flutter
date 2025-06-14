import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_application_1/features/shop/models/product_attributes_model.dart';
import 'package:flutter_application_1/features/shop/models/product_variation_modle.dart';

import 'brand_model.dart';

class ProductModel {
  String id;
  int stock;
  String? sku;  double price;
  String title;
  DateTime? date;
  double salePrice;
  String thumbnail;
  bool? isFeatured;
  BrandModel? brand;
  String? description;
  String? categoryId;
  List<String>? images;
  String productType;
  List<ProductAttributeModel>? productAttributes;
  List<ProductVariationModel>? productVariations;
  bool? isAr;
  String? ar;
  bool? arType;

  ProductModel({

    required this.id,
    required this.title,
    required this.stock,
    required this.price,
    required this.thumbnail,
    required this.productType,
    this.sku,
    this.brand,
    this.date,
    this.images,
    this.salePrice = 0.0,
    this.isFeatured,
    this.categoryId,
    this.description,
    this.productAttributes,
    this.productVariations,
    this.ar='',
    this.isAr=false,
    this.arType=false,
  });

  /// Create Empty func for clean code
  static ProductModel empty() =>
      ProductModel(id: '',
          title: '',
          stock: 0,
          price: 0,
          thumbnail: '',
          productType: '');

  /// Json Format
  toJson() {
    return {
      'Id': id,
      'SKU': sku,
      'Title': title,
      'Stock': stock,
      'Price': price,
      'Images': images ?? [],
      'Thumbnail': thumbnail,
      'SalePrice' : salePrice,
      'IsFeatured': isFeatured,
      'CategoryId': categoryId,
      'Brand': brand!.toJson(),
      'Description': description,
      'ProductType': productType,
      'ProductAttributes': productAttributes != null ? productAttributes !.map((e) => e.toJson()).toList() : [],
      'ProductVariations' : productVariations != null ? productVariations ! . map( (e) => e. toJson()). toList() : [],
      'IsAr':isAr ?? false,
      'Ar':ar ?? '',
      'ArType':arType ?? false,
    };
  }

  factory ProductModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    if(document.data() == null) return ProductModel.empty();
    final data = document.data() !;
    return ProductModel(
        id: data['Id'],
        sku: data['SKU'],
        title: data['Title'],
        stock: data['Stock'] ?? 0,
        isFeatured: data['IsFeatured'] ?? false,
        price: double. parse( (data['Price'] ?? 0.0).toString()),
        salePrice: double. parse((data['SalePrice'] ?? 0.0).toString()),
        thumbnail: data['Thumbnail'] ?? '',
        categoryId: data['CategoryId' ] ?? '',
        description: data['Description'] ?? "",
        productType: data['ProductType'] ?? "",
        brand: BrandModel.fromJson(data['Brand']),
        images: data['Images'] != null ? List<String>. from(data['Images']) : [],
        productAttributes: (data['ProductAttributes'] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e) ).toList() ?? [],
        productVariations: (data['ProductVariations'] as List<dynamic>) .map( (e) => ProductVariationModel.fromJson(e)).toList() ?? [],
      isAr: data['IsAr'] ?? false,
      ar:data['Ar'] ?? '',
      arType:data['ArType'] ?? false,
    ); // ProductModel
  }
// Map Json-oriented document snapshot from Firebase to Model
  factory ProductModel.fromQuerySnapshot(QueryDocumentSnapshot<Object?> document) {
    final data = document.data() as Map<String, dynamic>;
    return ProductModel(
        id: data['Id'] ?? '',
        sku: data[ 'SKU' ] ?? '',
      title: data[ 'Title'] ?? '',
      stock: data[ 'Stock'] ?? 0,
      isFeatured: data[ 'IsFeatured' ] ?? false,
      price: double. parse( (data[ 'Price' ] ?? 0.0) . toString()),
      salePrice: double. parse((data['SalePrice' ] ?? 0.0) . toString()),
      thumbnail: data[ 'Thumbnail'] ?? '',
      categoryId: data['CategoryId' ] ?? '',
      description: data[ 'Description'] ?? "",
      productType: data[ 'ProductType' ] ?? "",
      brand: BrandModel.fromJson(data[ 'Brand' ]),
      images: data[ 'Images' ] != null ? List<String>. from(data['Images' ]) : [],
      productAttributes: (data[ 'ProductAttributes' ] as List<dynamic>).map((e) => ProductAttributeModel.fromJson(e) ).toList(),
      productVariations: (data['ProductVariations' ] as List<dynamic>) .map( (e) => ProductVariationModel.fromJson(e)).toList(),
      isAr: data['IsAr'] ?? false,
      ar:data['Ar'] ?? '',
      arType:data['ArType'] ?? false,
    );
  }
}