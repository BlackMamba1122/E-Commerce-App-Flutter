import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/constants/sizes.dart';

class BspacingStyle {
  static const EdgeInsetsGeometry paddingwithAppBarHeight = EdgeInsets.only(
    top: BSizes.appBarHeight,
    left: BSizes.defaultSpace,
    bottom: BSizes.defaultSpace,
    right: BSizes.defaultSpace,
  );
}