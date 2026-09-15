import 'package:flutter/foundation.dart';
import 'package:more_devs_do_zero/features/home/models/product_model.dart';
import 'package:more_devs_do_zero/shared/mocks.dart';

enum ProductsByCategoryViewState { loading, success, error }

class ProductsByCategoryController extends ChangeNotifier {
  List<Product> _categoryProducts = [];

  String _query = '';

  String? _selectedBrand;

  ProductsByCategoryViewState state = ProductsByCategoryViewState.loading;

  //marca selecionada no dropdown de filtro (null = todas as marcas)
  String? get selectedBrand => _selectedBrand;

  //lista de marcas únicas dos produtos da categoria, em ordem alfabética
  List<String> get brands {
    final brands = _categoryProducts.map((product) => product.brand).toSet().toList();
    brands.sort();
    return brands;
  }

  //produtos da categoria já filtrados pelo texto da busca e pela marca
  List<Product> get products {
    return _categoryProducts.where((product) {
      final matchesBrand =
          _selectedBrand == null || product.brand == _selectedBrand;

      if (!matchesBrand) return false;

      if (_query.isEmpty) return true;

      final query = _query.toLowerCase();
      return product.name.toLowerCase().contains(query) ||
          product.brand.toLowerCase().contains(query);
    }).toList();
  }

  void changeState(ProductsByCategoryViewState newState) {
    state = newState;
    notifyListeners();
  }

  void search(String query) {
    _query = query;
    notifyListeners();
  }

  void selectBrand(String? brand) {
    _selectedBrand = brand;
    notifyListeners();
  }

  Future<void> getProductsByCategory(String category) async {
    changeState(ProductsByCategoryViewState.loading);
    //limpa o filtro de marca ao carregar uma nova categoria
    _selectedBrand = null;
    //simula o delay da API
    await Future.delayed(Duration(seconds: 3));
    try {
      _categoryProducts = productsJson
          .map((item) => Product.fromJson(item))
          .where((product) => product.category == category)
          .toList();

      changeState(ProductsByCategoryViewState.success);
    } catch (e) {
      //caso der erro na deserialização, emite o erro para a tela tratar
      changeState(ProductsByCategoryViewState.error);
    }
  }
}