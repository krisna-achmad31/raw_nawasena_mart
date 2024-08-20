/// success : true
/// response : "200"
/// responseDescription : "The request has succeeded"
/// status_code : 1
/// dataArray : {"session_id":"41e6ad314b791a9427e2f346847b5348"}

class SessionResponse {
  SessionResponse({
    bool? success,
    String? response,
    String? responseDescription,
    int? statusCode,
    DataArray? dataArray,
  }) {
    _success = success;
    _response = response;
    _responseDescription = responseDescription;
    _statusCode = statusCode;
    _dataArray = dataArray;
  }

  SessionResponse.fromJson(dynamic json) {
    _success = json['success'];
    _response = json['response'];
    _responseDescription = json['responseDescription'];
    _statusCode = json['status_code'];
    _dataArray = json['dataArray'] != null ? DataArray.fromJson(json['dataArray']) : null;
  }

  bool? _success;
  String? _response;
  String? _responseDescription;
  int? _statusCode;
  DataArray? _dataArray;

  bool get success => _success!;

  String get response => _response!;

  String get responseDescription => _responseDescription!;

  int get statusCode => _statusCode!;

  DataArray get dataArray => _dataArray!;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['response'] = _response;
    map['responseDescription'] = _responseDescription;
    map['status_code'] = _statusCode;
    if (_dataArray != null) {
      map['dataArray'] = _dataArray!.toJson();
    }
    return map;
  }
}

/// session_id : "41e6ad314b791a9427e2f346847b5348"

class DataArray {
  DataArray({
    String? sessionId,
  }) {
    _sessionId = sessionId;
  }

  DataArray.fromJson(dynamic json) {
    _sessionId = json['session_id'];
  }

  String? _sessionId;

  String get sessionId => _sessionId!;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['session_id'] = _sessionId;
    return map;
  }
}
