import 'package:flutter/material.dart';
import 'package:gannar_books/utils/constants/strings.dart';

// fontWeight: 400, 500, 600, 700
// family: Askan
mixin AppStyle {
  static TextStyle get semiBoldAskan20 => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.baseColor,
      );

  static TextStyle get semiBoldAskan20Black => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: Colors.black,
      );

  static TextStyle get boldAskan20Black => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20,
        color: Colors.black,
      );

  static TextStyle get semiBoldAskan20Blue => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 20,
        color: AppColors.darkBlue,
      );

  static TextStyle get regularAskan18 => const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 18,
        color: AppColors.seaBlue,
      );

  static TextStyle get boldAskan18 => const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 18,
        color: AppColors.niceGreen,
      );

  static TextStyle get regularAskan18Gray => const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 18,
        color: AppColors.lightGray,
      );

  static TextStyle get regularAskan18Black => const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 18,
        color: Colors.black,
      );

  static TextStyle get semiBoldAskan40 => const TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 40,
        color: AppColors.darkBlue,
      );

  static TextStyle get semiBoldAskan35 => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 35,
        color: AppColors.darkBlue,
      );

  static TextStyle get regularAskan30 => const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 30,
        color: Colors.black,
      );

  static TextStyle get semiBoldAskan16Blue => const TextStyle(
        fontWeight: FontWeight.w500,
        fontSize: 16,
        color: AppColors.darkBlue,
      );

  static TextStyle get regularAskan15 => const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: AppColors.lightGray,
      );

  static TextStyle get regularAskan14 => const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 14,
        color: AppColors.yellowCream,
      );

  static TextStyle get regularAskan17 => const TextStyle(
        fontWeight: FontWeight.normal,
        fontSize: 17,
        color: Colors.white,
      );
}

InputDecoration appInputDecoration({
  String? hintText,
  String? labelText,
  TextStyle? hintStyle,
  Widget? prefixIcon,
  Widget? suffix,
  Widget? suffixIcon,
  EdgeInsetsGeometry? padding,
}) {
  final borderStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: AppColors.lightBlue,
      width: 1,
    ),
  );
  final borderErrorStyle = OutlineInputBorder(
    borderRadius: BorderRadius.circular(20),
    borderSide: const BorderSide(
      color: Colors.redAccent,
      width: 1,
    ),
  );
  return InputDecoration(
    hintText: hintText ?? "",
    hintStyle: hintStyle,
    border: borderStyle,
    enabledBorder: borderStyle,
    focusedBorder: borderStyle,
    focusedErrorBorder: borderErrorStyle,
    disabledBorder: borderStyle,
    prefixIcon: prefixIcon,
    // prefixIconConstraints: prefixConstraints,
    suffixIcon: suffixIcon,
    suffix: suffix,
    // suffixIconConstraints: suffixConstraints,
    // fillColor: _setFillColor(),
    // filled: _setFilled(),
    labelStyle: const TextStyle(color: AppColors.baseColor),
    suffixStyle: const TextStyle(color: AppColors.baseColor),
    isDense: true,
    contentPadding: padding,
    counterText: "",
    labelText: labelText,
  );
}

Route createScaleRoute(Widget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      // const begin = Offset(0.0, 1.0);
      // const end = Offset.zero;
      // const curve = Curves.easeOutCubic;

      // var tween =
      //     Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return FadeTransition(
          opacity: animation,
          child: ScaleTransition(scale: animation, child: child));
    },
  );
}
