import 'package:flutter/material.dart';
import 'package:gannar_books/utils/constants/strings.dart';

class RowDivider extends StatelessWidget {
  const RowDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1,
      height: 20,
      margin: const EdgeInsetsDirectional.only(top: 5, bottom: 5),
      decoration: const BoxDecoration(
        border: Border(
          left: BorderSide(color: AppColors.asphaltGray, width: 1),
        ),
      ),
    );
  }
}
