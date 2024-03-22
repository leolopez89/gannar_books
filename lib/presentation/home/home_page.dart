import 'package:flutter/material.dart';
import 'package:gannar_books/domain/models/book.dart';
import 'package:gannar_books/domain/models/user.dart';
import 'package:gannar_books/presentation/details/details_page.dart';
import 'package:gannar_books/presentation/home/home_contract.dart';
import 'package:gannar_books/presentation/home/home_presenter.dart';
import 'package:gannar_books/presentation/home/home_provider.dart';
import 'package:gannar_books/presentation/home/widgets/book_card.dart';
import 'package:gannar_books/presentation/login/login_page.dart';
import 'package:gannar_books/presentation/search/search_page.dart';
import 'package:gannar_books/utils/constants/strings.dart';
import 'package:gannar_books/utils/constants/styles.dart';
import 'package:gannar_books/utils/services/services.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<HomeProvider>(
      create: (context) => getIt<HomeProvider>(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: const Scaffold(body: HomeContent()),
      ),
    );
  }
}

class HomeContent extends StatefulWidget {
  const HomeContent({super.key});
  @override
  State<HomeContent> createState() => _HomeContentState();
}

class _HomeContentState extends State<HomeContent> implements HomeContract {
  List<Book> _books = [];

  bool _isLoading = false;

  User _user = User.empty();

  HomePresenter? presenter;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      presenter =
          HomePresenter(homeProvider: context.read<HomeProvider>(), view: this);
      presenter?.loadData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeProvider>(
      builder: (context, provider, child) {
        String name = _user.username.isNotEmpty ? ", ${_user.username}" : "";
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const SizedBox(height: 70),
              Container(
                padding: const EdgeInsets.only(left: 24, right: 24, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Bienvenido$name", style: AppStyle.semiBoldAskan35),
                    Image.asset(ImageAssets.imgAvatar, width: 30),
                  ],
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                margin: const EdgeInsets.only(bottom: 26),
                child: Row(
                  children: [
                    Flexible(
                      child: LayoutBuilder(
                        builder: (context, constraints) => RawAutocomplete(
                          optionsBuilder: (TextEditingValue textEditingValue) {
                            return presenter?.searches ?? <String>[];
                          },
                          fieldViewBuilder: (_, controller, focusNode, submit) {
                            return TextFormField(
                              focusNode: focusNode,
                              controller: controller,
                              key: const Key('username'),
                              onChanged: presenter?.updateSearch,
                              decoration: appInputDecoration(
                                labelText: "Buscar",
                                prefixIcon: const Icon(
                                  Icons.search,
                                  color: AppColors.baseColor,
                                ),
                              ),
                              onFieldSubmitted: (s) => presenter?.search(),
                              textInputAction: TextInputAction.search,
                            );
                          },
                          optionsViewBuilder: (BuildContext context,
                              void Function(String) onSelected,
                              Iterable<String> options) {
                            return Align(
                              alignment: Alignment.topLeft,
                              child: SizedBox(
                                width: constraints.maxWidth,
                                child: Material(
                                  elevation: 4,
                                  clipBehavior: Clip.antiAlias,
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10)),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: options.map((e) {
                                      return ListTile(
                                        title: Text(e),
                                        onTap: () {
                                          onSelected(e);
                                          presenter?.updateSearch(e);
                                        },
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(left: 16),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        gradient: const RadialGradient(
                          // radius: 0.4,
                          colors: <Color>[Colors.grey, AppColors.darkBlue],
                          stops: <double>[0.0, .7],
                        ),
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: IconButton(
                        onPressed: presenter?.search,
                        icon: const Icon(Icons.search, color: Colors.white),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 24, bottom: 16),
                child: Row(
                  children: [
                    Text("Nuevas publicaciones",
                        style: AppStyle.regularAskan30),
                    if (_books.isEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: IconButton(
                          onPressed: presenter?.loadData,
                          icon: const Icon(
                            Icons.refresh,
                            color: AppColors.darkBlue,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
              if (_isLoading)
                const Center(
                  child: CircularProgressIndicator(color: AppColors.baseColor),
                )
              else
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _books
                        .map((book) => BookCard(book,
                            onTap: () => presenter?.viewDetails(book)))
                        .toList(),
                  ),
                ),
              Container(
                margin: const EdgeInsets.symmetric(vertical: 30),
                alignment: Alignment.center,
                child: ElevatedButton(
                  key: const Key('logoutbtn'),
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      backgroundColor: AppColors.baseColor,
                      fixedSize: const Size(150, 40)),
                  onPressed: presenter?.logout,
                  child: Text(
                    'Cerrar sesión',
                    style: AppStyle.regularAskan17,
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  void onLogout() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => const LoginPage()));
  }

  @override
  void onTapBook(Book book) {
    Navigator.of(context).push(createScaleRoute(DetailsPage(book: book)));
  }

  @override
  void onTapSearch(String search) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (context) => SearchPage(query: search)),
    );
  }

  @override
  void showErrors(List<String> errors) {
    final snackBar = SnackBar(
      content: Text(errors.join('\n')),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
    setState(() {
      _isLoading = false;
    });
  }

  @override
  void showLoggedUser(User user) {
    setState(() {
      _isLoading = false;
      _user = user;
    });
  }

  @override
  void showNewBooks(List<Book> books) {
    setState(() {
      _isLoading = false;
      _books = books;
    });
  }
}
