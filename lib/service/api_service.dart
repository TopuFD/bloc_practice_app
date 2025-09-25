import 'dart:convert';
import 'package:block_project/helper/prefs_helper.dart';
import 'package:block_project/service/error_response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ApiResponse<T> {
  final int statusCode;
  final String? message;
  final T? body;

  ApiResponse({required this.statusCode, this.message, this.body});
}

class ApiService {
  static const int timeoutInSeconds = 30;
  
  static const String noInternetMessage = "Can't connect to the internet!";

  //====================== GET ======================
  static Future<ApiResponse<dynamic>> getData(
    {String? uri, 
    Map<String, String>? headers,
  }) async {
    var mainHeaders = {
      'Authorization': 'Bearer ${PrefsHelper.token}',
      'Content-Type': 'application/json',
    };

    try {
      final response = await http
          .get(
            Uri.parse(uri??""),
            headers: headers ?? mainHeaders,
          )
          .timeout(const Duration(seconds: timeoutInSeconds));

      return _handleResponse(response, uri??"");
    } catch (e, s) {
      debugPrint('Error: $e');
      debugPrint('StackTrace: $s');
      return ApiResponse(statusCode: 0, message: noInternetMessage);
    }
  }

  //====================== POST ======================
  static Future<ApiResponse<dynamic>> postData(
    String uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    var mainHeaders = {
      'Authorization': 'Bearer ${PrefsHelper.token}',
      'Content-Type': 'application/json',
    };

    try {
      debugPrint('====> API POST: $uri\nBody: $body');

      final response = await http
          .post(
            Uri.parse(uri),
            headers: headers ?? mainHeaders,
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: timeoutInSeconds));

      return _handleResponse(response, uri);
    } catch (e, s) {
      debugPrint('Error: $e');
      debugPrint('StackTrace: $s');
      return ApiResponse(statusCode: 0, message: noInternetMessage);
    }
  }

  //====================== PUT ======================
  static Future<ApiResponse<dynamic>> putData(
    String uri, {
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    var mainHeaders = {
      'Authorization': 'Bearer ${PrefsHelper.token}',
      'Content-Type': 'application/json',
    };

    try {
      debugPrint('====> API PUT: $uri\nBody: $body');

      final response = await http
          .put(
            Uri.parse(uri),
            headers: headers ?? mainHeaders,
            body: jsonEncode(body),
          )
          .timeout(const Duration(seconds: timeoutInSeconds));

      return _handleResponse(response, uri);
    } catch (e, s) {
      debugPrint('Error: $e');
      debugPrint('StackTrace: $s');
      return ApiResponse(statusCode: 0, message: noInternetMessage);
    }
  }

  //====================== DELETE ======================
  static Future<ApiResponse<dynamic>> deleteData(
    String uri, {
    Map<String, String>? headers,
  }) async {
    var mainHeaders = {
      'Authorization': 'Bearer ${PrefsHelper.token}',
      'Content-Type': 'application/json',
    };

    try {
      debugPrint('====> API DELETE: $uri');

      final response = await http
          .delete(
            Uri.parse(uri),
            headers: headers ?? mainHeaders,
          )
          .timeout(const Duration(seconds: timeoutInSeconds));

      return _handleResponse(response, uri);
    } catch (e, s) {
      debugPrint('Error: $e');
      debugPrint('StackTrace: $s');
      return ApiResponse(statusCode: 0, message: noInternetMessage);
    }
  }

  //====================== HANDLE RESPONSE ======================
  static ApiResponse _handleResponse(http.Response response, String uri) {
    debugPrint("===> StatusCode: ${response.statusCode}");
    debugPrint("===> ResponseBody: ${response.body}");

    dynamic body;
    try {
      body = jsonDecode(response.body);
    } catch (e) {
      debugPrint("JSON decode error: $e");
      body = response.body;
    }

    if (response.statusCode == 200) {
      return ApiResponse(
        statusCode: response.statusCode,
        body: body,
        message: response.reasonPhrase,
      );
    } else {
      if (body is Map && body.containsKey('message')) {
        final errorResponse = ErrorResponse.fromJson(body);
        return ApiResponse(
          statusCode: response.statusCode,
          message: errorResponse.message,
          body: body,
        );
      } else {
        return ApiResponse(
          statusCode: response.statusCode,
          message: response.reasonPhrase ?? "Unknown error",
        );
      }
    }
  }
}