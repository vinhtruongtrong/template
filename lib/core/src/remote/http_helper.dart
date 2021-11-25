/*
 * @Author: vinhtruongtrong 
 * @Date: 2021-11-22 11:29:56 
 * @Last Modified by: vinhtruongtrong
 * @Last Modified time: 2021-11-24 10:48:20
 */
import 'dart:convert';

import 'package:dio/adapter.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:template/core/src/foundation/foundation.dart';
import 'package:user_agent/user_agent_helper.dart';
import '../foundation/src/constants.dart';

class HttpHelper with DioMixin implements Dio {
  HttpHelper._({BaseOptions? options}) {
    this.options = options ?? defaultOptions;
    interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final userAgent = await UserAgentHelper.load();
          options.headers.addAll(userAgent.toJson());
          handler.next(options);
        },
      ),
    );

    interceptors.add(DefaultInterceptor(verbose: !kDebugMode));

    httpClientAdapter = DefaultHttpClientAdapter();
  }

  static Dio getInstance({BaseOptions? options}) =>
      HttpHelper._(options: options);

  static final defaultOptions = BaseOptions(
    baseUrl: Constants.of().endpoint,
    contentType: 'application/json',
    connectTimeout: 30000,
    sendTimeout: 30000,
    receiveTimeout: 30000,
  );
}

class DefaultInterceptor extends Interceptor {
  final tag = (DefaultInterceptor).toString();
  bool verbose;
  DefaultInterceptor({this.verbose = false});
  String _getPrettyJSONString(jsonObject) {
    try {
      var encoder = const JsonEncoder.withIndent('     ');
      return encoder.convert(jsonObject);
    } on Exception catch (err) {
      Logger.log(err.toString());
      return jsonObject.toString();
    }
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    Logger.log(
      'REQUEST_METHOD: [${options.method}] => END_POINT: ${options.baseUrl + options.path}',
      tag: tag,
    );
    if (verbose) {
      Logger.log(
        'REQUEST_HEADER: ${_getPrettyJSONString(options.headers)}',
        tag: tag,
      );
      if (options.method != 'GET') {
        if (options.contentType == Headers.jsonContentType) {
          Logger.log('REQUEST_PARAMS: ${_getPrettyJSONString(options.data)}');
        } else {
          Logger.log('REQUEST_PARAMS: ${options.data}');
        }
      }
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    Logger.log(
      '[${response.statusCode}][${response.statusMessage}] => END_POINT: ${response.requestOptions.baseUrl + response.requestOptions.path}',
      tag: tag,
    );
    if (verbose) {
      if (response.requestOptions.responseType == ResponseType.json) {
        Logger.log(
          'RESPONSE_DATA: ${_getPrettyJSONString(response.data)}',
          tag: tag,
        );
      } else {
        Logger.log('RESPONSE_DATA: ${response.data}', tag: tag);
      }
    }
    return super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    Logger.log(
      'ERROR_CODE: [${err.response?.statusCode}] => END_POINT: ${err.requestOptions.baseUrl + err.requestOptions.path}',
      tag: tag,
    );
    throw err;
  }
}
