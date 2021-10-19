
import 'package:dio/dio.dart';
import 'package:shop/utils/end_points.dart';


class DioHelper {
  static  Dio dio;

  static void init() {
    dio = Dio(
      BaseOptions(
        baseUrl: BASE_URL,
        headers: {
          'Content-Type':'application/json',
        },
      ),
    );
  }

  static Future<Response> postData({
     Map<String, dynamic> data,
     String url,
    String token,
  }) {
    return dio.post(
      url,
      data: data,
      options: Options(
        headers: {
          'Authorization':token??'',
        },
      ),
    );
  }

  static Future<Response> getData({
     String url,
    String token,
    Map<String, dynamic> query,
  }) {
    return dio.get(
      url,
      options: Options(
        headers: {
          'Authorization':token??'',
        },
      ),
      queryParameters: query,
    );
  }

}