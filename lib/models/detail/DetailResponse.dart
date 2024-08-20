/// productCategories : "Drink"
/// productDesc : "Es beras kencur asli"
/// productId : 0
/// productImage : "https://d1bpj0tv6vfxyp.cloudfront.net/articles/560641_23-7-2020_19-13-41.jpeg"
/// productName : "Beras Kencur"
/// productNumberPhone : 6281335322669
/// productOwner : "Krisna"
/// productPrice : 10000

class DetailResponse {
  DetailResponse({
      String? productCategories, 
      String? productDesc, 
      num? productId, 
      String? productImage, 
      String? productName, 
      num? productNumberPhone, 
      String? productOwner, 
      num? productPrice,}){
    _productCategories = productCategories;
    _productDesc = productDesc;
    _productId = productId;
    _productImage = productImage;
    _productName = productName;
    _productNumberPhone = productNumberPhone;
    _productOwner = productOwner;
    _productPrice = productPrice;
}

  DetailResponse.fromJson(dynamic json) {
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
  num? _productId;
  String? _productImage;
  String? _productName;
  num? _productNumberPhone;
  String? _productOwner;
  num? _productPrice;
DetailResponse copyWith({  String? productCategories,
  String? productDesc,
  num? productId,
  String? productImage,
  String? productName,
  num? productNumberPhone,
  String? productOwner,
  num? productPrice,
}) => DetailResponse(  productCategories: productCategories ?? _productCategories,
  productDesc: productDesc ?? _productDesc,
  productId: productId ?? _productId,
  productImage: productImage ?? _productImage,
  productName: productName ?? _productName,
  productNumberPhone: productNumberPhone ?? _productNumberPhone,
  productOwner: productOwner ?? _productOwner,
  productPrice: productPrice ?? _productPrice,
);
  String? get productCategories => _productCategories;
  String? get productDesc => _productDesc;
  num? get productId => _productId;
  String? get productImage => _productImage;
  String? get productName => _productName;
  num? get productNumberPhone => _productNumberPhone;
  String? get productOwner => _productOwner;
  num? get productPrice => _productPrice;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['productCategories'] = _productCategories;
    map['productDesc'] = _productDesc;
    map['productId'] = _productId;
    map['productImage'] = _productImage;
    map['productName'] = _productName;
    map['productNumberPhone'] = _productNumberPhone;
    map['productOwner'] = _productOwner;
    map['productPrice'] = _productPrice;
    return map;
  }

}