import 'package:flutter_application_1/features/shop/models/brand_model.dart';
import 'package:flutter_application_1/features/shop/models/product_attributes_model.dart';
import 'package:flutter_application_1/features/shop/models/product_category_model.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/features/shop/models/product_variation_modle.dart';

import '../features/shop/models/banner_model.dart';
import '../features/shop/models/brand_category_model.dart';
import '../features/shop/models/category_model.dart';
import '../routes/routes.dart';
import 'constants/imge_string.dart';

class
DummyData {
  static final List<CategoryModel> categories = [
    CategoryModel(id: '1', image: BImages.sportIcon, name: 'Sports', isFeatured: true),
    CategoryModel(id: '2', image: BImages.furnitureIcon, name: 'Furniture', isFeatured: true),
    CategoryModel(id: '3', image: BImages.electronicsIcon, name: 'Electronics', isFeatured: true),
    CategoryModel(id: '4', image: BImages.clothIcon, name: 'Clothes', isFeatured: true),
    CategoryModel(id: '5', image: BImages.animalIcon, name: 'Animals', isFeatured: true),
    CategoryModel(id: '6', image: BImages.shoeIcon, name: 'Shoes', isFeatured: true),
    CategoryModel(id: '7', image: BImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
    CategoryModel(id: '8', image: BImages.jeweleryIcon, name: 'Jewelery', isFeatured: true),

    ///subcategories
    // Sports
    CategoryModel(id: '9', image: BImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: true),
    CategoryModel(id: '10', image: BImages.sportIcon, name: 'Track Suits', parentId: '1', isFeatured: true),
    CategoryModel(id: '11', image: BImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: true),

// Furniture
    CategoryModel(id: '12', image: BImages.furnitureIcon, name: 'Bedroom Furniture', parentId: '2', isFeatured: true),
    CategoryModel(id: '13', image: BImages.furnitureIcon, name: 'Kitchen Furniture', parentId: '2', isFeatured: true),

// Electronics
    CategoryModel(id: '14', image: BImages.electronicsIcon, name: 'Laptop', parentId: '3', isFeatured: true),
    CategoryModel(id: '15', image: BImages.electronicsIcon, name: 'Mobile', parentId: '3', isFeatured: true),
    CategoryModel(id: '16', image: BImages.electronicsIcon, name: 'Camera', parentId: '3', isFeatured: true),

// Clothes
    CategoryModel(id: '17', image: BImages.clothIcon, name: 'Shirts', parentId: '4', isFeatured: true),
    CategoryModel(id: '18', image: BImages.clothIcon, name: 'Jeans', parentId: '4', isFeatured: true),
    CategoryModel(id: '19', image: BImages.clothIcon, name: 'Jackets', parentId: '4', isFeatured: true),

// Animals
    CategoryModel(id: '20', image: BImages.animalIcon, name: 'Pet Food', parentId: '5', isFeatured: true),
    CategoryModel(id: '21', image: BImages.animalIcon, name: 'Pet Toys', parentId: '5', isFeatured: true),

// Shoes
    CategoryModel(id: '22', image: BImages.shoeIcon, name: 'Casual Shoes', parentId: '6', isFeatured: true),
    CategoryModel(id: '23', image: BImages.shoeIcon, name: 'Formal Shoes', parentId: '6', isFeatured: true),
    CategoryModel(id: '24', image: BImages.shoeIcon, name: 'Sneakers', parentId: '6', isFeatured: true),

// Cosmetics
    CategoryModel(id: '25', image: BImages.cosmeticsIcon, name: 'Lipsticks', parentId: '7', isFeatured: true),
    CategoryModel(id: '26', image: BImages.cosmeticsIcon, name: 'Face Creams', parentId: '7', isFeatured: true),

// Jewelery
    CategoryModel(id: '27', image: BImages.jeweleryIcon, name: 'Necklaces', parentId: '8', isFeatured: true),
    CategoryModel(id: '28', image: BImages.jeweleryIcon, name: 'Earrings', parentId: '8', isFeatured: true),
    CategoryModel(id: '29', image: BImages.jeweleryIcon, name: 'Rings', parentId: '8', isFeatured: true),
  ];

  static final List<BannerModel> banners = [
    BannerModel(
        imageUrl: BImages.banner1, targetScreen: BRoutes.order, active: false),
    BannerModel(
        imageUrl: BImages.banner2, targetScreen: BRoutes.cart, active: true),
    BannerModel(
        imageUrl: BImages.banner3,
        targetScreen: BRoutes.favourites,
        active: true),
    BannerModel(
        imageUrl: BImages.banner4, targetScreen: BRoutes.search, active: true),
    BannerModel(
        imageUrl: BImages.banner5,
        targetScreen: BRoutes.settings,
        active: true),
    BannerModel(
        imageUrl: BImages.banner6,
        targetScreen: BRoutes.userAddress,
        active: true),
    BannerModel(
        imageUrl: BImages.banner8,
        targetScreen: BRoutes.checkout,
        active: false),
  ];

  static final List<BrandModel> brands = [
    BrandModel(
        id: '1',
        image: BImages.nikeLogo,
        name: 'Nike',
        productsCount: 39,
        isFeatured: true),
    BrandModel(
        id: '2',
        image: BImages.adidasLogo,
        name: 'Adidas',
        productsCount: 45,
        isFeatured: true),
    BrandModel(
        id: '3',
        image: BImages.appleLogo,
        name: 'Apple',
        productsCount: 19,
        isFeatured: true),
    BrandModel(
        id: '4',
        image: BImages.jordanLogo,
        name: 'Jordan',
        productsCount: 132,
        isFeatured: true),
    BrandModel(
        id: '5',
        image: BImages.pumaLogo,
        name: 'Puma',
        productsCount: 99,
        isFeatured: true),
    BrandModel(
        id: '6',
        image: BImages.zaraLogo,
        name: 'Zara',
        productsCount: 5,
        isFeatured: true),
    BrandModel(
        id: '7',
        image: BImages.kenwoodLogo,
        name: 'Kenwood',
        productsCount: 165,
        isFeatured: true),
    BrandModel(
        id: '8',
        image: BImages.ikeaLogo,
        name: 'Ikea',
        productsCount: 265,
        isFeatured: true),
    BrandModel(
        id: '9',
        image: BImages.acerlogo,
        name: 'Acer',
        productsCount: 65,
        isFeatured: true),
    BrandModel(
        id: '10',
        image: BImages.hermanMillerLogo,
        name: 'Herman Miller',
        productsCount: 15,
        isFeatured: true),
  ];

  static final List<BrandCategoryModel> brandCategory=[
    BrandCategoryModel(brandId: '1', categoryId: '1'),
    BrandCategoryModel(brandId: '1', categoryId: '4'),
    BrandCategoryModel(brandId: '1', categoryId: '6'),
    BrandCategoryModel(brandId: '2', categoryId: '1'),
    BrandCategoryModel(brandId: '2', categoryId: '6'),
    BrandCategoryModel(brandId: '3', categoryId: '3'),
    BrandCategoryModel(brandId: '4', categoryId: '1'),
    BrandCategoryModel(brandId: '4', categoryId: '6'),
    BrandCategoryModel(brandId: '5', categoryId: '4'),
    BrandCategoryModel(brandId: '6', categoryId: '4'),
    BrandCategoryModel(brandId: '6', categoryId: '5'),
    BrandCategoryModel(brandId: '6', categoryId: '7'),
    BrandCategoryModel(brandId: '6', categoryId: '8'),
    BrandCategoryModel(brandId: '7', categoryId: '3'),
    BrandCategoryModel(brandId: '8', categoryId: '2'),
    BrandCategoryModel(brandId: '8', categoryId: '5'),
    BrandCategoryModel(brandId: '8', categoryId: '7'),
    BrandCategoryModel(brandId: '8', categoryId: '8'),
    BrandCategoryModel(brandId: '9', categoryId: '3'),
    BrandCategoryModel(brandId: '10', categoryId: '2'),
    BrandCategoryModel(brandId: '10', categoryId: '5'),
  ];



  static final List<ProductModel> products = [
    ProductModel(
      id: '001',
      title: 'Green Nike sports shoe',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: BImages.productImage1,
      description: 'Green Nike sports shoe',
      brand: BrandModel(
          id: '1',
          image: BImages.nikeLogo,
          name: 'Nike',
          productsCount: 265,
          isFeatured: true),
      images: [
        BImages.productImage1,
        BImages.productImage23,
        BImages.productImage21,
        BImages.productImage9
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '1',
      productAttributes: [
        ProductAttributeModel(name: 'Color', values: ['Green', 'Black', 'Red']),
        ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: BImages.productImage1,
            description:
                'This is a Product description for Green Nike sports shoe.',
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ProductVariationModel
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: BImages.productImage23,
            attributeValues: {'Color': 'Black', 'Size': 'EU 32'}),
        // ProductVariationModel
        ProductVariationModel(
          id: '3',
          stock: 0,
          price: 234,
          image: BImages.productImage23,
          attributeValues: {'Color': 'Black', 'Size': 'EU 34'},
        ),
        // ProductVariationModel
        ProductVariationModel(
          id: '4',
          stock: 222,
          price: 232,
          image: BImages.productImage1,
          attributeValues: {'Color': 'Green', 'Size': 'EU 32'},
        ),
        // ProductVariationModel
        ProductVariationModel(
          id: '5',
          stock: 0,
          price: 334,
          image: BImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 34'},
        ),
        // ProductVariationModel
        ProductVariationModel(
          id: '6',
          stock: 11,
          price: 332,
          image: BImages.productImage21,
          attributeValues: {'Color': 'Red', 'Size': 'EU 32'},
        ),
      ],
      //
      productType: 'ProductType.variable', // ProductVariationModel
    ),
    ProductModel(
      id: '002',
      title: 'Blue T-shirt for all ages',
      stock: 15,
      price: 35,
      isFeatured: true,
      thumbnail: BImages.productImage69,
      description:
          'This is a Product description for Blue Nike Sleeve less vest. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: BImages.zaraLogo, name: 'ZARA'),
      images: [
        BImages.productImage68,
        BImages.productImage69,
        BImages.productImage5
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '003',
      title: 'Leather brown Jacket',
      stock: 15,
      price: 38000,
      isFeatured: true,
      thumbnail: BImages.productImage64,
      description:
          'This is a Product description for Leather brown Jacket. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '6', image: BImages.zaraLogo, name: 'ZARA'),
      images: [
        BImages.productImage64,
        BImages.productImage65,
        BImages.productImage66,
        BImages.productImage67
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '004',
      title: '4 Color collar t-shirt dry fit',
      stock: 15,
      price: 135,
      isFeatured: true,
      thumbnail: BImages.productImage60,
      description:
          'This is a Product description for 4 Color collar t-shirt dry fit. There are more things that can be added but its just a demo and nothing else.',
      brand: BrandModel(id: '6', image: BImages.zaraLogo, name: 'ZARA'),
      images: [
        BImages.productImage60,
        BImages.productImage61,
        BImages.productImage62,
        BImages.productImage63
      ],
      salePrice: 30,
      sku: 'ABR4568',
      categoryId: '16',
      productAttributes: [
        ProductAttributeModel(
            name: 'Color', values: ['Red', 'Yellow', 'Green', 'Blue']),
        ProductAttributeModel(
            name: 'Size', values: ['EU 30', 'EU 32', 'EU 34']),
      ],
      productVariations: [
        ProductVariationModel(
            id: '1',
            stock: 34,
            price: 134,
            salePrice: 122.6,
            image: BImages.productImage60,
            description:
                'This is a Product description for 4 Color collar t-shirt dry fit',
            attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
        // ProductVariationModel
        ProductVariationModel(
            id: '2',
            stock: 15,
            price: 132,
            image: BImages.productImage60,
            attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
        // ProductVariationModel
        ProductVariationModel(
            id: '3',
            stock: 0,
            price: 234,
            image: BImages.productImage61,
            attributeValues: {'Color': 'Yellow', 'Size': 'EU 34'}),
        // ProductVariationModel
        ProductVariationModel(
            id: '4',
            stock: 222,
            price: 232,
            image: BImages.productImage61,
            attributeValues: {'Color': 'Yellow', 'Size': 'EU 32'}),
        // ProductVariationModel
        ProductVariationModel(
            id: '5',
            stock: 0,
            price: 334,
            image: BImages.productImage62,
            attributeValues: {'Color': 'Green', 'Size': 'EU 34'}),
        // ProductVariationModel
        ProductVariationModel(
            id: '6',
            stock: 11,
            price: 332,
            image: BImages.productImage62,
            attributeValues: {'Color': 'Green', 'Size': 'EU 30'}),
        // ProductVariationModel
        ProductVariationModel(
            id: '7',
            stock: 0,
            price: 334,
            image: BImages.productImage63,
            attributeValues: {'Color': 'Blue', 'Size': 'EU 30'}),
        // ProductVariationModel
        ProductVariationModel(
            id: '8',
            stock: 11,
            price: 332,
            image: BImages.productImage63,
            attributeValues: {'Color': 'Blue', 'Size': 'EU 34'}),
      ],
      // ProductVariationModel
      productType: 'ProductType.variable',
    ),
    ProductModel(
      id: '006',
      title: 'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM) ',
      stock: 15,
      price: 750,
      isFeatured: true,
      thumbnail: BImages.productImage11,
      description:
          'SAMSUNG Galaxy S9 (Pink, 64 GB) (4 GB RAM), Long Battery timing',
      brand: BrandModel(id: '7', image: BImages.appleLogo, name: 'Samsung'),
      images: [
        BImages.productImage11,
        BImages.productImage12,
        BImages.productImage13,
        BImages.productImage12
      ],
      salePrice: 650,
      sku: 'ABR4568',
      categoryId: '2',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
    ProductModel(
      id: '007',
      title: 'TOMI Dog food',
      stock: 15,
      price: 20,
      isFeatured: true,
      thumbnail: BImages.productImage18,
      description: 'This is a Product description for TOMI Dog food. There are more things that can be added but i am just practicing and nothing else.',
      brand: BrandModel(id: '7', image: BImages.appleLogo, name: 'Tomi'),
      salePrice: 10,
      sku: 'ABR4568',
      categoryId: '4',
      productAttributes: [
        ProductAttributeModel(name: 'Size', values: ['EU34', 'EU32']),
        ProductAttributeModel(name: 'Color', values: ['Green', 'Red', 'Blue']),
      ],
      productType: 'ProductType.single',
    ),
  ];

  static final List<ProductCategoryModel> productCategory=[
    ProductCategoryModel(categoryId: '1',productId: '1', ),
    ProductCategoryModel(categoryId: '1',productId: '2', )
  ];

}
