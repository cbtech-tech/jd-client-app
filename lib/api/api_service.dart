import 'dart:convert';
import 'dart:developer';
import 'package:get/get.dart';
import '../constants/api_constants.dart';
import '../utils/pref_utils.dart';
import 'api_result.dart';
import 'package:http/http.dart' as http;
import 'dart:io'; // <-- For File


class ApiService extends GetConnect {
  @override
  void onInit() {
    httpClient.baseUrl = ApiConstants().baseUrl;
    httpClient.timeout = const Duration(seconds: 15);
    httpClient.defaultContentType = 'application/json';

    // 🔐 Request Interceptor
    httpClient.addRequestModifier<void>((request) async {
      final token = await _getToken(); // get token from storage
   // final token = "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiI2ODU1ODIxYjJkZmUxNjBjZjBkZWZmMjciLCJpYXQiOjE3NTA0NDIyMTQsImV4cCI6MTc1MDUyODYxNH0.QGTHqdgRODaCrjV3Ig4u4_K-ZRX6J5S0GoVg3Uyj2hg";
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }
      log('request.header-> ➡️${request.headers['Authorization']}');

      log('method and url -> ➡️ ${request.method} ${request.url}');
      return request;
    });

    // 📥 Response Interceptor
    httpClient.addResponseModifier((request, response) {
      log('status code->⬅️ ${response.statusCode} for ${response.body}');
      return response;
    });
  }

  Future<String?> _getToken() async {
    final prefUtils = PrefUtils();
    return prefUtils.getToken();
  }

  /// 🔹 Generic GET
  Future<ApiResult> getRequest(String endpoint, {Map<String, dynamic>? query}) async {
    try {
      final response = await get(endpoint, query: query);
      return _handleResponse(response);
    } catch (e) {
      return ApiResult.error("GET error: $e");
    }
  }

  /// 🔹 Generic POST
  Future<ApiResult> postRequest(String endpoint, dynamic body) async {
    try {
      final response = await post(endpoint, body);

      return _handleResponse(response);
    } catch (e) {
      return ApiResult.error("POST error: $e");
    }
  }

  /// 🔹 Generic PUT
  Future<ApiResult> putRequest(String endpoint, dynamic body) async {
    try {
      final response = await put(endpoint, body);
      return _handleResponse(response);
    } catch (e) {
      return ApiResult.error("PUT error: $e");
    }
  }

  /// 🔹 Generic DELETE
  Future<ApiResult> deleteRequest(String endpoint) async {
    try {
      final response = await delete(endpoint);
      return _handleResponse(response);
    } catch (e) {
      return ApiResult.error("DELETE error: $e");
    }
  }
  Future<ApiResult> postMultipart(String endpoint, Map<String, String> fields, Map<String, File> files) async {
    try {
      var uri = Uri.parse('${httpClient.baseUrl}$endpoint');

      var request = http.MultipartRequest('POST', uri);

      request.fields.addAll(fields);

      // Add files to request
      files.forEach((key, file) async {
        request.files.add(await http.MultipartFile.fromPath(key, file.path));
      });

      // Add headers with token
      final token = await _getToken();
      if (token != null) {
        request.headers['Authorization'] = 'Bearer $token';
      }

      var streamedResponse = await request.send();
      var response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return ApiResult.success(data);
      } else {
        return ApiResult.error('Error: ${response.statusCode} ${response.reasonPhrase}');
      }
    } catch (e) {
      return ApiResult.error('Multipart POST error: $e');
    }
  }

  /// 🔹 Unified response handler
  ApiResult _handleResponse(Response response) {
    if (response.isOk) {
      
      return ApiResult.success(response.body);
    } else {
      final message = _getErrorMessage(response);
      // Get.snackbar("Error", message);
      return ApiResult.error(message);
    }
  }

  String _getErrorMessage(Response res) {
    switch (res.statusCode) {
      case 400:
        return "Bad request: ${res.bodyString}";
      case 401:
        return "Unauthorized access";
      case 403:
        return "Forbidden";
      case 404:
        return "Resource not found";
      case 500:
        return "Internal server error";
      default:
        return "Unexpected error: ${res.statusCode}";
    }
  }
}
