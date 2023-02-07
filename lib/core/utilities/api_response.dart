class ApiResponse {
  List get data => body["data"];

  bool get allGood => errors == 0;

  bool hasError() => errors != 0;

  bool hasData() => data != null;
  String? message;

  int? statusCode;

  dynamic body;
  int? errors;

  ApiResponse({
    this.message,
    this.body,
    this.errors,
  });

  factory ApiResponse.fromResponse(dynamic response) {
    dynamic body = response['data'] ?? [];
    String message = response['message'];
    int error = response['error'];

    return ApiResponse(
      message: message,
      body: body,
      errors: error,
    );
  }
}
