class LoginResponse {
  LoginResponse({
    this.success,
    this.response,
    this.responseDescription,
    this.statusCode,
    this.dataArray,
  });

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    response = json['response'];
    responseDescription = json['responseDescription'];
    statusCode = json['status_code'];
    dataArray = json['dataArray'] != null ? DataArray.fromJson(json['dataArray']) : null;
  }

  bool? success;
  String? response;
  String? responseDescription;
  int? statusCode;
  DataArray? dataArray;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['response'] = response;
    map['responseDescription'] = responseDescription;
    map['status_code'] = statusCode;
    if (dataArray != null) {
      map['dataArray'] = dataArray!.toJson();
    }
    return map;
  }
}

class DataArray {
  DataArray({
    this.userId,
    this.username,
    this.name,
    this.email,
    this.dob,
    this.phone,
    this.gender,
    this.picture,
  });

  DataArray.fromJson(dynamic json) {
    userId = json['user_id'];
    username = json['username'];
    name = json['name'];
    email = json['email'];
    dob = json['dob'];
    phone = json['phone'];
    gender = json['gender'];
    picture = json['picture'];
  }

  String? userId;
  String? username;
  String? name;
  String? email;
  String? dob;
  String? phone;
  String? gender;
  String? picture;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['user_id'] = userId;
    map['username'] = username;
    map['name'] = name;
    map['email'] = email;
    map['dob'] = dob;
    map['phone'] = phone;
    map['gender'] = gender;
    map['picture'] = picture;
    return map;
  }
}
