class VerifyOtpResponse {
  final bool success;
  final String message;
  final bool? newUser;
  final String? token;
  final User? user;

  VerifyOtpResponse({
    required this.success,
    required this.message,
    this.newUser,
    this.token,
    this.user,
  });

  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) {
    return VerifyOtpResponse(
      success: json['success'] ?? false,
      message: json['message'] ?? '',
      newUser: json['newUser'],
      token: json['token'],
      user: json['user'] != null ? User.fromJson(json['user']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'message': message,
      'newUser': newUser,
      'token': token,
      'user': user?.toJson(),
    };
  }
}

class User {
  final String? id;
  final String? mobileNumber;
  final String? role;
  final bool? isActive;
  final String? onboardingStatus;
  final String? createdAt;
  final String? updatedAt;
  final String? lastLogin;

  User({
    this.id,
    this.mobileNumber,
    this.role,
    this.isActive,
    this.onboardingStatus,
    this.createdAt,
    this.updatedAt,
    this.lastLogin,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      mobileNumber: json['mobileNumber'],
      role: json['role'],
      isActive: json['isActive'],
      onboardingStatus: json['onboardingStatus'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      lastLogin: json['lastLogin'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'mobileNumber': mobileNumber,
      'role': role,
      'isActive': isActive,
      'onboardingStatus': onboardingStatus,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'lastLogin': lastLogin,
    };
  }
}
