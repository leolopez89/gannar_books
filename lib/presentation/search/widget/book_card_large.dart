import 'package:flutter/material.dart';
import 'package:gannar_books/domain/models/book.dart';
import 'package:gannar_books/presentation/home/widgets/diaginal_wave.dart';
import 'package:gannar_books/utils/constants/strings.dart';
import 'package:gannar_books/utils/constants/styles.dart';

class BookCardLarge extends StatelessWidget {
  const BookCardLarge(this.book, {required this.onTap, super.key});

  final Book book;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        alignment: Alignment.topRight,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: AppColors.lightBlue),
            ),
            margin: EdgeInsets.only(
                left: 12, right: 12, top: size.width * 0.1, bottom: 24),
            width: size.width,
            padding: EdgeInsets.only(
                left: 24, right: size.width * 0.5, top: 24, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.title,
                  style: AppStyle.semiBoldAskan16Blue,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
                if (book.subtitle.isNotEmpty) ...[
                  const SizedBox(height: 8),
                  Text(
                    book.subtitle,
                    style: AppStyle.regularAskan15,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    book.price == "\$0.00" ? "Gratis" : book.price,
                    style: AppStyle.boldAskan18,
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            clipBehavior: Clip.hardEdge,
            margin: const EdgeInsets.only(right: 40),
            child: DiagonalWave(size.width * 0.4),
          ),
          Container(
            width: size.width * 0.4,
            height: size.width * 0.4,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
            margin: const EdgeInsets.only(right: 40),
            child: Image.network(book.image, width: size.width * 0.4),
          ),
        ],
      ),
    );
  }
}
