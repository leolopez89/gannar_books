import 'package:gannar_books/presentation/details/details_contract.dart';
import 'package:gannar_books/presentation/details/details_provider.dart';
import 'package:gannar_books/utils/services/connectivity.dart';

class DetailsPresenter {
  final DetailsProvider provider;

  final DetailsContract view;

  DetailsPresenter({required this.provider, required this.view});

  Future<void> goBack() async {
    view.onTapBack();
  }

  Future<void> loadData() async {
    if (!await checkConnection()) return;

    await provider.loadData();
    if (provider.error.isEmpty) {
      view.showBookDetails(provider.book);
    } else {
      view.showError(provider.error);
    }
  }

  Future<bool> checkConnection() async {
    bool result = await hasConnection();
    if (!result) view.showError("No hay conexión. Intente más tarde");
    return result;
  }
}
