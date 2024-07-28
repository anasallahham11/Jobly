import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:html';

class DioHelper
{
  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://192.168.1.105:8000/api/',
        receiveDataWhenStatusError: true,
      ),
    );
  }

  static Future<Response?> getData({
    required String url,
    Map<String,dynamic>? query,
    Map<String,dynamic>? data,
    String lang = 'en',
    String? token,
  })async
  {
    dio.options.headers={
      'content_type':'application/json',
      'lang':lang,
      'Authorization': 'Bearer $token',
    };
    return await dio.get(
      url,
      queryParameters:query,
      data: data,
    );
  }

  static Future<Response?> postData({
    required String url,
    Map<String,dynamic>? query,
    Map<String,dynamic>? data,
    String lang = 'en',
    String? token,
  }) async {
    dio.options.headers={
      'content_type':'application/json',
      'lang':lang,
      'Authorization': 'Bearer $token',
    };

    return dio.post(
      url,
      queryParameters: query,
      data: data,
    );
  }



 static Future<Response?> uploadVideo({
    required String filePath,
    required String token,
    required String endpoint,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var data = FormData.fromMap({
      'video': [
        await MultipartFile.fromFile(filePath, filename: filePath.split('/').last)
      ],
    });
      return dio.post(
        endpoint,
        data: data,
      );


  }



 static Future<Response?> uploadCV({
    required String filePath,
    required String token,
    required String endpoint,
  }) async {
    dio.options.headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };
    var data = FormData.fromMap({
      'cv': [
        await MultipartFile.fromFile(filePath, filename: filePath.split('/').last)
      ],
    });
      return dio.post(
        endpoint,
        data: data,
      );


  }










}