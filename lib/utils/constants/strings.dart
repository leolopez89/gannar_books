import 'package:flutter/material.dart';

/// Indica las llaves para acceder al almacenamiento local
mixin SPKeys {
  static const String userKey = "USER_KEY";
  static const String savedSearchKey = "SAVED_SEARCH_KEY";
}

/// Indica las urls para acceder a la API
mixin ApiEndoints {
  static const String baseUrl = "https://api.itbook.store/1.0";

  static const String news = "new";

  static const String search = "search";

  static const String books = "books";
}

mixin ImageAssets {
  static const String imgLoginBooks = "assets/img_books_login.jpg";
  static const String imgAvatar = "assets/img/img_avatar.png";
}

mixin AppColors {
  static const Color baseColor = Color(0xFF72B7B1);
  static const Color darkBlue = Color(0xFF061C41);
  static const Color lightBlue = Color(0xFFE2E9F2);
  static const Color lightGray = Color.fromARGB(255, 86, 90, 95);
  static const Color yellowCream = Color(0xFFEEBC74);
  static const Color seaBlue = Color(0xFF236ACF);
  static const Color asphaltGray = Color(0xFFAFC4D3);
  static const Color niceGreen = Color.fromARGB(255, 3, 128, 51);
}
