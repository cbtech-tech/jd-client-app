import 'dart:convert';

class ApiResult<T> {
  final T? data;
  final String? error;

  bool get isSuccess => error == null;

  ApiResult._({this.data, this.error});

  factory ApiResult.success(T data) => ApiResult._(data: data);

  factory ApiResult.error(dynamic responseBody) {
    String message;

    try {
      if (responseBody is String) {
        // Try to extract the JSON part if the string contains extra text before JSON
        final jsonStart = responseBody.indexOf('{');
        if (jsonStart != -1) {
          final jsonString = responseBody.substring(jsonStart); // Get the JSON part
          final decoded = jsonDecode(jsonString);
          message = ErrorResponse.fromJson(decoded).message;
        } else {
          message = responseBody; // If no JSON, treat it as a plain error message
        }
      } else if (responseBody is Map<String, dynamic>) {
        // If the response is already a Map, parse it directly
        message = ErrorResponse.fromJson(responseBody).message;
      } else {
        message = "Unexpected error format"; // In case the format is unexpected
      }
    } catch (e) {
      message = "Failed to parse error: ${e.toString()}"; // Error handling
    }

    return ApiResult._(error: message);
  }
}

class ErrorResponse {
  final String message;

  ErrorResponse({required this.message});

  factory ErrorResponse.fromJson(Map<String, dynamic> json) {
    return ErrorResponse(
      message: json['message'] ?? 'Unknown error',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'message': message,
    };
  }

  @override
  String toString() => message; // Return the error message when toString is called
}
