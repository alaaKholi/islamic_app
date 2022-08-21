import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_helper.dart';

class FontsAppHelper {
  avenirArabicMediumFont({
    final int size = -1,
    final Color color = blackColor,
  }) {
    return TextStyle(
        fontFamily: 'AvenirArabicMedium',
        fontSize: size == -1 ? 14.sp : size.sp,
        fontWeight: FontWeight.w500,
        color: color);
  }

  avenirArabicHeavyFont({
    final int size = -1,
    final Color color = blackColor,
  }) {
    return TextStyle(
      fontWeight: FontWeight.w900,
      fontSize: size == -1 ? 18.sp : size.sp,
      color: color,
      fontFamily: 'AvenirArabicHeavy',
    );
  }

  avenirArabicBookFont({
    final int size = -1,
    final Color color = blackColor,
  }) {
    return TextStyle(
      fontFamily: 'AvenirArabicBook',
      color: color,
      fontWeight: FontWeight.w500,
      fontSize: size == -1 ? 14.sp : size.sp,
    );
  }
}
