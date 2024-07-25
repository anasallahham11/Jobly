import 'package:dio/dio.dart';
import 'dart:convert';
import 'dart:html';

class DioHelper
{
  static late Dio dio;
  static init(){
    dio = Dio(
      BaseOptions(
        baseUrl: 'http://127.0.0.1:8000/api/',
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



 static Future<void> uploadVideo({
    required String filePath,
    required String token,
    required String endpoint,
  }) async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    var data = FormData.fromMap({
      'files': [
        await MultipartFile.fromFile(filePath, filename: filePath.split('/').last)
      ],
    });

    dio.options.headers = headers;

    try {
      var response = await dio.post(
        endpoint,
        data: data,
      );

      if (response.statusCode == 200) {
        print(json.encode(response.data));
      } else {
        print(response.statusMessage);
      }
    } catch (e) {
      print('Error: $e');
    }
  }









}