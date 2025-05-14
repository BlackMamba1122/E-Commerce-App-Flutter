import 'package:flutter_application_1/features/shop/controllers/variation_controller.dart';
import 'package:flutter_application_1/features/shop/models/cart_model.dart';
import 'package:flutter_application_1/features/shop/models/product_model.dart';
import 'package:flutter_application_1/utils/constants/enums.dart';
import 'package:flutter_application_1/utils/local_storage/storage_utility.dart';
import 'package:flutter_application_1/utils/popups/loaders.dart';
import 'package:get/get.dart';

class CartController extends GetxController {
  static CartController get instance => Get.find();

  RxInt noOfCartItems = 0.obs;
  RxDouble totalCartPrice = 0.0.obs;
  RxInt productQuantityInCart = 0.obs;
  RxList<CartItemModel> cartItems = <CartItemModel>[].obs;
  final variationController = VariationController.instance;

  CartController(){
    loadCartItems();
  }

  void addToCart(ProductModel product) {
    if (productQuantityInCart < 1) {
      BLoaders.customToast(message: 'Select Quantity');
      return;
    }
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.id.isEmpty) {
      BLoaders.customToast(message: 'Select Variation');
      return;
    }
    if (product.productType == ProductType.variable.toString() &&
        variationController.selectedVariation.value.stock <
            productQuantityInCart.value) {
      BLoaders.customToast(message: 'Not Enough Stock');
      return;
    }
    ;
    if (product.productType == ProductType.single.toString() &&
        product.stock < productQuantityInCart.value) {
      BLoaders.customToast(message: 'Not Enough Stock');
      return;
    }
    final selectedCartItem =
        convertToCartItem(product, productQuantityInCart.value);
    int index = cartItems.indexWhere((item) =>
        item.productId == selectedCartItem.productId &&
        item.variationId == selectedCartItem.variationId);
    if (index >= 0) {
      cartItems[index].quantity += productQuantityInCart.value;
    } else {
      cartItems.add(selectedCartItem);
    }
    updateCart();
    BLoaders.customToast(message: 'Added to Cart');
  }

  void updateCart() {
    updateCartTotal();
    saveCartItems();
    cartItems.refresh();
  }

  void updateCartTotal() {
    double calculatedTotal = 0.0;
    int calculatedQuantity = 0;
    for (var item in cartItems) {
      calculatedTotal += item.price * item.quantity.toDouble();
      calculatedQuantity += item.quantity;
    }
    totalCartPrice.value = calculatedTotal;
    noOfCartItems.value = calculatedQuantity;
  }

  void saveCartItems() {
    final cartItemStrings = cartItems.map((item) => item.toJson()).toList();
    BLocalStorage.instance().saveData('cartItems', cartItemStrings);
  }

  void loadCartItems() {
    final cartItemStrings =
        BLocalStorage.instance().readData<List<dynamic>>('cartItems');
    if (cartItemStrings != null) {
      cartItems.assignAll(cartItemStrings
          .map((item) => CartItemModel.fromJson(item as Map<String, dynamic>)));
      updateCartTotal();
    }
  }

  int getProductQuantityInCart(String productId) {
    final foundItem = cartItems
        .where((item) => item.productId == productId)
        .fold(0, (previousValue, element) => previousValue + element.quantity);
    return foundItem;
  }

  int getVariationQuantityInCart(String productId, String variationId) {
    final foundItem = cartItems.firstWhere(
        (item) =>
            item.productId == productId && item.variationId == variationId,
        orElse: () => CartItemModel.empty());
    return foundItem.quantity;
  }

  void clearCart() {
    productQuantityInCart.value = 0;
    cartItems.clear();
    updateCart();
  }

  void addOneToCart(CartItemModel item) {
    int index = cartItems.indexWhere((cartItem)=>cartItem.productId==item.productId && cartItem.variationId==item.variationId);
    if(index>=0) {
      cartItems[index].quantity++;
    } else {
      cartItems.add(item);
    }
    updateCart();
  }

  void removeOneFromCart(CartItemModel item){
    int index = cartItems.indexWhere((cartItem)=>cartItem.productId==item.productId && cartItem.variationId==item.variationId);
    if(index>=0) {
      if(cartItems[index].quantity>1){
        cartItems[index].quantity--;
      } else {
        cartItems[index].quantity==1 ? removeFromCartDialog(index) : cartItems.removeAt(index);
      }
      updateCart();
    }
  }

  void removeFromCartDialog(int index){
    Get.defaultDialog(
      title: 'Remove Item',
      middleText: 'Are you sure you want to remove ?',
      onConfirm: () {
        cartItems.removeAt(index);
        updateCart();
        BLoaders.customToast(message: 'Product removed');
        Get.back();
      },
      onCancel: ()=>()=>Get.back(),
    );
  }

  void updateAlreadyAddedProductCount(ProductModel product) {
    if(product.productType == ProductType.single.toString()){
      productQuantityInCart.value = getProductQuantityInCart(product.id);
    }else {
      final variaionId=variationController.selectedVariation.value.id;
      if(variaionId.isNotEmpty){
        productQuantityInCart.value=getVariationQuantityInCart(product.id, variaionId);
      }else {
        productQuantityInCart.value = 0;
      }
    }
  }

  CartItemModel convertToCartItem(ProductModel product, int quantity) {
    if (product.productType == ProductType.single.toString()) {
      variationController.resetSelectedAttributes();
    }
    final variation = variationController.selectedVariation.value;
    final isVariation = variation.id.isNotEmpty;
    final price = isVariation
        ? variation.salePrice > 0
            ? variation.salePrice
            : variation.price
        : product.salePrice > 0
            ? product.salePrice
            : product.price;

    return CartItemModel(
      productId: product.id,
      title: product.title,
      price: price,
      quantity: quantity,
      variationId: variation.id,
      image: isVariation ? variation.image : product.thumbnail,
      brandName: product.brand != null ? product.brand!.name : '',
      selectedVariation: isVariation ? variation.attributeValues : null,
    );
  }
}
