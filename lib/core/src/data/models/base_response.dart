class BaseResponse<T> {
  _Status status;
  T? data;

  BaseResponse({
    required this.status,
    this.data,
  });

  factory BaseResponse.empty() {
    return BaseResponse<T>(
      status: _Status(),
    );
  }

  factory BaseResponse.fromJson({
    required Map<String, dynamic> json,
    Function(Map<String, dynamic>)? deserialize,
  }) {
    return BaseResponse<T>(
      status: _Status.fromJson(json['status']),
      data: (json['data'] != null && deserialize != null)
          ? deserialize(json['data'])
          : null,
    );
  }

  factory BaseResponse.fromIterableJson({
    required Map<String, dynamic> json,
    Function(Iterable<dynamic>)? deserialize,
  }) {
    return BaseResponse(
      status: _Status.fromJson(json['status']),
      data: (json['data'] != null && deserialize != null)
          ? deserialize(json['data'])
          : null,
    );
  }
}

class _Status {
  int errorCode;
  String alertMessage;
  String errorMessage;
  _Status({
    this.errorCode = -1,
    this.alertMessage = '',
    this.errorMessage = '',
  });

  factory _Status.fromJson(Map<String, dynamic> json) {
    return _Status(
      errorCode: json['error_code'],
      alertMessage: json['alert_message'],
      errorMessage: json['error_message'],
    );
  }
}
