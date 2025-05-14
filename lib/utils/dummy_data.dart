// import 'package:flutter_application_1/features/shop/models/brand_model.dart';
// import 'package:flutter_application_1/features/shop/models/product_attributes_model.dart';
// import 'package:flutter_application_1/features/shop/models/product_category_model.dart';
// import 'package:flutter_application_1/features/shop/models/product_model.dart';
// import 'package:flutter_application_1/features/shop/models/product_variation_modle.dart';
//
// import '../features/shop/models/banner_model.dart';
// import '../features/shop/models/brand_category_model.dart';
// import '../features/shop/models/category_model.dart';
// import '../routes/routes.dart';
// import 'constants/imge_string.dart';
//
// class
// DummyData {
//   static final List<CategoryModel> categories = [
//     CategoryModel(id: '1', image: BImages.sportIcon, name: 'Sports', isFeatured: true),
//     CategoryModel(id: '2', image: BImages.furnitureIcon, name: 'Furniture', isFeatured: true),
//     CategoryModel(id: '3', image: BImages.electronicsIcon, name: 'Electronics', isFeatured: true),
//     CategoryModel(id: '4', image: BImages.clothIcon, name: 'Clothes', isFeatured: true),
//     CategoryModel(id: '5', image: BImages.animalIcon, name: 'Animals', isFeatured: true),
//     CategoryModel(id: '6', image: BImages.shoeIcon, name: 'Shoes', isFeatured: true),
//     CategoryModel(id: '7', image: BImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
//     CategoryModel(id: '8', image: BImages.jeweleryIcon, name: 'Jewelery', isFeatured: true),
//
//     ///subcategories
//     // Sports
//     CategoryModel(id: '9', image: BImages.c9, name: 'Sport Shoes', parentId: '1', isFeatured: true),
//     CategoryModel(id: '10', image: BImages.c10, name: 'Track Suits', parentId: '1', isFeatured: true),
//     CategoryModel(id: '11', image: BImages.c11, name: 'Sports Equipments', parentId: '1', isFeatured: true),
//
// // Furniture
//     CategoryModel(id: '12', image: BImages.c12, name: 'Bedroom Furniture', parentId: '2', isFeatured: true),
//     CategoryModel(id: '13', image: BImages.c13, name: 'Kitchen Furniture', parentId: '2', isFeatured: true),
//
// // Electronics
//     CategoryModel(id: '14', image: BImages.c14, name: 'Laptop', parentId: '3', isFeatured: true),
//     CategoryModel(id: '15', image: BImages.c15, name: 'Mobile', parentId: '3', isFeatured: true),
//     CategoryModel(id: '16', image: BImages.c16, name: 'Camera', parentId: '3', isFeatured: true),
//
// // Clothes
//     CategoryModel(id: '17', image: BImages.c17, name: 'Shirts', parentId: '4', isFeatured: true),
//     CategoryModel(id: '18', image: BImages.c18, name: 'Jeans', parentId: '4', isFeatured: true),
//     CategoryModel(id: '19', image: BImages.c19, name: 'Jackets', parentId: '4', isFeatured: true),
//
// // Animals
//     CategoryModel(id: '20', image: BImages.c20, name: 'Pet Food', parentId: '5', isFeatured: true),
//     CategoryModel(id: '21', image: BImages.c21, name: 'Pet Toys', parentId: '5', isFeatured: true),
//
// // Shoes
//     CategoryModel(id: '22', image: BImages.c22, name: 'Casual Shoes', parentId: '6', isFeatured: true),
//     CategoryModel(id: '23', image: BImages.c23, name: 'Formal Shoes', parentId: '6', isFeatured: true),
//     CategoryModel(id: '24', image: BImages.c24, name: 'Sneakers', parentId: '6', isFeatured: true),
//
// // Cosmetics
//     CategoryModel(id: '25', image: BImages.c25, name: 'Lipsticks', parentId: '7', isFeatured: true),
//     CategoryModel(id: '26', image: BImages.c26, name: 'Face Creams', parentId: '7', isFeatured: true),
//
// // Jewelery
//     CategoryModel(id: '27', image: BImages.c27, name: 'Necklaces', parentId: '8', isFeatured: true),
//     CategoryModel(id: '28', image: BImages.c28, name: 'Earrings', parentId: '8', isFeatured: true),
//     CategoryModel(id: '29', image: BImages.c29, name: 'Rings', parentId: '8', isFeatured: true),
//   ];
//
//   static final List<BannerModel> banners = [
//     BannerModel(
//         imageUrl: BImages.banner1, targetScreen: BRoutes.order, active: false),
//     BannerModel(
//         imageUrl: BImages.banner2, targetScreen: BRoutes.cart, active: true),
//     BannerModel(
//         imageUrl: BImages.banner3,
//         targetScreen: BRoutes.favourites,
//         active: true),
//     BannerModel(
//         imageUrl: BImages.banner4, targetScreen: BRoutes.search, active: true),
//     BannerModel(
//         imageUrl: BImages.banner5,
//         targetScreen: BRoutes.settings,
//         active: true),
//     BannerModel(
//         imageUrl: BImages.banner6,
//         targetScreen: BRoutes.userAddress,
//         active: true),
//     BannerModel(
//         imageUrl: BImages.banner8,
//         targetScreen: BRoutes.checkout,
//         active: false),
//   ];
//
//   static final List<BrandModel> brands = [
//     BrandModel(
//         id: '1',
//         image: BImages.nikeLogo,
//         name: 'Nike',
//         productsCount: 39,
//         isFeatured: true),
//     BrandModel(
//         id: '2',
//         image: BImages.adidasLogo,
//         name: 'Adidas',
//         productsCount: 45,
//         isFeatured: true),
//     BrandModel(
//         id: '3',
//         image: BImages.appleLogo,
//         name: 'Apple',
//         productsCount: 19,
//         isFeatured: true),
//     BrandModel(
//         id: '4',
//         image: BImages.jordanLogo,
//         name: 'Jordan',
//         productsCount: 132,
//         isFeatured: true),
//     BrandModel(
//         id: '5',
//         image: BImages.pumaLogo,
//         name: 'Puma',
//         productsCount: 99,
//         isFeatured: true),
//     BrandModel(
//         id: '6',
//         image: BImages.zaraLogo,
//         name: 'Zara',
//         productsCount: 5,
//         isFeatured: true),
//     BrandModel(
//         id: '7',
//         image: BImages.kenwoodLogo,
//         name: 'Kenwood',
//         productsCount: 165,
//         isFeatured: true),
//     BrandModel(
//         id: '8',
//         image: BImages.ikeaLogo,
//         name: 'Ikea',
//         productsCount: 265,
//         isFeatured: true),
//     BrandModel(
//         id: '9',
//         image: BImages.acerlogo,
//         name: 'Acer',
//         productsCount: 65,
//         isFeatured: true),
//     BrandModel(
//         id: '10',
//         image: BImages.hermanMillerLogo,
//         name: 'Herman Miller',
//         productsCount: 15,
//         isFeatured: true),
//   ];
//
//   static final List<BrandCategoryModel> brandCategory=[
//     BrandCategoryModel(brandId: '1', categoryId: '1'),
//     BrandCategoryModel(brandId: '1', categoryId: '4'),
//     BrandCategoryModel(brandId: '1', categoryId: '6'),
//     BrandCategoryModel(brandId: '2', categoryId: '1'),
//     BrandCategoryModel(brandId: '2', categoryId: '6'),
//     BrandCategoryModel(brandId: '3', categoryId: '3'),
//     BrandCategoryModel(brandId: '4', categoryId: '1'),
//     BrandCategoryModel(brandId: '4', categoryId: '6'),
//     BrandCategoryModel(brandId: '5', categoryId: '1'),
//     BrandCategoryModel(brandId: '5', categoryId: '4'),
//     BrandCategoryModel(brandId: '6', categoryId: '4'),
//     BrandCategoryModel(brandId: '6', categoryId: '5'),
//     BrandCategoryModel(brandId: '6', categoryId: '7'),
//     BrandCategoryModel(brandId: '6', categoryId: '8'),
//     BrandCategoryModel(brandId: '7', categoryId: '3'),
//     BrandCategoryModel(brandId: '8', categoryId: '2'),
//     BrandCategoryModel(brandId: '9', categoryId: '3'),
//     BrandCategoryModel(brandId: '10', categoryId: '2'),
//   ];
//
// //   static final List<ProductModel> products = [
// //       ProductModel(
// //         id: '16',
// //         title: 'Acer phone',
// //         stock: 43,
// //         price: 129999,
// //         isFeatured: true,
// //         thumbnail: BImages.p16_t,
// //         description: 'HM desc',
// //         brand: BrandModel(
// //             id: '9',
// //             image: BImages.acerlogo,
// //             name: 'Acer',
// //             productsCount: 265,
// //             isFeatured: true),
// //         images:
// //         [
// //           BImages.p16_t
// //         ],
// //         salePrice: 99999,
// //         sku: 'ABR4568',
// //         categoryId: '3',
// //         productType: 'ProductType.single',
// //       ),
// // ];
//   static final List<ProductModel> products = [
//     ProductModel(
//       id: '1',
//       title: 'Nike sports shoe',
//       stock: 15,
//       price: 10000,
//       isFeatured: true,
//       thumbnail: BImages.p1_t,
//       description: 'Green Nike sports shoe',
//       brand: BrandModel(
//           id: '1',
//           image: BImages.nikeLogo,
//           name: 'Nike',
//           productsCount: 265,
//           isFeatured: true),
//       images: [
//         BImages.p1_s1,
//         BImages.p1_s2
//       ],
//       salePrice: 8000,
//       sku: 'ABR4568',
//       categoryId: '1',
//       productAttributes: [
//         ProductAttributeModel(name: 'Color', values: ['White', 'Blue', 'Red']),
//         ProductAttributeModel(name: 'Size', values: [ 'EU 32', 'EU 34']),
//       ],
//
//
//       productVariations: [
//         ProductVariationModel(
//             id: '1',
//             stock: 34,
//             price: 11000,
//             salePrice: 9000,
//             image: BImages.p1_vr,
//             description:
//             'This is a Product description for Green Nike sports shoe.',
//             attributeValues: {'Color': 'Red', 'Size': 'EU 34'}),
//         // ProductVariationModel
//         ProductVariationModel(
//             id: '2',
//             stock: 15,
//             price: 12000,
//             image: BImages.p1_vr,
//             attributeValues: {'Color': 'Red', 'Size': 'EU 32'}),
//         // ProductVariationModel
//         ProductVariationModel(
//           id: '3',
//           stock: 1,
//           price: 13000,
//           image: BImages.p1_vb,
//           attributeValues: {'Color': 'Blue', 'Size': 'EU 34'},
//         ),
//         // ProductVariationModel
//         ProductVariationModel(
//           id: '4',
//           stock: 222,
//           price: 12400,
//           image: BImages.p1_vb,
//           attributeValues: {'Color': 'Blue', 'Size': 'EU 32'},
//         ),
//         // ProductVariationModel
//         ProductVariationModel(
//           id: '5',
//           stock: 1,
//           price: 13200,
//           salePrice: 11000,
//           image: BImages.p1_vw,
//           attributeValues: {'Color': 'White', 'Size': 'EU 34'},
//         ),
//         ProductVariationModel(
//           id: '6',
//           stock: 1,
//           price: 334,
//           image: BImages.p1_vw,
//           attributeValues: {'Color': 'White', 'Size': 'EU 32'},
//         ),
//       ],
//       productType: 'ProductType.variable', // ProductVariationModel
//     ),
//     ProductModel(
//       id: '2',
//       title: 'Adidas Sport Shoes',
//       stock: 21,
//       price: 4000,
//       isFeatured: true,
//       thumbnail: BImages.p2_t,
//       description: 'Adidas desc',
//       brand: BrandModel(
//           id: '2',
//           image: BImages.adidasLogo,
//           name: 'Adidas',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p2_s1,
//         BImages.p2_s2,
//         BImages.p2_s3
//       ],
//       salePrice: 3600,
//       sku: 'ABR4568',
//       categoryId: '1',
//       productType: 'ProductType.single',
//     ),
//     ProductModel(
//         id: '3',
//         title: 'Jordan Sport Shoes',
//         stock: 51,
//         price: 11000,
//         isFeatured: true,
//         thumbnail: BImages.p3_t,
//         description: 'Adidas desc',
//         brand: BrandModel(
//             id: '5',
//             image: BImages.pumaLogo,
//             name: 'Puma',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p3_s1,
//           BImages.p3_s2,
//           BImages.p3_s3
//         ],
//
//         salePrice: 9000,
//         sku: 'ABR4568',
//         categoryId: '1',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['EU 30', 'EU 32', 'EU 34'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 17,
//               price: 11000,
//               image: BImages.p3_s1,
//               attributeValues: {'Size' : 'EU 30'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 12,
//               price: 11500,
//               image: BImages.p3_s1,
//               attributeValues: {'Size' : 'EU 32'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 21,
//               price: 12000,
//               image: BImages.p3_s1,
//               attributeValues: {'Size' : 'EU 34'}
//           ),
//         ]
//     ),
//
//     ProductModel(
//       id: '4',
//       title: 'Nike Track Suit',
//       stock: 3,
//       price: 12000,
//       isFeatured: true,
//       thumbnail: BImages.p4_t,
//       description: 'Track suit desc',
//       brand: BrandModel(
//           id: '1',
//           image: BImages.nikeLogo,
//           name: 'Nike',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p4_s1,
//         BImages.p4_s2,
//         BImages.p4_s3
//       ],
//       salePrice: 10599,
//       sku: 'ABR4568',
//       categoryId: '10',
//       productType: 'ProductType.single',
//     ),
//     ProductModel(
//         id: '5',
//         title: 'Adidas Track Suit',
//         stock: 14,
//         price: 12000,
//         isFeatured: true,
//         thumbnail: BImages.p5_t,
//         description: 'Adidas desc',
//         brand: BrandModel(
//             id: '2',
//             image: BImages.adidasLogo,
//             name: 'Adidas',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p5_s1,
//           BImages.p5_s2
//         ],
//         salePrice: 10599,
//         sku: 'ABR4568',
//         categoryId: '1',
//         productType: 'ProductType.variable',
//         productAttributes: [
//           ProductAttributeModel(name: 'Color', values: ['Red', 'White'])
//         ],
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 9,
//               price: 12000,
//               image: BImages.p5_vr,
//               attributeValues: {'Color' : 'Red'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 5,
//               price: 13000,
//               image: BImages.p5_vw,
//               attributeValues: {'Color' : 'White'}
//           ),
//         ]
//     ),
//     ProductModel(
//         id: '6',
//         title: 'Puma Track Suit',
//         stock: 14,
//         price: 12000,
//         isFeatured: true,
//         thumbnail: BImages.p6_t,
//         description: 'Puma desc',
//         brand: BrandModel(
//             id: '5',
//             image: BImages.pumaLogo,
//             name: 'Puma',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p6_s1,
//           BImages.p6_s2,
//           BImages.p6_s3,
//           BImages.p6_s4
//         ],
//         salePrice: 10599,
//         sku: 'ABR4568',
//         categoryId: '1',
//         productType: 'ProductType.variable',
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['S', 'M', 'L']),
//           ProductAttributeModel(name: 'Color', values: ['Green', 'Black'])
//         ],
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 1,
//               price: 13000,
//               image: BImages.p6_vb,
//               attributeValues: {'Size' : 'S', 'Color' : 'Black'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 3,
//               price: 13500,
//               image: BImages.p6_vb,
//               attributeValues: {'Size' : 'M', 'Color' : 'Black'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 2,
//               price: 140000,
//               image: BImages.p6_vb,
//               attributeValues: {'Size' : 'L', 'Color' : 'Black'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 4,
//               price: 13000,
//               image: BImages.p6_vg,
//               attributeValues: {'Size' : 'S', 'Color' : 'Green'}
//           ),
//           ProductVariationModel(
//               id: '5',
//               stock: 2,
//               price: 13500,
//               image: BImages.p6_vg,
//               attributeValues: {'Size' : 'M', 'Color' : 'Green'}
//           ),
//           ProductVariationModel(
//               id: '6',
//               stock: 2,
//               price: 14000,
//               image: BImages.p6_vg,
//               attributeValues: {'Size' : 'L', 'Color' : 'Green'}
//           ),
//         ]
//     ),
//
//     // Sports Equipment
//
//     ProductModel(
//         id: '7',
//         title: 'Nike Water Bottle',
//         stock: 129,
//         price: 1599,
//         isFeatured: true,
//         thumbnail: BImages.p7_t,
//         description: 'Nike desc',
//         brand: BrandModel(
//             id: '1',
//             image: BImages.nikeLogo,
//             name: 'Nike',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p7_t
//         ],
//         salePrice: 4999,
//         sku: 'ABR4568',
//         categoryId: '1',
//         productType: 'ProductType.variable',
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['S', 'L']),
//           ProductAttributeModel(name: 'Color', values: ['White', 'Black', 'Sky Blue']),
//         ],
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 15,
//               price: 1599,
//               image: BImages.p7_vw,
//               attributeValues: {'Size' : 'S', 'Color' : 'White'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 28,
//               price: 1699,
//               image: BImages.p7_vw,
//               attributeValues: {'Size' : 'L', 'Color' : 'White'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 20,
//               price: 1599,
//               image: BImages.p7_vb,
//               attributeValues: {'Size' : 'S', 'Color' : 'Black'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 19,
//               price: 1699,
//               image: BImages.p7_vb,
//               attributeValues: {'Size' : 'L', 'Color' : 'Black'}
//           ),
//           ProductVariationModel(
//               id: '5',
//               stock: 22,
//               price: 1599,
//               image: BImages.p7_vsb,
//               attributeValues: {'Size' : 'S', 'Color' : 'Sky Blue'}
//           ),
//           ProductVariationModel(
//               id: '6',
//               stock: 25,
//               price: 1699,
//               image: BImages.p7_vsb,
//               attributeValues: {'Size' : 'L', 'Color' : 'Sky Blue'}
//           ),
//         ]
//     ),
//     ProductModel(
//       id: '8',
//       title: 'Adidas Football',
//       stock: 129,
//       price: 3400,
//       isFeatured: true,
//       thumbnail: BImages.p8_t,
//       description: 'Adidas desc',
//       brand: BrandModel(
//           id: '2',
//           image: BImages.adidasLogo,
//           name: 'Adidas',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p8_s1,
//         BImages.p8_s2,
//         BImages.p8_s3,
//         BImages.p8_s4,
//         BImages.p8_s5
//       ],
//       salePrice: 2999,
//       sku: 'ABR4568',
//       categoryId: '1',
//       productType: 'ProductType.single',
//     ),
//     ProductModel(
//       id: '9',
//       title: 'Puma Basketball',
//       stock: 204,
//       price: 2900,
//       isFeatured: true,
//       thumbnail: BImages.p9_t,
//       description: 'Puma desc',
//       brand: BrandModel(
//           id: '5',
//           image: BImages.pumaLogo,
//           name: 'Puma',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p9_s1,
//         BImages.p9_s2,
//         BImages.p9_s3,
//       ],
//       salePrice: 1999,
//       sku: 'ABR4568',
//       categoryId: '1',
//       productType: 'ProductType.single',
//     ),
//
//     // Bedroom Furniture
//
//     ProductModel(
//         id: '10',
//         title: 'Ikea Bedroom Furniture',
//         stock: 6,
//         price: 129000,
//         isFeatured: true,
//         thumbnail: BImages.p10_t,
//         description: 'Ikea desc',
//         brand: BrandModel(
//             id: '8',
//             image: BImages.ikeaLogo,
//             name: 'IKEA',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p10_s1,
//           BImages.p10_s2,
//           BImages.p10_s3,
//           BImages.p10_s4
//         ],
//         salePrice: 1999,
//         sku: 'ABR4568',
//         categoryId: '2',
//         productType: 'ProductType.variable',
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['Double', 'Queen', 'King']),
//           ProductAttributeModel(name: 'Color', values: ['Gray White', 'Light Beige'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 1,
//               price: 129000,
//               image: BImages.p10_vgw,
//               attributeValues: {'Size' : 'Double', 'Color' : 'Gray White'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 1,
//               price: 129000,
//               image: BImages.p10_vgw,
//               attributeValues: {'Size' : 'Queen', 'Color' : 'Gray White'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 1,
//               price: 129000,
//               image: BImages.p10_vgw,
//               attributeValues: {'Size' : 'King', 'Color' : 'Gray White'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 1,
//               price: 129000,
//               image: BImages.p10_vlb,
//               attributeValues: {'Size' : 'Double', 'Color' : 'Light Beige'}
//           ),
//           ProductVariationModel(
//               id: '5',
//               stock: 1,
//               price: 129000,
//               image: BImages.p10_vlb,
//               attributeValues: {'Size' : 'Queen', 'Color' : 'Light Beige'}
//           ),
//           ProductVariationModel(
//               id: '6',
//               stock: 1,
//               price: 129000,
//               image: BImages.p10_vlb,
//               attributeValues: {'Size' : 'King', 'Color' : 'Light Beige'}
//           ),
//         ]
//     ),
//
//     ProductModel(
//         id: '11',
//         title: 'Herman Miller Bedroom Furniture',
//         stock: 3,
//         price: 390000,
//         isFeatured: true,
//         thumbnail: BImages.p11_t,
//         description: 'Herman Miller    desc',
//         brand: BrandModel(
//             id: '10',
//             image: BImages.hermanMillerLogo,
//             name: 'Herman Miller',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p11_s1,
//           BImages.p11_s3,
//           BImages.p11_s4
//         ],
//         salePrice: 359999,
//         sku: 'ABR4568',
//         categoryId: '2',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name : 'Size', values : ['Double', 'Queen', 'King'])
//         ],
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 1,
//               price: 169999,
//               image: BImages.p11_s4,
//               attributeValues: {'Size' : 'Double'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 1,
//               price: 249999,
//               image: BImages.p11_s1,
//               attributeValues: {'Size' : 'Queen'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 1,
//               price: 390000,
//               image: BImages.p10_s3,
//               attributeValues: {'Size' : 'King'}
//           )
//         ]
//     ),
//
//     // Kitchen Furniture
//
//     ProductModel(
//       id: '12',
//       title: 'IKEA Kitchen Furniture',
//       stock: 12,
//       price: 79000,
//       isFeatured: true,
//       thumbnail: BImages.p12_t,
//       description: 'HM desc',
//       brand: BrandModel(
//           id: '8',
//           image: BImages.ikeaLogo,
//           name: 'IKEA',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p12_s1,
//         BImages.p12_s2,
//         BImages.p12_s3,
//         BImages.p12_s4
//       ],
//       salePrice: 69999,
//       sku: 'ABR4568',
//       categoryId: '2',
//       productType: 'ProductType.single',
//     ),
//
//     // Laptops
//
//     ProductModel(
//         id: '13',
//         title: 'Macintosh',
//         stock: 20,
//         price: 690000,
//         isFeatured: true,
//         thumbnail: BImages.p13_t,
//         description: 'Apple desc',
//         brand: BrandModel(
//             id: '3',
//             image: BImages.appleLogo,
//             name: 'Apple',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p13_s1,
//           BImages.p13_s2
//         ],
//         salePrice: 599999,
//         sku: 'ABR4568',
//         categoryId: '3',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Color', values: ['Black', 'Starlight']),
//           ProductAttributeModel(name: 'Specs', values: ['256GB ROM', '512GB ROM'])
//         ],
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 6,
//               price: 390000,
//               image: BImages.p13_vb,
//               attributeValues: {'Color' : 'Black', 'Specs' : '256GB ROM'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 5,
//               price: 390000,
//               image: BImages.p13_vb,
//               attributeValues: {'Color' : 'Black', 'Specs' : '512GB ROM'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 4,
//               price: 390000,
//               image: BImages.p13_vsl,
//               attributeValues: {'Color' : 'Starlight', 'Specs' : '256GB ROM'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 5,
//               price: 390000,
//               image: BImages.p13_vsl,
//               attributeValues: {'Color' : 'Starlight', 'Specs' : '512GB ROM'}
//           ),
//         ]
//     ),
//     ProductModel(
//       id: '14',
//       title: 'Acer Laptop',
//       stock: 35,
//       price: 350000,
//       isFeatured: true,
//       thumbnail: BImages.p14_t,
//       description: 'Acer desc',
//       brand: BrandModel(
//           id: '9',
//           image: BImages.acerlogo,
//           name: 'Acer',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p14_s1,
//         BImages.p14_s2
//       ],
//       salePrice: 299999,
//       sku: 'ABR4568',
//       categoryId: '3',
//       productType: 'ProductType.single',
//     ),
//
//     // Mobile Phones
//
//     ProductModel(
//         id: '15',
//         title: 'iPhone 4',
//         stock: 129,
//         price: 12000000,
//         isFeatured: true,
//         thumbnail: BImages.p15_t,
//         description: 'HM desc',
//         brand: BrandModel(
//             id: '3',
//             image: BImages.appleLogo,
//             name: 'Apple',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p15_t
//         ],
//         salePrice: 10000000,
//         sku: 'ABR4568',
//         categoryId: '3',
//         productType: 'ProductType.variable',
//         productAttributes: [
//           ProductAttributeModel(name: 'Color', values: ['Pink', 'White']),
//           ProductAttributeModel(name: 'Model', values: ['Normal', 'Pro'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 37,
//               price: 12000000,
//               image: BImages.p15_vp,
//               attributeValues: {'Color' : 'Pink', 'Model' : 'Normal'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 18,
//               price: 10000000,
//               image: BImages.p15_vp,
//               attributeValues: {'Color' : 'Pink', 'Model' : 'Pro'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 40,
//               price: 12000000,
//               image: BImages.p15_vw,
//               attributeValues: {'Color' : 'White', 'Model' : 'Normal'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 34,
//               price: 10000000,
//               image: BImages.p15_vw,
//               attributeValues: {'Color' : 'White', 'Model' : 'Pro'}
//           ),
//         ]
//     ),
//
//     ProductModel(
//       id: '16',
//       title: 'Acer phone',
//       stock: 43,
//       price: 129999,
//       isFeatured: true,
//       thumbnail: BImages.p16_t,
//       description: 'HM desc',
//       brand: BrandModel(
//           id: '9',
//           image: BImages.acerlogo,
//           name: 'Acer',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p16_t
//       ],
//       salePrice: 99999,
//       sku: 'ABR4568',
//       categoryId: '3',
//       productType: 'ProductType.single',
//     ),
//
//     // Cameras
//
//     ProductModel(
//       id: '17',
//       title: 'Acer Camera',
//       stock: 23,
//       price: 209999,
//       isFeatured: true,
//       thumbnail: BImages.p17_t,
//       description: 'Acer desc',
//       brand: BrandModel(
//           id: '9',
//           image: BImages.acerlogo,
//           name: 'Acer',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p17_s1,
//         BImages.p17_s2,
//         BImages.p17_s3,
//       ],
//       salePrice: 159999,
//       sku: 'ABR4568',
//       categoryId: '3',
//       productType: 'ProductType.single',
//     ),
//
//     ProductModel(
//         id: '18',
//         title: 'Kenwood Camera',
//         stock: 49,
//         price: 79999,
//         isFeatured: true,
//         thumbnail: BImages.p18_t,
//         description: 'Kenwood desc',
//         brand: BrandModel(
//             id: '7',
//             image: BImages.kenwoodLogo,
//             name: 'Kenwood',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p18_s1,
//           BImages.p18_s2,
//           BImages.p18_s3,
//           BImages.p18_s4,
//         ],
//         salePrice: 65000,
//         sku: 'ABR4568',
//         categoryId: '3',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Lens Size', values: ['14cm', '35cm', '85cm'])
//         ],
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 19,
//               price: 189999,
//               image: BImages.p18_s1,
//               attributeValues: {'Lens Size' : '14cm'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 5,
//               price: 209999,
//               image: BImages.p18_s1,
//               attributeValues: {'Lens Size' : '35cm'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 25,
//               price: 219999,
//               image: BImages.p18_s1,
//               attributeValues: {'Lens Size' : '85cm'}
//           ),
//         ]
//     ),
//
//     // Shirts
//
//     ProductModel(
//         id: '19',
//         title: 'Nike Shirt',
//         stock: 51,
//         price: 6299,
//         isFeatured: true,
//         thumbnail: BImages.p19_t,
//         description: 'Nike desc',
//         brand: BrandModel(
//             id: '1',
//             image: BImages.appleLogo,
//             name: 'Nike',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p19_s1
//         ],
//         salePrice: 4999,
//         sku: 'ABR4568',
//         categoryId: '4',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['Small', 'Medium', 'Large', 'XL'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 9,
//               price: 5699,
//               image: BImages.p19_s1,
//               attributeValues: {'Size' : 'Small'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 13,
//               price: 5999,
//               image: BImages.p19_s1,
//               attributeValues: {'Size' : 'Medium'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 11,
//               price: 6299,
//               image: BImages.p19_s1,
//               attributeValues: {'Size' : 'Large'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 18,
//               price: 6599,
//               image: BImages.p19_s1,
//               attributeValues: {'Size' : 'XL'}
//           ),
//         ]
//     ),
//
//     ProductModel(
//         id: '20',
//         title: 'Puma Shirt',
//         stock: 42,
//         price: 4499,
//         isFeatured: true,
//         thumbnail: BImages.p20_t,
//         description: 'Puma desc',
//         brand: BrandModel(
//             id: '5',
//             image: BImages.pumaLogo,
//             name: 'Puma',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p20_s1,
//           BImages.p20_s2
//         ],
//         salePrice: 2999,
//         sku: 'ABR4568',
//         categoryId: '4',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Color', values: ['Black', 'White', 'Green'])
//         ],
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 10,
//               price: 6599,
//               image: BImages.p20_vb,
//               attributeValues: {'Color' : 'Black'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 7,
//               price: 6599,
//               image: BImages.p20_vw,
//               attributeValues: {'Color' : 'White'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 12,
//               price: 6599,
//               image: BImages.p20_vg,
//               attributeValues: {'Color' : 'Green'}
//           ),
//
//         ]
//
//     ),
//
//     ProductModel(
//         id: '21',
//         title: 'Jordan Shirt',
//         stock: 21,
//         price: 7299,
//         isFeatured: true,
//         thumbnail: BImages.p21_t,
//         description: 'Jordan desc',
//         brand: BrandModel(
//             id: '4',
//             image: BImages.jordanLogo,
//             name: 'Jordan',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p21_s1,
//           BImages.p21_s2,
//           BImages.p21_s3,
//         ],
//         salePrice: 5299,
//         sku: 'ABR4568',
//         categoryId: '4',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['Medium', 'Large']),
//           ProductAttributeModel(name: 'Color', values: ['Blue', 'Cream', 'Dark Brown']),
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 12,
//               price: 6599,
//               image: BImages.p21_vb,
//               attributeValues: {'Size' : 'Medium', 'Color' : 'Blue'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 12,
//               price: 6599,
//               image: BImages.p21_vb,
//               attributeValues: {'Size' : 'Large', 'Color' : 'Blue'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 12,
//               price: 6599,
//               image: BImages.p21_vc,
//               attributeValues: {'Size' : 'Medium', 'Color' : 'Cream'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 12,
//               price: 6599,
//               image: BImages.p21_vc,
//               attributeValues: {'Size' : 'Large', 'Color' : 'Cream'}
//           ),
//           ProductVariationModel(
//               id: '5',
//               stock: 12,
//               price: 6599,
//               image: BImages.p21_vdb,
//               attributeValues: {'Size' : 'Medium', 'Color' : 'Dark Brown'}
//           ),
//           ProductVariationModel(
//               id: '6',
//               stock: 12,
//               price: 6599,
//               image: BImages.p21_vdb,
//               attributeValues: {'Size' : 'Large', 'Color' : 'Dark Brown'}
//           ),
//         ]
//     ),
//
//     // Jeans
//
//     ProductModel(
//         id: '22',
//         title: 'Puma Jeans',
//         stock: 32,
//         price: 4299,
//         isFeatured: true,
//         thumbnail: BImages.p22_t,
//         description: 'Puma desc',
//         brand: BrandModel(
//             id: '5',
//             image: BImages.pumaLogo,
//             name: 'Puma',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p22_s1,
//           BImages.p22_s2,
//           BImages.p22_s3,
//         ],
//         salePrice: 3599,
//         sku: 'ABR4568',
//         categoryId: '4',
//         productType: 'ProductType.variable',
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['Small', 'Medium', 'Large'])
//         ],
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 12,
//               price: 3999,
//               image: BImages.p22_s1,
//               attributeValues: {'Size' : 'Small'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 10,
//               price: 4299,
//               image: BImages.p22_s1,
//               attributeValues: {'Size' : 'Medium'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 10,
//               price: 4499,
//               image: BImages.p22_s1,
//               attributeValues: {'Size' : 'Large'}
//           ),
//         ]
//     ),
//
//     ProductModel(
//       id: '23',
//       title: 'Jordan Jeans',
//       stock: 21,
//       price: 5499,
//       isFeatured: true,
//       thumbnail: BImages.p24_t,
//       description: 'Jordan desc',
//       brand: BrandModel(
//           id: '4',
//           image: BImages.jordanLogo,
//           name: 'Jordan',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p23_s1,
//         BImages.p23_s2,
//         BImages.p23_s3,
//       ],
//       salePrice: 4599,
//       sku: 'ABR4568',
//       categoryId: '4',
//       productType: 'ProductType.single',
//     ),
//
//     // Jacket
//
//     ProductModel(
//         id: '24',
//         title: 'Puma Jacket',
//         stock: 42,
//         price: 7299,
//         isFeatured: true,
//         thumbnail: BImages.p24_t,
//         description: 'Puma desc',
//         brand: BrandModel(
//             id: '5',
//             image: BImages.pumaLogo,
//             name: 'Puma',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p24_s1,
//           BImages.p24_s2,
//           BImages.p24_s3,
//         ],
//         salePrice: 5999,
//         sku: 'ABR4568',
//         categoryId: '4',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Color', values: ['Red', 'Black']),
//           ProductAttributeModel(name: 'Size', values: ['Small', 'Medium', 'Large'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 7,
//               price: 7299,
//               image: BImages.p24_vr,
//               attributeValues: {'Size' : 'Small', 'Color' : 'Red'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 7,
//               price: 7299,
//               image: BImages.p24_vr,
//               attributeValues: {'Size' : 'Medium', 'Color' : 'Red'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 7,
//               price: 7299,
//               image: BImages.p24_vr,
//               attributeValues: {'Size' : 'Large', 'Color' : 'Red'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 7,
//               price: 7299,
//               image: BImages.p24_vb,
//               attributeValues: {'Size' : 'Small', 'Color' : 'Black'}
//           ),
//           ProductVariationModel(
//               id: '5',
//               stock: 7,
//               price: 7299,
//               image: BImages.p24_vb,
//               attributeValues: {'Size' : 'Medium', 'Color' : 'Black'}
//           ),
//           ProductVariationModel(
//               id: '6',
//               stock: 7,
//               price: 7299,
//               image: BImages.p24_vb,
//               attributeValues: {'Size' : 'Large', 'Color' : 'Black'}
//           )
//         ]
//     ),
//
//     ProductModel(
//         id: '25',
//         title: 'Jordan Jacket',
//         stock: 33,
//         price: 8299,
//         isFeatured: true,
//         thumbnail: BImages.p25_t,
//         description: 'Puma desc',
//         brand: BrandModel(
//             id: '4',
//             image: BImages.jordanLogo,
//             name: 'Jordan',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p25_s1,
//           BImages.p25_s2,
//           BImages.p25_s3,
//           BImages.p25_s4
//         ],
//         salePrice: 6999,
//         sku: 'ABR4568',
//         categoryId: '4',
//         productType: 'ProductType.variable',
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['Small', 'Medium', 'Large'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 11,
//               price: 7299,
//               image: BImages.p25_s1,
//               attributeValues: {'Size' : 'Small'}
//           ),
//           ProductVariationModel(
//               id: '1',
//               stock: 11,
//               price: 7699,
//               image: BImages.p25_s1,
//               attributeValues: {'Size' : 'Medium'}
//           ),
//           ProductVariationModel(
//               id: '1',
//               stock: 11,
//               price: 8299,
//               image: BImages.p25_s1,
//               attributeValues: {'Size' : 'Large'}
//           )
//         ]
//
//     ),
//
//     // Pet Food
//
//     ProductModel(
//         id: '26',
//         title: 'Zara Pet food',
//         stock: 89,
//         price: 999,
//         isFeatured: true,
//         thumbnail: BImages.p26_t,
//         description: 'Zara desc',
//         brand: BrandModel(
//             id: '6',
//             image: BImages.zaraLogo,
//             name: 'Zara',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p26_s1,
//           BImages.p26_s2,
//         ],
//         salePrice: 849,
//         sku: 'ABR4568',
//         categoryId: '5',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['Teeny', 'Value'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 31,
//               price: 499,
//               image: BImages.p26_s1,
//               attributeValues: {'Size' : 'Teeny'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 58,
//               price: 999,
//               image: BImages.p26_s1,
//               attributeValues: {'Size' : 'Value'}
//           )
//         ]
//     ),
//
//     // Pet Toys
//
//     ProductModel(
//       id: '27',
//       title: 'Zara Pet Toys',
//       stock: 68,
//       price: 649,
//       isFeatured: true,
//       thumbnail: BImages.p27_t,
//       description: 'Zara desc',
//       brand: BrandModel(
//           id: '6',
//           image: BImages.zaraLogo,
//           name: 'Zara',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p27_s3p,
//         BImages.p27_s4p
//       ],
//       salePrice: 599,
//       sku: 'ABR4568',
//       categoryId: '5',
//       productType: 'ProductType.single',
//     ),
//
//     // Casual Shoes
//
//     ProductModel(
//       id: '28',
//       title: 'Nike Casual Shoes',
//       stock: 45,
//       price: 4999,
//       isFeatured: true,
//       thumbnail: BImages.p28_t,
//       description: 'Zara desc',
//       brand: BrandModel(
//           id: '1',
//           image: BImages.nikeLogo,
//           name: 'Nike',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p28_s1,
//         BImages.p28_s2,
//         BImages.p28_s3,
//         BImages.p28_s4,
//         BImages.p28_s5
//       ],
//       salePrice: 3999,
//       sku: 'ABR4568',
//       categoryId: '6',
//       productType: 'ProductType.single',
//     ),
//
//     ProductModel(
//         id: '29',
//         title: 'Jordan Casual Shoes',
//         stock: 23,
//         price: 6999,
//         isFeatured: true,
//         thumbnail: BImages.p29_t,
//         description: 'Zara desc',
//         brand: BrandModel(
//             id: '4',
//             image: BImages.jordanLogo,
//             name: 'Jordan',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p29_s1,
//           BImages.p29_s2,
//           BImages.p29_s3
//         ],
//         salePrice: 5999,
//         sku: 'ABR4568',
//         categoryId: '6',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['EU 30cm', 'EU 32cm', 'EU 34cm'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 7,
//               price: 6999,
//               image: BImages.p29_s1,
//               attributeValues: {'Size' : 'EU 30cm'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 8,
//               price: 6999,
//               image: BImages.p29_s1,
//               attributeValues: {'Size' : 'EU 32cm'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 8,
//               price: 6999,
//               image: BImages.p29_s1,
//               attributeValues: {'Size' : 'EU 34cm'}
//           ),
//         ]
//
//     ),
//
//     // Formal Shoes
//
//     ProductModel(
//         id: '30',
//         title: 'Adidas Formal Shoes',
//         stock: 39,
//         price: 7999,
//         isFeatured: true,
//         thumbnail: BImages.p30_t,
//         description: 'Zara desc',
//         brand: BrandModel(
//             id: '2',
//             image: BImages.adidasLogo,
//             name: 'Adidas',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p30_s1,
//           BImages.p30_s2,
//           BImages.p30_s3,
//           BImages.p30_s4,
//         ],
//         salePrice: 6499,
//         sku: 'ABR4568',
//         categoryId: '6',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['EU 30cm', 'EU 32cm', 'EU 34cm'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 12,
//               price: 6999,
//               image: BImages.p30_s2,
//               attributeValues: {'Size' : 'EU 30cm'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 10,
//               price: 7999,
//               image: BImages.p30_s2,
//               attributeValues: {'Size' : 'EU 32cm'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 17,
//               price: 7999,
//               image: BImages.p29_s2,
//               attributeValues: {'Size' : 'EU 34cm'}
//           ),
//         ]
//     ),
//
//     ProductModel(
//       id: '31',
//       title: 'Jordan Casual Shoes',
//       stock: 45,
//       price: 8299,
//       isFeatured: true,
//       thumbnail: BImages.p31_t,
//       description: 'Zara desc',
//       brand: BrandModel(
//           id: '4',
//           image: BImages.jordanLogo,
//           name: 'Jordan',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p31__s1,
//         BImages.p31_s2,
//         BImages.p31_s3,
//         BImages.p31_s4,
//       ],
//       salePrice: 7699,
//       sku: 'ABR4568',
//       categoryId: '6',
//       productType: 'ProductType.single',
//     ),
//
//     // Sneakers
//
//     ProductModel(
//         id: '32',
//         title: 'Nike Sneakers',
//         stock: 61,
//         price: 4099,
//         isFeatured: true,
//         thumbnail: BImages.p32_t,
//         description: 'Nike desc',
//         brand: BrandModel(
//             id: '1',
//             image: BImages.nikeLogo,
//             name: 'Nike',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p32_s1,
//           BImages.p32_s2,
//           BImages.p32_s3
//         ],
//         salePrice: 3499,
//         sku: 'ABR4568',
//         categoryId: '6',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['EU 30cm', 'EU 32cm', 'EU 34cm']),
//           ProductAttributeModel(name: 'Color', values: ['Black', 'White'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 9,
//               price: 4099,
//               image: BImages.p32_vb,
//               attributeValues: {'Size' : 'EU 34cm, Color: Black'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 6,
//               price: 4099,
//               image: BImages.p32_vb,
//               attributeValues: {'Size' : 'EU 32cm', 'Color': 'Black'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 14,
//               price: 4099,
//               image: BImages.p32_vb,
//               attributeValues: {'Size' : 'EU 30cm', 'Color': 'Black'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 11,
//               price: 4099,
//               image: BImages.p32_vw,
//               attributeValues: {'Size' : 'EU 34cm', 'Color': 'White'}
//           ),
//           ProductVariationModel(
//               id: '5',
//               stock: 8,
//               price: 4099,
//               image: BImages.p32_vw,
//               attributeValues: {'Size' : 'EU 32cm', 'Color': 'White'}
//           ),
//           ProductVariationModel(
//               id: '6',
//               stock: 13,
//               price: 4099,
//               image: BImages.p32_vw,
//               attributeValues: {'Size' : 'EU 30cm', 'Color': 'White'}
//           ),
//         ]
//     ),
//
//
//     ProductModel(
//         id: '33',
//         title: 'Adidas Sneakers',
//         stock: 61,
//         price: 4099,
//         isFeatured: true,
//         thumbnail: BImages.p33_t,
//         description: 'Adidas desc',
//         brand: BrandModel(
//             id: '2',
//             image: BImages.adidasLogo,
//             name: 'Adidas',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p33_s1,
//           BImages.p33_s2,
//           BImages.p33_s3
//         ],
//         salePrice: 3499,
//         sku: 'ABR4568',
//         categoryId: '6',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['EU 32cm', 'EU 34cm']),
//           ProductAttributeModel(name: 'Color', values: ['Red', 'Blue', 'Dark Brown'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 10,
//               price: 4099,
//               image: BImages.p33_vr,
//               attributeValues: {'Size' : 'EU 32cm', 'Color': 'Red'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 10,
//               price: 4099,
//               image: BImages.p33_vr,
//               attributeValues: {'Size' : 'EU 34cm', 'Color': 'Red'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 10,
//               price: 4099,
//               image: BImages.p33_vb,
//               attributeValues: {'Size' : 'EU 32cm', 'Color': 'Blue'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 10,
//               price: 4099,
//               image: BImages.p33_vb,
//               attributeValues: {'Size' : 'EU 34cm', 'Color': 'Blue'}
//           ),
//           ProductVariationModel(
//               id: '5',
//               stock: 10,
//               price: 4099,
//               image: BImages.p33_vdb,
//               attributeValues: {'Size' : 'EU 32cm', 'Color': 'Dark Brown'}
//           ),
//           ProductVariationModel(
//               id: '6',
//               stock: 10,
//               price: 4099,
//               image: BImages.p33_vdb,
//               attributeValues: {'Size' : 'EU 34cm', 'Color': 'Dark Brown'}
//           ),
//
//         ]
//     ),
//
//
//     ProductModel(
//         id: '34',
//         title: 'Jordan Sneakers',
//         stock: 29,
//         price: 6299,
//         isFeatured: true,
//         thumbnail: BImages.p34_t,
//         description: 'Nike desc',
//         brand: BrandModel(
//             id: '4',
//             image: BImages.jordanLogo,
//             name: 'Jordan',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p34_s1,
//           BImages.p34_s2,
//           BImages.p34_s3
//         ],
//         salePrice: 4999,
//         sku: 'ABR4568',
//         categoryId: '6',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['EU 30cm', 'EU 32cm', 'EU 34cm']),
//           ProductAttributeModel(name: 'Color', values: ['Black', 'White'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 5,
//               price: 6299,
//               image: BImages.p34_vb,
//               attributeValues: {'Size' : 'EU 34cm, Color: Black'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 5,
//               price: 6299,
//               image: BImages.p34_vb,
//               attributeValues: {'Size' : 'EU 32cm', 'Color': 'Black'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 4,
//               price: 6299,
//               image: BImages.p34_vb,
//               attributeValues: {'Size' : 'EU 30cm', 'Color': 'Black'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 5,
//               price: 6299,
//               image: BImages.p34_vw,
//               attributeValues: {'Size' : 'EU 34cm', 'Color': 'White'}
//           ),
//           ProductVariationModel(
//               id: '5',
//               stock: 5,
//               price: 6299,
//               image: BImages.p34_vw,
//               attributeValues: {'Size' : 'EU 32cm', 'Color': 'White'}
//           ),
//           ProductVariationModel(
//               id: '6',
//               stock: 5,
//               price: 6299,
//               image: BImages.p34_vw,
//               attributeValues: {'Size' : 'EU 30cm', 'Color': 'White'}
//           ),
//         ]
//
//     ),
//
//
//     // Lipstick
//
//     ProductModel(
//         id: '35',
//         title: 'Zara Lipstick',
//         stock: 489,
//         price: 899,
//         isFeatured: true,
//         thumbnail: BImages.p35_t,
//         description: 'Nike desc',
//         brand: BrandModel(
//             id: '6',
//             image: BImages.zaraLogo,
//             name: 'Zara',
//             productsCount: 265,
//             isFeatured: true),
//         images:
//         [
//           BImages.p35_t
//         ],
//         salePrice: 549,
//         sku: 'ABR4568',
//         categoryId: '7',
//         productType: 'ProductType.variable',
//
//         productAttributes: [
//           ProductAttributeModel(name: 'Size', values: ['EU 32cm', 'EU 34cm']),
//           ProductAttributeModel(name: 'Color', values: ['Dark Red', 'Blue', 'Chocolate'])
//         ],
//
//         productVariations: [
//           ProductVariationModel(
//               id: '1',
//               stock: 10,
//               price: 4099,
//               image: BImages.p35_vr,
//               attributeValues: {'Size' : 'EU 32cm', 'Color': 'Red'}
//           ),
//           ProductVariationModel(
//               id: '2',
//               stock: 10,
//               price: 4099,
//               image: BImages.p35_vr,
//               attributeValues: {'Size' : 'EU 34cm', 'Color': 'Red'}
//           ),
//           ProductVariationModel(
//               id: '3',
//               stock: 10,
//               price: 4099,
//               image: BImages.p35_dr,
//               attributeValues: {'Size' : 'EU 32cm', 'Color': 'Dark Red'}
//           ),
//           ProductVariationModel(
//               id: '4',
//               stock: 10,
//               price: 4099,
//               image: BImages.p35_dr,
//               attributeValues: {'Size' : 'EU 34cm', 'Color': 'Dark Red'}
//           ),
//           ProductVariationModel(
//               id: '5',
//               stock: 10,
//               price: 4099,
//               image: BImages.p35_vc,
//               attributeValues: {'Size' : 'EU 32cm', 'Color': 'Chocolate'}
//           ),
//           ProductVariationModel(
//               id: '6',
//               stock: 10,
//               price: 4099,
//               image: BImages.p35_vc,
//               attributeValues: {'Size' : 'EU 34cm', 'Color': 'Chocolate'}
//           ),
//
//         ]
//     ),
//
//     // Face cream
//
//     ProductModel(
//       id: '36',
//       title: 'Zara Face cream',
//       stock: 210,
//       price: 1099,
//       isFeatured: true,
//       thumbnail: BImages.p36_t,
//       description: 'Zara desc',
//       brand: BrandModel(
//           id: '6',
//           image: BImages.zaraLogo,
//           name: 'Zara',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p36_t
//       ],
//       salePrice: 799,
//       sku: 'ABR4568',
//       categoryId: '7',
//       productType: 'ProductType.single',
//     ),
//
//     // Necklace
//
//     ProductModel(
//       id: '37',
//       title: 'Zara Necklace',
//       stock: 49,
//       price: 12999,
//       isFeatured: true,
//       thumbnail: BImages.p37_t,
//       description: 'Zara desc',
//       brand: BrandModel(
//           id: '6',
//           image: BImages.zaraLogo,
//           name: 'Zara',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p37_t
//       ],
//       salePrice: 9999,
//       sku: 'ABR4568',
//       categoryId: '8',
//       productType: 'ProductType.single',
//     ),
//
//     // Earrings
//
//     ProductModel(
//       id: '38',
//       title: 'Zara Earrings',
//       stock: 91,
//       price: 7999,
//       isFeatured: true,
//       thumbnail: BImages.p38_t,
//       description: 'Zara desc',
//       brand: BrandModel(
//           id: '6',
//           image: BImages.zaraLogo,
//           name: 'Zara',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p38_t
//       ],
//       salePrice: 6499,
//       sku: 'ABR4568',
//       categoryId: '8',
//       productType: 'ProductType.single',
//     ),
//
//     ProductModel(
//       id: '39',
//       title: 'Zara Necklace',
//       stock: 49,
//       price: 12999,
//       isFeatured: true,
//       thumbnail: BImages.p39_t,
//       description: 'Zara desc',
//       brand: BrandModel(
//           id: '6',
//           image: BImages.zaraLogo,
//           name: 'Zara',
//           productsCount: 265,
//           isFeatured: true),
//       images:
//       [
//         BImages.p39_s1,
//         BImages.p39_s2
//       ],
//       salePrice: 9999,
//       sku: 'ABR4568',
//       categoryId: '8',
//       productType: 'ProductType.single',
//     ),
//   ];
//
//
//   static final List<ProductCategoryModel> productCategory=[
//     ProductCategoryModel(productId: '1',categoryId: '1' ),
//     ProductCategoryModel(productId: '1',categoryId: '9' ),
//     ProductCategoryModel(productId: '2',categoryId: '1' ),
//     ProductCategoryModel(productId: '2',categoryId: '9' ),
//     ProductCategoryModel(productId: '3',categoryId: '1' ),
//     ProductCategoryModel(productId: '3',categoryId: '9' ),
//     ProductCategoryModel(productId: '4',categoryId: '1' ),
//     ProductCategoryModel(productId: '4',categoryId: '10' ),
//     ProductCategoryModel(productId: '5',categoryId: '1' ),
//     ProductCategoryModel(productId: '5',categoryId: '10' ),
//     ProductCategoryModel(productId: '6',categoryId: '1' ),
//     ProductCategoryModel(productId: '6',categoryId: '10' ),
//     ProductCategoryModel(productId: '7',categoryId: '1' ),
//     ProductCategoryModel(productId: '7',categoryId: '11' ),
//     ProductCategoryModel(productId: '8',categoryId: '1' ),
//     ProductCategoryModel(productId: '8',categoryId: '11' ),
//     ProductCategoryModel(productId: '9',categoryId: '1' ),
//     ProductCategoryModel(productId: '9',categoryId: '11' ),
//     ProductCategoryModel(productId: '10',categoryId: '2' ),
//     ProductCategoryModel(productId: '10',categoryId: '12' ),
//
//     ProductCategoryModel(productId: '11',categoryId: '2' ),
//     ProductCategoryModel(productId: '11',categoryId: '12' ),
//     ProductCategoryModel(productId: '12',categoryId: '2' ),
//     ProductCategoryModel(productId: '12',categoryId: '13' ),
//     ProductCategoryModel(productId: '13',categoryId: '3' ),
//     ProductCategoryModel(productId: '13',categoryId: '14' ),
//     ProductCategoryModel(productId: '14',categoryId: '3' ),
//     ProductCategoryModel(productId: '14',categoryId: '14' ),
//     ProductCategoryModel(productId: '15',categoryId: '3' ),
//     ProductCategoryModel(productId: '15',categoryId: '15' ),
//     ProductCategoryModel(productId: '16',categoryId: '3' ),
//     ProductCategoryModel(productId: '16',categoryId: '15' ),
//     ProductCategoryModel(productId: '17',categoryId: '3' ),
//     ProductCategoryModel(productId: '17',categoryId: '16' ),
//     ProductCategoryModel(productId: '18',categoryId: '3' ),
//     ProductCategoryModel(productId: '18',categoryId: '16' ),
//     ProductCategoryModel(productId: '19',categoryId: '4' ),
//     ProductCategoryModel(productId: '19',categoryId: '17' ),
//     ProductCategoryModel(productId: '20',categoryId: '4' ),
//     ProductCategoryModel(productId: '20',categoryId: '17' ),
//
//     ProductCategoryModel(productId: '21',categoryId: '4' ),
//     ProductCategoryModel(productId: '21',categoryId: '17' ),
//     ProductCategoryModel(productId: '22',categoryId: '4' ),
//     ProductCategoryModel(productId: '22',categoryId: '18' ),
//     ProductCategoryModel(productId: '23',categoryId: '4' ),
//     ProductCategoryModel(productId: '23',categoryId: '18' ),
//     ProductCategoryModel(productId: '24',categoryId: '4' ),
//     ProductCategoryModel(productId: '24',categoryId: '19' ),
//     ProductCategoryModel(productId: '25',categoryId: '4' ),
//     ProductCategoryModel(productId: '25',categoryId: '19' ),
//     ProductCategoryModel(productId: '26',categoryId: '5' ),
//     ProductCategoryModel(productId: '26',categoryId: '20' ),
//     ProductCategoryModel(productId: '27',categoryId: '5' ),
//     ProductCategoryModel(productId: '27',categoryId: '21' ),
//     ProductCategoryModel(productId: '28',categoryId: '6' ),
//     ProductCategoryModel(productId: '28',categoryId: '22' ),
//     ProductCategoryModel(productId: '29',categoryId: '6' ),
//     ProductCategoryModel(productId: '29',categoryId: '22' ),
//     ProductCategoryModel(productId: '30',categoryId: '6' ),
//     ProductCategoryModel(productId: '30',categoryId: '23' ),
//
//     ProductCategoryModel(productId: '31',categoryId: '6' ),
//     ProductCategoryModel(productId: '31',categoryId: '23' ),
//     ProductCategoryModel(productId: '32',categoryId: '6' ),
//     ProductCategoryModel(productId: '32',categoryId: '24' ),
//     ProductCategoryModel(productId: '33',categoryId: '6' ),
//     ProductCategoryModel(productId: '33',categoryId: '24' ),
//     ProductCategoryModel(productId: '34',categoryId: '6' ),
//     ProductCategoryModel(productId: '34',categoryId: '24' ),
//     ProductCategoryModel(productId: '35',categoryId: '7' ),
//     ProductCategoryModel(productId: '35',categoryId: '25' ),
//     ProductCategoryModel(productId: '36',categoryId: '7' ),
//     ProductCategoryModel(productId: '36',categoryId: '26' ),
//     ProductCategoryModel(productId: '37',categoryId: '8' ),
//     ProductCategoryModel(productId: '37',categoryId: '27' ),
//     ProductCategoryModel(productId: '38',categoryId: '8' ),
//     ProductCategoryModel(productId: '38',categoryId: '28' ),
//     ProductCategoryModel(productId: '39',categoryId: '8' ),
//     ProductCategoryModel(productId: '39',categoryId: '29' ),
//
//   ];
//
// }
