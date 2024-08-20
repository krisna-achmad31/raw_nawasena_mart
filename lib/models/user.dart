// /// id : "999df2f0-a1b5-11eb-994e-5b5086b576e5"
// /// vendorId : 1
// /// name : "vendorAdmin 1 - 1"
// /// email : "vendorAdmin1@mail.com"
// /// phone : "+628111"
// /// status : true
// /// createdAt : "2021-04-21T04:49:42.000Z"
// /// updatedAt : "2021-04-21T04:49:42.000Z"
// /// deletedAt : null
//
// class User {
//   String _id;
//   int _vendorId;
//   String _name;
//   String _email;
//   String _phone;
//   bool _status;
//   String _createdAt;
//   String _updatedAt;
//   dynamic _deletedAt;
//
//   String get id => _id;
//   int get vendorId => _vendorId;
//   String get name => _name;
//   String get email => _email;
//   String get phone => _phone;
//   bool get status => _status;
//   String get createdAt => _createdAt;
//   String get updatedAt => _updatedAt;
//   dynamic get deletedAt => _deletedAt;
//
//   User({
//       String? id,
//       int? vendorId,
//       String? name,
//       String? email,
//       String? phone,
//       bool? status,
//       String? createdAt,
//       String? updatedAt,
//       dynamic deletedAt}){
//     _id = id!;
//     _vendorId = vendorId!;
//     _name = name!;
//     _email = email!;
//     _phone = phone!;
//     _status = status!;
//     _createdAt = createdAt!;
//     _updatedAt = updatedAt!;
//     _deletedAt = deletedAt!;
// }
//
//   User.fromJson(dynamic json) {
//     _id = json["id"];
//     _vendorId = json["vendorId"];
//     _name = json["name"];
//     _email = json["email"];
//     _phone = json["phone"];
//     _status = json["status"];
//     _createdAt = json["createdAt"];
//     _updatedAt = json["updatedAt"];
//     _deletedAt = json["deletedAt"];
//   }
//
//   Map<String, dynamic> toJson() {
//     var map = <String, dynamic>{};
//     map["id"] = _id;
//     map["vendorId"] = _vendorId;
//     map["name"] = _name;
//     map["email"] = _email;
//     map["phone"] = _phone;
//     map["status"] = _status;
//     map["createdAt"] = _createdAt;
//     map["updatedAt"] = _updatedAt;
//     map["deletedAt"] = _deletedAt;
//     return map;
//   }
//
// }