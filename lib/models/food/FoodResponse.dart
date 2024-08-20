class FoodResponse {
  FoodResponse({
    List<Data>? data,
    int? status,
  }){
    _data = data;
    _status = status;
  }

  FoodResponse.fromJson(dynamic json) {
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

class Data {
  Data({
    String? productCategories,
    String? productDesc,
    int? productId,
    String? productImage,
    String? productName,
    int? productNumberPhone,
    String? productOwner,
    int? productPrice,
  }){
    _productCategories = productCategories;
    _productDesc = productDesc;
    _productId = productId;
    _productImage = productImage;
    _productName = productName;
    _productNumberPhone = productNumberPhone;
    _productOwner = productOwner;
    _productPrice = productPrice;
  }

  Data.fromJson(dynamic json) {
    _productCategories = json['productCategories'];
    _productDesc = json['productDesc'];
    _productId = json['productId'];
    _productImage = json['productImage'];
    _productName = json['productName'];
    _productNumberPhone = json['productNumberPhone'];
    _productOwner = json['productOwner'];
    _productPrice = json['productPrice'];
  }
  String? _productCategories;
  String? _productDesc;
  int? _productId;
  String? _productImage;
  String? _productName;
  int? _productNumberPhone;
  String? _productOwner;
  int? _productPrice;

  String get productCategories => _productCategories!;
  String get productDesc => _productDesc!;
  int get productId => _productId!;
  String get productImage => _productImage!;
  String get productName => _productName!;
  int get productNumberPhone => _productNumberPhone!;
  String get productOwner => _productOwner!;
  int get productPrice => _productPrice!;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productCategories'] = productCategories;
    map['productDesc'] = productDesc;
    map['productId'] = productId;
    map['productImage'] = productImage;
    map['productName'] = productName;
    map['productNumberPhone'] = productNumberPhone;
    map['productOwner'] = productOwner;
    map['productPrice'] = productPrice;
    return map;
  }

}