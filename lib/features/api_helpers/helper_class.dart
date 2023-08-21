


import 'dart:developer';

import 'package:dio/dio.dart';

class ApiUrl{
  final String baseUrl="https://long-blue-eagle-fez.cyclic.app";

  Dio dio = Dio();

  Future<Response>post(body,String endpoint){
    log(body.toString());
    return dio.post('$baseUrl$endpoint',data:body);
  }

  get(apiUrl){}

}
// class CallApi {
//   final String baseUrl = "https://long-blue-eagle-fez.cyclic.app";
//   Dio dio = Dio();
//
//   Future<Response> post(body, String endpoint) {
//     log(body.toString());
//
//     return dio.post('$baseUrl$endpoint', data: body);
//
//   }
//
//   get(apiUrl) {}
// }