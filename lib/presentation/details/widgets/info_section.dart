import 'package:flutter/material.dart';
import 'package:gannar_books/utils/constants/styles.dart';

class InfoSection extends StatelessWidget {
  const InfoSection(
      {required this.title, required this.value, this.icon, super.key});

  final String title;
  final String value;
  final Icon? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          children: [
            if (icon != null) icon!,
            if (icon != null) const SizedBox(width: 8),
            Text(value, style: AppStyle.boldAskan20Black),
          ],
        ),
        const SizedBox(height: 8),
        Text(title,
            style: AppStyle.regularAskan18Gray.copyWith(fontFamily: "")),
      ],
    );
  }
}
