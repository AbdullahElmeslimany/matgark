import 'package:dio/dio.dart';
import 'package:ecommerce_app/shared/network/network/constant/link_network.dart';

class DioHelper {
  static late Dio dio;

  static init() {
    dio = Dio(BaseOptions(
      baseUrl: Link.baseUrl,
      receiveDataWhenStatusError: true,
    ));
  }

  static login() {
    dio.post(Link.login, data: {});
  }

  static Future<Response> getData(
      {required String path,
      Map<String, dynamic>? query,
      String token = ''}) async {
    dio.options.headers = {
      'lang': "en",
      'Authorization': token,
      'Content-Type': 'application/json'
    };

    return await dio.get(path, queryParameters: query ?? null);
  }

  static Future<Response> postData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query,
      String token = ''}) async {
    dio.options.headers = {
      'lang': "en",
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    return await dio.post(url, data: data, queryParameters: query);
  }

  static Future<Response> putData(
      {required String url,
      required Map<String, dynamic> data,
      Map<String, dynamic>? query,
      String token = ''}) async {
    dio.options.headers = {
      'lang': "en",
      'Authorization': token,
      'Content-Type': 'application/json'
    };
    return await dio.put(url, data: data, queryParameters: query);
  }
}
