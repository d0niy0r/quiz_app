import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import 'package:quiz_app/core/network/status_model.dart';

import '../services/secure_storage.dart';



class ApiClient {
  var logger = Logger(
    filter: null, // Use the default LogFilter (-> only log in debug mode)
    printer: PrettyPrinter(), // Use the PrettyPrinter to format and print log
    output: null, // Use the default LogOutput (-> send everything to console)
  );
  final baseUrl = "https://elektr.pythonanywhere.com/common/";
  Dio dio = Dio();
  static Future<Map<String, dynamic>> defaultHeader() async {
    String token = await SecureStorage().read(key: 'token') ?? "";
    return {
      'Authorization': 'Bearer $token',
      'Accept': 'application/json, text/plain',
  };
}

  Future<StatusModel> postMethod({required String pathUrl,required Map<String, dynamic> body, dynamic header, required isHeader})async {
    try {
      final res = await dio.post("$baseUrl$pathUrl",
        options: Options(headers:isHeader?  await defaultHeader() : {"Content_type" : "application/json"},),
        data: jsonEncode(body),
      ).timeout(const Duration(seconds: 30));
      logger.i(
        "postMethod pathUrl: $baseUrl$pathUrl"
            "\n\n"
            "header: ${await defaultHeader()}"
            "\n\n"
            "body: $body"
            "\n\n"
            "code: ${res.statusCode}",
      );
      log("response: ${res.data}");
      if(res.statusCode! >= 200 && res.statusCode! < 300){
        return StatusModel(response: res.data, isSuccess: true, code: res.statusCode);
      }
      return StatusModel(response: res.data.toString(), isSuccess: false, code: res.statusCode);
    } on DioError catch(e ) {
      logger.e(
          "postMethod pathUrl: $baseUrl$pathUrl"
              "\n\n"
              "header: ${await defaultHeader()}"
              "\n\n"
              "body: $body"
              "\n\n"
              "code: ${e.response?.statusCode}"
              "\n\n"
              "response: ${e.response?.data}",
      );
      return dioError(e);
    }
  }

  Future<StatusModel> getMethod({required pathUrl, Map<String, dynamic>? header,Map<String, dynamic>?  body, required isHeader})async {
    try {
      final res = await dio
          .get("$baseUrl$pathUrl",
        options: Options(headers:isHeader?  await defaultHeader() : {"Content_type" : "application/json"}),
        data: jsonEncode(body ?? {}),
      ).timeout(const Duration(seconds: 30));
      logger.i(
        "getMethod pathUrl: $baseUrl$pathUrl"
            "\n\n"
            "header: ${await defaultHeader()}"
            "\n\n"
            "body: $body"
            "\n\n"
            "code: ${res.statusCode}"
            "\n\n"
      );
      log("response: ${res.data}");
      if(res.statusCode! >= 200 && res.statusCode! < 300){
        return StatusModel(response: res.data, isSuccess: true, code: res.statusCode);
      }
      return StatusModel(response: res.data.toString(), isSuccess: false, code: res.statusCode);
    } on DioError catch(e) {
      logger.e(
          "getMethod pathUrl: $baseUrl$pathUrl"
              "\n\n"
              "header: ${await defaultHeader()}"
              "\n\n"
              "body: $body"
              "\n\n"
              "code: ${e.response?.statusCode}"
              "\n\n"
              "response: ${e.response?.data}",
      );
      return dioError(e);
    }
  }

  Future<StatusModel> putMethod({required pathUrl,required dynamic body, dynamic header, required isHeader})async {
    try {
      final res = await dio.put("$baseUrl$pathUrl",
        options: Options(headers: isHeader ? await defaultHeader() : {"Content_type": "application/json"}),
        data: jsonEncode(body),
      ).timeout(const Duration(seconds: 30));
      logger.i(
        "putMethod pathUrl: $baseUrl$pathUrl"
            "\n\n"
            "header: ${await defaultHeader()}"
            "\n\n"
            "body: $body"
            "\n\n"
            "code: ${res.statusCode}"
            "\n\n"
      );
      log("response: ${res.data}");
      if (res.statusCode == 200) {
        return StatusModel(response: res.data, isSuccess: true, code: 200);
      }
      return StatusModel(response: res.data.toString(),
          isSuccess: false,
          code: res.statusCode);
    } on DioError catch (e) {
      logger.e(
        "putMethod pathUrl: $baseUrl$pathUrl"
            "\n\n"
            "header: ${await defaultHeader()}"
            "\n\n"
            "body: $body"
            "\n\n"
            "code: ${e.response?.statusCode}"
            "\n\n"
            "response: ${e.response?.data}",
      );
      return dioError(e);
    }
  }

  Future<StatusModel> patchMethod({required String pathUrl,required Map<String, dynamic> body, dynamic header, required isHeader})async {
    try {
      final res = await dio.patch("$baseUrl$pathUrl",
        options: Options(headers:isHeader?  await defaultHeader() : {"Content_type" : "application/json"},),
        data: jsonEncode(body),
      ).timeout(const Duration(seconds: 30));
      logger.i(
        "patchMethod pathUrl: $baseUrl$pathUrl"
            "\n\n"
            "header: ${await defaultHeader()}"
            "\n\n"
            "body: $body"
            "\n\n"
            "code: ${res.statusCode}"
            "\n\n"
      );
      log("response: ${res.data}");
      if(res.statusCode! >= 200 && res.statusCode! < 300){
        return StatusModel(response: res.data, isSuccess: true, code: res.statusCode);
      }
      return StatusModel(response: res.data.toString(), isSuccess: false, code: res.statusCode);
    } on DioError catch(e ) {
      logger.e(
        "postMethod pathUrl: $baseUrl$pathUrl"
            "\n\n"
            "header: ${await defaultHeader()}"
            "\n\n"
            "body: $body"
            "\n\n"
            "code: ${e.response?.statusCode}"
            "\n\n"
            "response: ${e.response?.data}",
      );
      return dioError(e);
    }
  }

  Future<StatusModel> deleteMethod({required String pathUrl, dynamic header, required isHeader, Map<String, dynamic>? body})async {
    try {
      final res = await dio.delete("$baseUrl$pathUrl",
        options: Options(headers:isHeader?  await defaultHeader() : {"Content_type" : "application/json"}),
        data: jsonEncode(body ?? {})
      ).timeout(const Duration(seconds: 30));
      logger.i(
        "deleteMethod pathUrl: $baseUrl$pathUrl"
            "\n\n"
            "header: ${await defaultHeader()}"
            "\n\n"
            "body: $body"
            "\n\n"
            "code: ${res.statusCode}"
            "\n\n"
      );
      log("response: ${res.data}");
      if(res.statusCode == 200){
        return StatusModel(response: res.data, isSuccess: true, code: 200);
      }
      return StatusModel(response: "unknownError", isSuccess: false, code: res.statusCode);
    } on DioError catch(e) {
      logger.e(
        "deleteMethod pathUrl: $baseUrl$pathUrl"
            "\n\n"
            "header: ${await defaultHeader()}"
            "\n\n"
            "body: $body"
            "\n\n"
            "code: ${e.response?.statusCode}"
            "\n\n"
            "response: ${e.response?.data}",
      );
      return dioError(e);
    }
  }
}

StatusModel dioError(DioException e){
  if(e.type == DioExceptionType.connectionTimeout){
    return StatusModel(response: ("connection_error"), isSuccess: false, code: e.response?.statusCode);
  }
  if(e.type == DioExceptionType.connectionError){
    return StatusModel(response: ("connection_error"), isSuccess: false, code: e.response?.statusCode);
  }
try{
  if(e.response!.statusCode! >= 500){
    return StatusModel(response: ("server_error"), isSuccess: false, code: e.response?.statusCode);
  }
  if(e.response!.statusCode! == 401){
    return StatusModel(response: ("token_error"), isSuccess: false, code: e.response?.statusCode);
  }
  if(e.response!.statusCode! == 403){
    return StatusModel(response: ("permission_error"), isSuccess: false, code: e.response?.statusCode);
  }
}catch(e){}
  return StatusModel(response: e.response.toString(), isSuccess: false, code: e.response?.statusCode);
}