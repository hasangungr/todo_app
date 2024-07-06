import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/core/extensions/string_extension.dart';
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
        await instance._dio.get("${instance._baseUrl}${path.pathJson}");

    if (response.data != null) {
      Map data = response.data;

      List<T> bisey =
          data.values.map<T>((e) => model.fromJson(e)).toList();

      return bisey;
    } else {
      debugPrint("Request failed with status: ${response.statusCode}");
      return null;
    }
  }

  Future<bool> postDio(String path, BaseModel model) async {
    Response response = await instance._dio.post<T>(
      "${instance._baseUrl}${path.pathJson}",
      data: model.toJson,
    );

    if (response.data != null) {
      return true;
    } else {
      return false;
    }
  }
}
