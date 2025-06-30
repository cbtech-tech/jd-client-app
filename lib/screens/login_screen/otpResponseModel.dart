class OtpResponseModel {
  final bool? success;
  final String? message;
  final bool? newUser;

  OtpResponseModel({
    this.success,
    this.message,
    this.newUser,
  });

  factory OtpResponseModel.fromJson(Map<String, dynamic> json) {
    return OtpResponseModel(
      success: json['success'] as bool?,
      message: json['message'] as String?,
      newUser: json['newUser'] as bool?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'newUser': newUser,
    };
  }
}
