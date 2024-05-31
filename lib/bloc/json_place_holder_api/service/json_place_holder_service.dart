import 'dart:io';

import 'package:bloc_pattern_learn/bloc/json_place_holder_api/model/json_place_holder_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

abstract class IJsonPlaceHolderService {
  IJsonPlaceHolderService(this.dio);
  final Dio dio;

  Future<List<JsonPlaceHolderModel>?> fetchItemsPostService();
}

enum _PostServicePath { posts }

class JsonPlaceHolderService extends IJsonPlaceHolderService {
  JsonPlaceHolderService(super.dio);

  @override
  Future<List<JsonPlaceHolderModel>?> fetchItemsPostService() async {
    try {
      final response = await dio.get(_PostServicePath.posts.name);
      if (response.statusCode == HttpStatus.ok) {
        final jsonBody = response.data;
        if (jsonBody is List) {
          return jsonBody.map((json) => JsonPlaceHolderModel.fromJson(json)).toList();
        }
      }
    } on DioException catch (exception) {
      _ShowDebug().showDioException(exception, this);
    }
    return null;
  }
}

class _ShowDebug {
  void showDioException<T>(DioException exception, T type) {
    if (kDebugMode) {
      print(exception.message);
      print(type.toString());
      print('----------------------------------------------');
    }
  }
}
