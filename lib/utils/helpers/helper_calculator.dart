import 'package:intl/intl.dart';

class BPricingCalculator {
/// Calculate Price based on tax and shipping
  static double calculateTotalPrice (double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost (location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }
/// - -- Calculate shipping cost
  static String calculateShippingCost(double productPrice, String location) {
    double shippingCost = getShippingCost (location);
    return NumberFormat('#,##0', 'en_US').format(shippingCost);
  }
/// -- Calculate tax
  static String calculateTax (double productPrice, String location) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return NumberFormat('#,##0', 'en_US').format(taxAmount);
  }
  static double getTaxRateForLocation(String location) {
    return 0.01;
  }
  static double getShippingCost(String location) {
    return 5.00;
  }
}