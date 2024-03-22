import 'package:flutter/material.dart';
import 'package:gannar_books/domain/models/book.dart';
import 'package:gannar_books/presentation/details/details_page.dart';
import 'package:gannar_books/presentation/search/search_contract.dart';
import 'package:gannar_books/presentation/search/search_presenter.dart';
import 'package:gannar_books/presentation/search/search_provider.dart';
import 'package:gannar_books/presentation/search/widget/book_card_large.dart';
import 'package:gannar_books/utils/constants/strings.dart';
import 'package:gannar_books/utils/constants/styles.dart';
import 'package:gannar_books/utils/services/services.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({required this.query, super.key});

  final String query;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SearchProvider>(
      create: (context) =>
          SearchProvider(booksRepository: getIt(), query: query),
      child: Scaffold(body: SearchContent(query)),
    );
  }
}

class SearchContent extends StatefulWidget {
  const SearchContent(this.query, {super.key});

  final String query;
  @override
  State<SearchContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<SearchContent> implements SearchContract {
  List<Book> _books = [];

  bool _isLoading = false;

  late SearchPresenter presenter;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      presenter =
          SearchPresenter(provider: context.read<SearchProvider>(), view: this);
      presenter.loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SearchProvider>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 70),
              Container(
                padding: const EdgeInsets.only(left: 10, right: 24, bottom: 24),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: _isLoading ? null : presenter.goBack,
                      icon: const Icon(Icons.arrow_back, color: Colors.black),
                    ),
                    Text("Resultados de: ${widget.query}",
                        style: AppStyle.semiBoldAskan20Blue),
                  ],
                ),
              ),
              if (_isLoading)
                const Center(
                    child: CircularProgressIndicator(
                  color: AppColors.baseColor,
                )),
              if (!_isLoading)
                Padding(
                  padding: const EdgeInsets.only(left: 24, bottom: 16),
                  child: Text(
                      _books.isEmpty
                          ? "No hay resultados"
                          : "${_books.length} resultados",
                      style: AppStyle.regularAskan18Black),
                ),
              ..._books.map((book) => BookCardLarge(book,
                  onTap: () => presenter.viewDetails(book))),
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

  @override
  void onTapBook(Book book) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => DetailsPage(book: book)),
    );
  }

  @override
  void showBooksList(List<Book> books) {
    setState(() {
      _isLoading = false;
      _books = books;
    });
  }
}
