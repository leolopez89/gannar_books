import 'package:flutter/material.dart';
import 'package:gannar_books/domain/models/book.dart';
import 'package:gannar_books/presentation/details/details_contract.dart';
import 'package:gannar_books/presentation/details/details_presenter.dart';
import 'package:gannar_books/presentation/details/details_provider.dart';
import 'package:gannar_books/presentation/details/widgets/info_line.dart';
import 'package:gannar_books/presentation/details/widgets/info_section.dart';
import 'package:gannar_books/presentation/details/widgets/row_divider.dart';
import 'package:gannar_books/utils/constants/strings.dart';
import 'package:gannar_books/utils/constants/styles.dart';
import 'package:gannar_books/utils/services/services.dart';
import 'package:provider/provider.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailsProvider>(
      create: (context) =>
          DetailsProvider(booksRepository: getIt(), isbn13: book.isbn13),
      child: Scaffold(body: DetailsContent(book)),
    );
  }
}

class DetailsContent extends StatefulWidget {
  const DetailsContent(this.book, {super.key});

  final Book book;
  @override
  State<DetailsContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<DetailsContent>
    implements DetailsContract {
  Book _book = Book.empty();

  bool _isLoading = false;

  late DetailsPresenter presenter;

  @override
  void initState() {
    super.initState();
    _book = widget.book;
    _isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      presenter = DetailsPresenter(
          provider: context.read<DetailsProvider>(), view: this);
      presenter.loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Consumer<DetailsProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          gradient: RadialGradient(
                            colors: [
                              AppColors.lightBlue,
                              AppColors.asphaltGray,
                            ],
                            center: Alignment.topRight,
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 40, width: size.width),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 10, right: 24, bottom: 24),
                              child: IconButton(
                                onPressed: _isLoading ? null : presenter.goBack,
                                icon: const Icon(Icons.arrow_back,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, bottom: 15),
                              width: size.width * 0.5,
                              child: Text(_book.title,
                                  style: AppStyle.semiBoldAskan20Blue),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, bottom: 10),
                              width: size.width * 0.5,
                              child: Text("Por ${_book.authors}",
                                  style: AppStyle.regularAskan18),
                            ),
                            Container(
                              padding: const EdgeInsets.only(
                                  left: 24, right: 24, bottom: 20),
                              width: size.width * 0.5,
                              child: Text(
                                  _book.price == "\$0.00"
                                      ? "Gratis"
                                      : _book.price,
                                  style: AppStyle.boldAskan18),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 70,
                        width: size.width,
                        padding: const EdgeInsets.only(left: 24, bottom: 8),
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          "Descripción",
                          style: AppStyle.semiBoldAskan20Black,
                        ),
                      ),
                    ],
                  ),
                  Positioned(
                    right: 12,
                    bottom: 0,
                    child: Hero(
                      tag: "image-${_book.isbn13}",
                      child:
                          Image.network(_book.image, width: size.width * 0.5),
                    ),
                  ),
                ],
              ),
              if (_book.subtitle.isNotEmpty)
                Container(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Text(_book.subtitle, style: AppStyle.semiBoldAskan16Blue)
                    ],
                  ),
                ),
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(color: AppColors.baseColor),
                )
              else ...[
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 24),
                  child: Column(
                    children: [
                      Text(_book.desc, style: AppStyle.regularAskan18Gray)
                    ],
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    InfoSection(
                      title: "Opiniones",
                      value: _book.rating,
                      icon:
                          const Icon(Icons.star, color: AppColors.yellowCream),
                    ),
                    const RowDivider(),
                    InfoSection(
                      title: "Páginas",
                      value: _book.pages,
                      icon: const Icon(
                        Icons.menu_book_sharp,
                        color: AppColors.yellowCream,
                      ),
                    ),
                    const RowDivider(),
                    InfoSection(
                      title: "Año",
                      value: _book.year,
                      icon: const Icon(
                        Icons.calendar_month,
                        color: AppColors.yellowCream,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 18),
                  child:
                      Divider(height: 1, color: Colors.black.withOpacity(0.2)),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24),
                  child:
                      InfoLine(title: "Publicado por:", value: _book.publisher),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 24, top: 4, bottom: 24),
                  child: InfoLine(title: "Idioma:", value: _book.language),
                ),
              ],
            ],
          ),
        );
      },
    );
  }

  @override
  void onTapBack() {
    Navigator.of(context).pop();
  }

  @override
  void showBookDetails(Book book) {
    setState(() {
      _isLoading = false;
      _book = book;
    });
  }

  @override
  void showError(String error) {
    final snackBar = SnackBar(
      content: Text(error),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    setState(() {
      _isLoading = false;
    });
  }
}
