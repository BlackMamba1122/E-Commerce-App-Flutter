import '../features/shop/models/banner_model.dart';
import '../features/shop/models/category_model.dart';
import '../routes/routes.dart';
import 'constants/imge_string.dart';

class DummyData{
  static final List<CategoryModel> categories = [
  CategoryModel(id: '1', image: BImages.sportIcon, name: 'Sports', isFeatured: true),
  CategoryModel(id: '5', image: BImages. furnitureIcon, name: 'Furniture', isFeatured: true),
  CategoryModel(id: '2', image: BImages.electronicsIcon, name: 'Electronics', isFeatured: true),
  CategoryModel(id: '3', image: BImages.clothIcon, name: 'Clothes', isFeatured: true),
  CategoryModel(id: '4', image: BImages.animalIcon, name: 'Animals', isFeatured: true),
  CategoryModel(id: '6', image: BImages.shoeIcon, name: 'Shoes', isFeatured: true),
  CategoryModel(id: '7', image: BImages.cosmeticsIcon, name: 'Cosmetics', isFeatured: true),
  CategoryModel(id: '14', image: BImages.jeweleryIcon, name: 'Jewelery', isFeatured: true),
  ///subcategories
  CategoryModel(id: '8', image: BImages.sportIcon, name: 'Sport Shoes', parentId: '1', isFeatured: false),
  CategoryModel(id: '9', image: BImages.sportIcon, name: 'Track suits', parentId: '1', isFeatured: false),
  CategoryModel(id: '10', image: BImages.sportIcon, name: 'Sports Equipments', parentId: '1', isFeatured: false),
//furniture
  CategoryModel(id: '11', image: BImages.furnitureIcon, name: 'Bedroom furniture', parentId: '5', isFeatured: false),
  CategoryModel(id: '12', image: BImages.furnitureIcon, name: 'Kitchen furniture', parentId: '5', isFeatured: false),
  CategoryModel(id: '13', image: BImages. furnitureIcon, name: 'Office furniture', parentId: '5', isFeatured: false),
//electronics
  CategoryModel(id: '14', image: BImages.electronicsIcon, name: 'Laptop', parentId: '2', isFeatured: false),
  CategoryModel(id: '15', image: BImages.electronicsIcon, name: 'Mobile', parentId: '2', isFeatured: false),
  CategoryModel(id: '16', image: BImages.clothIcon, name: 'Shirts', parentId: '3', isFeatured: false),
  ];

  static final List<BannerModel> banners = [
    BannerModel (imageUrl: BImages.banner1, targetScreen: BRoutes.order, active: false),
    BannerModel (imageUrl: BImages.banner2, targetScreen: BRoutes.cart, active: true),
    BannerModel(imageUrl: BImages.banner3, targetScreen: BRoutes. favourites, active: true),
    BannerModel (imageUrl: BImages.banner4, targetScreen: BRoutes.search, active: true),
    BannerModel (imageUrl: BImages.banner5, targetScreen: BRoutes.settings, active: true),
    BannerModel (imageUrl: BImages.banner6, targetScreen: BRoutes.userAddress, active: true),
    BannerModel(imageUrl: BImages.banner8, targetScreen: BRoutes.checkout, active: false),
  ];
}