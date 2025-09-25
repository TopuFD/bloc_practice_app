class ErrorResponse {
  final String? status;
  final int? statusCode;
  final String? message;

  ErrorResponse({
    this.status,
    this.statusCode,
    this.message,
  });

  factory ErrorResponse.fromJson(Map<dynamic, dynamic> json) {
    final map = Map<String, dynamic>.from(json);
    return ErrorResponse(
      status: map["status"]?.toString(),
      statusCode: map["statusCode"] is int
          ? map["statusCode"]
          : int.tryParse(map["statusCode"]?.toString() ?? ""),
      message: map["message"]?.toString(),
    );
  }
}
