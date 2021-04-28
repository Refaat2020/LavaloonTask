import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:lavaloon/common/env_api.dart';
import 'package:lavaloon/common/get_token.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

///for restful api calls
class UtilitiesService {
  String _apiEndPoint = getEnvAPI();


  Future<http.Response> getWithParams(
      String api, Map<String, dynamic> params) async {
    String username = await getToken("api_token");
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:api_token'));
    String reqUrl = _apiEndPoint + api + "?";
    params.forEach((key, val) {
      if (val != null) {
        reqUrl += key + "=" + val + '&';
      }
    });
    http.Response response;
    print(reqUrl);

      response = await http.get(
        reqUrl,
        headers: {
          HttpHeaders.authorizationHeader: basicAuth
        }
      );

    print('the request url');
    print(reqUrl);
    print(response.body);
    return response;
  }


  Future<Response> dioGetRequest(String api, dynamic params,String username, String password ) async {
    Dio dio =  Dio();
    dio.options.baseUrl = getEnvAPI();
    String basicAuth =
        'Basic ' + base64Encode(utf8.encode('$username:$password'));
    print(basicAuth);
    dio.interceptors.add(PrettyDioLogger());

    dio.options.headers = {
      HttpHeaders.authorizationHeader: basicAuth
    };

    try {
      final response = await dio.get(api, queryParameters: params);
      return response;
    } on DioError catch (e) {
      if (e.response != null) {
        print("e.response != null");
        print(e.response.statusCode);

        return e.response;
      } else {
        print("e = null");
        print(e.request);
        print(e.message);
      }
    }
  }


}