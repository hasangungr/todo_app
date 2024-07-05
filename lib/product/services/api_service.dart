import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/product/model/base_model.dart';
 
class ApiService<T> {
  ApiService._init(this._dio, this._baseUrl);

  static final ApiService _instance = ApiService._init(
      Dio(), "https://todoapp-31e73-default-rtdb.firebaseio.com/");

  late final String _baseUrl;
  late final Dio _dio;
  static ApiService get instance => _instance;

  Future<List<T>?> getDio(String path, BaseModel model) async {
    Response response =
        await instance._dio.get("${instance._baseUrl}$path.json");

    if (response.statusCode == 200) {
      List data = response.data;

      List<T> bisey = data.map<T>((e) => model.fromJson(e)).toList();

      return bisey;
    } else {
      debugPrint("Request failed with status: ${response.statusCode}");
      return null;
    }
  }
}
