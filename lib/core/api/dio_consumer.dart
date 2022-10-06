import 'dart:convert';
import 'dart:io';

import 'package:clean_artiticture_learning/core/api/api_consumer.dart';
import 'package:clean_artiticture_learning/core/api/end_points.dart';
import 'package:clean_artiticture_learning/core/api/interceptors.dart';
import 'package:clean_artiticture_learning/core/api/status_code.dart';
import 'package:clean_artiticture_learning/core/execptions/execptions.dart';
import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:clean_artiticture_learning/features/random_quote/injection.dart'
    as inj;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DioConsumer implements ApiConsumer {
  final Dio client;

  DioConsumer({required this.client}) {
    (client.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
        (HttpClient client) {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
      return client;
    };
    client.options
      ..baseUrl = EndPoints.baseUrl
      ..responseType = ResponseType.plain
      ..followRedirects = false
      ..validateStatus = (status) {
        // if status code =or greater than 500 =>  there will be problem in the connection at first and the request didnt make its mission to get response ////
        return status! < StatusCode.internetServerError;
      };
    client.interceptors.add(inj.sl<AppInterceptors>());
    if (kDebugMode) {
      client.interceptors.add(inj.sl<LogInterceptor>());
    }
  }
  @override
  Future get(String path, {Map<String, dynamic>? queryParameters}) async {
    try {
      final response = await client.get(
        path,
        queryParameters: queryParameters,
      );
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleError(error);
    }
  }

  @override
  Future post(String path,
      {Map<String, dynamic>? queryParameters,
      bool formDataEnabled = false,
      Map<String, dynamic>? body}) async {
    try {
      final response = await client.post(path,
          queryParameters: queryParameters,
          data: formDataEnabled ? FormData.fromMap(body!) : body);
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleError(error);
    }
  }

  @override
  Future put(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? body}) async {
    try {
      final response =
          await client.post(path, queryParameters: queryParameters, data: body);
      return jsonDecode(response.data.toString());
    } on DioError catch (error) {
      _handleError(error);
    }
  }

  dynamic _handleError(DioError dioError) {
    switch (dioError.type) {
      case DioErrorType.connectTimeout:
      case DioErrorType.sendTimeout:
      case DioErrorType.receiveTimeout:
        throw const FetchDataException();

      case DioErrorType.response:
        switch (dioError.response?.statusCode) {
          case StatusCode.badRequest:
            throw const BadRequestException();
          case StatusCode.unautherized:
          case StatusCode.forbidden:
            throw const BadRequestException();
          case StatusCode.notFound:
            throw const NotFoundException();
          case StatusCode.conflict:
            throw const ConflictException();
          case StatusCode.internetServerError:
            throw InternalServerException();
        }
        break;
      case DioErrorType.cancel:
        break;
      case DioErrorType.other:
        throw NoInternetConnectionException();
    }
  }
}
