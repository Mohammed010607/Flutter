import 'package:flutter/material.dart';
import 'package:library_app/utilities/constants/sizes.dart';

class FspacingStyle {
  static const EdgeInsetsGeometry paddingwithAppBarHeight =
      EdgeInsetsDirectional.only(
        top: FSizes.appBarheight,
        start: FSizes.defaultspace,
        bottom: FSizes.defaultspace,
        end: FSizes.defaultspace,
  );
}
