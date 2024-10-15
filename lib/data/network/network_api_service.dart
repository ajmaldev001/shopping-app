import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shopping_app/data/exceptions/app_exceptions.dart';
import 'package:shopping_app/data/network/base_api_services.dart';

class NetworkApiService extends BaseApiServices{
 
 dynamic responseJson;
 @override
  Future<dynamic> fetchApiData(String url) async {
   try{
     final response = await http.get(Uri.parse(url));
     debugPrint('response.body.toString() ${response.body.toString()}');
     return responseJson = returnResponse(response);
   }catch(e){
     debugPrint('exception: $e');
   }
  }


  dynamic returnResponse(http.Response response) {
    switch (response.statusCode) {
      case 200:
        return jsonDecode(response.body);
      case 400:
        throw BadRequestException(response.toString());
      case 401:
      case 403:
        throw UnauthorizedException(response.body.toString());
      case 404:
        throw UnauthorizedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException(
            'Error occurred while communication with server with status code : ${response.statusCode}');
    }
  }
  
  }