import 'dart:io';
import 'package:shopping_app/data/exceptions/app_exceptions.dart';
import 'package:shopping_app/data/network/network_api_service.dart';
import 'package:shopping_app/di/get_it.dart';
import 'package:shopping_app/models/products_category_model.dart';
import 'package:shopping_app/models/shopping_products_model.dart';


class HomeRepository {
  Future<ShoppingProductsModel> getShoppingProductsData(String apiUrl) async {
    try {
      final response = await getItInstance<NetworkApiService>().fetchApiData(apiUrl);
      return ShoppingProductsModel.fromJson(response ?? {});
    } on SocketException {
      throw InternetException('No Internet Connection');
    } on WebSocketException{
       throw InternetException('No Internet Connection');
    }
  }

  Future<ProductsCategoryModel> fetchCategoryList(String apiUrl) async {
    try {
      final response = await getItInstance<NetworkApiService>().fetchApiData(apiUrl);
      return ProductsCategoryModel.fromJson(response ?? {});
    } on SocketException {
      throw InternetException('No Internet Connection');
    } on WebSocketException{
       throw InternetException('No Internet Connection');
    }
  }
}

