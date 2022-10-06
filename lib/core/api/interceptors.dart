import 'package:clean_artiticture_learning/core/utiles/strings/app_strings.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AppInterceptors extends Interceptor{




  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    // TODO: implement onRequest
    options.headers['Content_type']='application/json';
    debugPrint('REQUEST[${options.method}] => PATH: ${options.path}');
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint('RESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.path}');
    // TODO: implement onResponse
    super.onResponse(response, handler);
  }


  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    debugPrint('ERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.path}');
    // TODO: implement onError
    super.onError(err, handler);
  }















}