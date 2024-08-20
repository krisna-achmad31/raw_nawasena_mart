import 'Data.dart';

class TempResponse {
  TempResponse({
    List<Data>? data,
    int? status,
  }){
    _data = data;
    _status = status;
  }

  TempResponse.fromJson(dynamic json) {
    if (json['data'] != null) {
      _data = [];
      json['data'].forEach((v) {
        _data!.add(Data.fromJson(v));
      });
    }
    _status = json['status'];
  }
  List<Data>? _data;
  int? _status;

  List<Data> get data => _data!;
  int get status => _status!;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    map['status'] = status;
    return map;
  }

}