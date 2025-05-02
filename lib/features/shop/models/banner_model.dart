import 'package:cloud_firestore/cloud_firestore.dart';

class BannerModel {
  String imageUrl;
  final String targetScreen;
  final bool active;

  BannerModel(
      {required this.imageUrl,
      required this.targetScreen,
      required this.active});

  Map<String, dynamic> toJson() {
    return {
      'ImageUrl': imageUrl,
      'TargetScreen': targetScreen,
      'Active': active,
    };
  }

  factory BannerModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data=document.data() as Map<String,dynamic>;
      return BannerModel(
        imageUrl: data['ImageUrl'] ?? '',
        targetScreen: data['TargetScreen'] ?? '',
        active: data['Active'] ?? false,
      );
  }
}
