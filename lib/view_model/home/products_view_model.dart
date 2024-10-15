import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shopping_app/configs/api_constants.dart';
import 'package:shopping_app/configs/utils.dart';
import 'package:shopping_app/models/products_category_model.dart';
import 'package:shopping_app/models/shopping_products_model.dart';
import 'package:shopping_app/repository/home_repository.dart/home_repository.dart';

class ProductsViewModel extends ChangeNotifier{
  ShoppingProductsModel? shoppingProductsModel;
  ProductsCategoryModel? productsCategoryModel;

  final HomeRepository _homeRepository = HomeRepository();
  
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  String selectedCategoryItem = '';

  List<String> categoryList = [];

  /* Pagination Properties */
  int _limit = 30;

  bool _isInitialLoading = true;
  bool get isInitialLoading => _isInitialLoading;
  bool _isPaginationLoader = false;
  bool get isPaginationLoader => _isPaginationLoader;
  bool _isPaginationActive = true;
  bool get isPaginationActive => _isPaginationActive;
  bool _isSearchProduct = false;
  bool get isSearchProduct => _isSearchProduct;

  int _totalProductsCount = 0;

  void updateSelectedCategoryList(String item,context) async{
    selectedCategoryItem = item;
    _isPaginationActive = false; 
    String endPointCategorySearch = item.replaceAll(' ', '-').toLowerCase();
    fetchShoppingData(ApiConstants.categoryList + endPointCategorySearch);
    notifyListeners();
  }



  void initializeLoading(){
    _isInitialLoading = true;
    _isPaginationActive = true;
    _isPaginationLoader = false;
    _isSearchProduct = false;
    _limit = 30;
    notifyListeners();
  }
  


  void updatePages(){
    Future.delayed(const Duration(milliseconds: 200));
    if(!_isPaginationLoader && _limit <= _totalProductsCount){
      int remainingCount = _totalProductsCount - _limit;
      if (remainingCount < 30) {
      _limit += remainingCount;
      } else {
        _limit += 30;
      }
      _isInitialLoading = false;
      _isPaginationLoader = true;
      _isPaginationActive = _limit  <= _totalProductsCount;
      _isLoading = false;
      fetchShoppingData(ApiConstants.baseUrl).
      then((value) {
        _isPaginationLoader =false;
        notifyListeners();
      }).
      catchError((e) {
        _isPaginationLoader = false;
        notifyListeners();
      });
      notifyListeners();
    }
    else{
      _isPaginationActive = true;
      notifyListeners();
    }
  }

  void resetPagination(String text) {
    if(text.isNotEmpty){
      _isPaginationActive = false;
      _isPaginationLoader = false;
      _isSearchProduct = true;
      fetchShoppingData(ApiConstants.searchProduct + text);
      notifyListeners();
    }else{
      _limit = 30;
      _isPaginationActive = true;
      _isPaginationLoader = false;
      _isSearchProduct = false;
      _isLoading = true;
      fetchShoppingData(ApiConstants.baseUrl);
      notifyListeners();
    }
  }

  void onChangedFilter(String text){
    if(text.isEmpty){
      _isPaginationActive = true;
      notifyListeners();
    }
  }

  Future fetchShoppingData(String url) async {
     _isLoading = !_isPaginationLoader;
     String apiUrl = '';
     switch (_isSearchProduct){
      case true:
        apiUrl = url;
      case false:
        if(_isPaginationActive){
          apiUrl = '$url?limit=$_limit';
        }else{
          apiUrl = url;
        }
     }
     try{
      final response = await _homeRepository.getShoppingProductsData(apiUrl);
      if (response.products != null) {
       shoppingProductsModel = response;
       _totalProductsCount = response.total ?? 0;
       _isLoading = false;
       _isPaginationLoader = false;
       notifyListeners();
      } 
     } catch(e){
      _isLoading = false;
       _isPaginationLoader = false;
       Utils.showToast(message: 'Something error occurred',gravity: ToastGravity.BOTTOM,);
     } finally {
      _isLoading = false;
       _isPaginationLoader = false;
      notifyListeners(); 
    }
    notifyListeners();
  }

  Future fetchCategoryList(String url) async {
     _isLoading = true;
     notifyListeners();
     try{
      final response = await _homeRepository.fetchCategoryList(url);
      if (response.productsList.isNotEmpty) {
        productsCategoryModel = response;
        categoryList = response.productsList.map((e) => e?.name ?? '').toList();
        _isLoading = false;
        notifyListeners();
      } 
     }catch(e){
        _isLoading = false;
        debugPrint(e.toString());
     }
    notifyListeners();
  }
 

}