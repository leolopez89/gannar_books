import 'package:gannar_books/presentation/details/details_contract.dart';
import 'package:gannar_books/presentation/details/details_provider.dart';

class DetailsPresenter {
  final DetailsProvider provider;

  final DetailsContract view;

  DetailsPresenter({required this.provider, required this.view});

  Future<void> goBack() async {
    view.onTapBack();
  }

  Future<void> loadData() async {
    await provider.loadData();
    if (provider.error.isEmpty) {
      view.showBookDetails(provider.book);
    } else {
      view.showError(provider.error);
    }
  }
}
