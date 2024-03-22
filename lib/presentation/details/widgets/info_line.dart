import 'package:flutter/material.dart';
import 'package:gannar_books/utils/constants/styles.dart';

class InfoLine extends StatelessWidget {
  const InfoLine(
      {required this.title, required this.value, this.icon, super.key});

  final String title;
  final String value;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        if (icon != null) icon!,
        if (icon != null) const SizedBox(width: 8),
        Text(title,
            style: AppStyle.regularAskan18Gray.copyWith(fontFamily: "")),
        const SizedBox(width: 8),
        Text(value, style: AppStyle.boldAskan20Black),
      ],
    );
  }
}
