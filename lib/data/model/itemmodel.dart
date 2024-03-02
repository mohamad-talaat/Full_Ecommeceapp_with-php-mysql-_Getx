class ItemsModel {
  String? _itemsId;
  String? _cartId;
  String? _itemsName;
  String? _itemsNameAr;
  String? _itemsDesc;
  String? _itemsDescAr;
  String? _itemsImage;
  int? _itemsPrice;
  int? _itemsDescount;
  String? _itemsDate;
  int? _itemsActive;
  int? _itemsCategories;
  int? _itemsCount;
  int? _categoriesId;
  String? _categoriesName;
  String? _categoriesNameAr;
  String? _categoriesDatetime;
  String? _categoriesImage;
  int? _favorite;

  itemsModel({
    String? itemsId,
    String? cartId,
    String? itemsName,
    String? itemsNameAr,
    String? itemsDesc,
    String? itemsDescAr,
    String? itemsImage,
    int? itemsPrice,
    int? itemsDescount,
    String? itemsDate,
    int? itemsActive,
    int? itemsCategories,
    int? itemsCount,
    int? categoriesId,
    String? categoriesName,
    String? categoriesNameAr,
    String? categoriesDatetime,
    String? categoriesImage,
    int? favorite,
  }) {
    if (itemsId != null) {
      this._itemsId = itemsId;
    } 
     if (cartId != null) {
      this._cartId = cartId;
    }
    if (itemsName != null) {
      this._itemsName = itemsName;
    }
    if (favorite != null) {
      this._favorite = favorite;
    }
    if (itemsNameAr != null) {
      this._itemsNameAr = itemsNameAr;
    }
    if (itemsDesc != null) {
      this._itemsDesc = itemsDesc;
    }
    if (itemsDescAr != null) {
      this._itemsDescAr = itemsDescAr;
    }
    if (itemsImage != null) {
      this._itemsImage = itemsImage;
    }
    if (itemsPrice != null) {
      this._itemsPrice = itemsPrice;
    }
    if (itemsDescount != null) {
      this._itemsDescount = itemsDescount;
    }
    if (itemsDate != null) {
      this._itemsDate = itemsDate;
    }
    if (itemsActive != null) {
      this._itemsActive = itemsActive;
    }
    if (itemsCategories != null) {
      this._itemsCategories = itemsCategories;
    }
    if (itemsCount != null) {
      this._itemsCount = itemsCount;
    }
    if (categoriesId != null) {
      this._categoriesId = categoriesId;
    }
    if (categoriesName != null) {
      this._categoriesName = categoriesName;
    }
    if (categoriesNameAr != null) {
      this._categoriesNameAr = categoriesNameAr;
    }
    if (categoriesDatetime != null) {
      this._categoriesDatetime = categoriesDatetime;
    }
    if (categoriesImage != null) {
      this._categoriesImage = categoriesImage;
    }
  }

  String? get itemsId => _itemsId;
  set itemsId(String? itemsId) => _itemsId = itemsId; 
   String? get cartId => _itemsId;
  set cartId(String? cartId) => _cartId = cartId;
  String? get itemsName => _itemsName;
  set itemsName(String? itemsName) => _itemsName = itemsName;
  int? get favorite => _favorite;
  set favorite(int? favorite) => _favorite = favorite;
  String? get itemsNameAr => _itemsNameAr;
  set itemsNameAr(String? itemsNameAr) => _itemsNameAr = itemsNameAr;
  String? get itemsDesc => _itemsDesc;
  set itemsDesc(String? itemsDesc) => _itemsDesc = itemsDesc;
  String? get itemsDescAr => _itemsDescAr;
  set itemsDescAr(String? itemsDescAr) => _itemsDescAr = itemsDescAr;
  String? get itemsImage => _itemsImage;
  set itemsImage(String? itemsImage) => _itemsImage = itemsImage;
  int? get itemsPrice => _itemsPrice;
  set itemsPrice(int? itemsPrice) => _itemsPrice = itemsPrice;
  int? get itemsDescount => _itemsDescount;
  set itemsDescount(int? itemsDescount) => _itemsDescount = itemsDescount;
  String? get itemsDate => _itemsDate;
  set itemsDate(String? itemsDate) => _itemsDate = itemsDate;
  int? get itemsActive => _itemsActive;
  set itemsActive(int? itemsActive) => _itemsActive = itemsActive;
  int? get itemsCategories => _itemsCategories;
  set itemsCategories(int? itemsCategories) =>
      _itemsCategories = itemsCategories;
  int? get itemsCount => _itemsCount;
  set itemsCount(int? itemsCount) => _itemsCount = itemsCount;
  int? get categoriesId => _categoriesId;
  set categoriesId(int? categoriesId) => _categoriesId = categoriesId;
  String? get categoriesName => _categoriesName;
  set categoriesName(String? categoriesName) =>
      _categoriesName = categoriesName;
  String? get categoriesNameAr => _categoriesNameAr;
  set categoriesNameAr(String? categoriesNameAr) =>
      _categoriesNameAr = categoriesNameAr;
  String? get categoriesDatetime => _categoriesDatetime;
  set categoriesDatetime(String? categoriesDatetime) =>
      _categoriesDatetime = categoriesDatetime;
  String? get categoriesImage => _categoriesImage;
  set categoriesImage(String? categoriesImage) =>
      _categoriesImage = categoriesImage;

  ItemsModel.fromJson(Map<String, dynamic> json) {
//    itemsId = json['items_id'];
    _itemsId = json['items_id'].toString();
    _cartId = json['cart_id'].toString();
    _itemsName = json['items_name'];
    _itemsNameAr = json['items_name_ar'];
    _itemsDesc = json['items_desc'];
    _itemsDescAr = json['items_desc_ar'];
    _itemsImage = json['items_image'];
    _itemsPrice = json['items_price'];
    _itemsDescount = json['items_descount'];
    _itemsDate = json['items_date'];
    _itemsActive = json['items_active'];
    _itemsCategories = json['items_categories'];
    _itemsCount = json['items_count'];
    _categoriesId = json['categories_id'];
    _categoriesName = json['categories_name'];
    _categoriesNameAr = json['categories_name_ar'];
    _categoriesDatetime = json['categories_datetime'];
    _categoriesImage = json['categories_image'];
    _favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['items_id'] = this._itemsId;
    data['cart_id'] = this._cartId;
    data['items_name'] = this._itemsName;
    data['items_name_ar'] = this._itemsNameAr;
    data['items_desc'] = this._itemsDesc;
    data['items_desc_ar'] = this._itemsDescAr;
    data['items_image'] = this._itemsImage;
    data['items_price'] = this._itemsPrice;
    data['items_descount'] = this._itemsDescount;
    data['items_date'] = this._itemsDate;
    data['items_active'] = this._itemsActive;
    data['items_categories'] = this._itemsCategories;
    data['items_count'] = this._itemsCount;
    data['categories_id'] = this._categoriesId;
    data['categories_name'] = this._categoriesName;
    data['categories_name_ar'] = this._categoriesNameAr;
    data['categories_datetime'] = this._categoriesDatetime;
    data['categories_image'] = this._categoriesImage;
    data['favorite'] = this._favorite.toString();
    return data;
  }
}
