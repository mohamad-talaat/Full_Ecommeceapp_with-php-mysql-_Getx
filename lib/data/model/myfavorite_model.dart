class MyFavoriteModel {
  int? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDesc;
  String? itemsDescAr;
  String? itemsImage;
  String? itemsPrice;
  int? itemsDescount;
  String? itemsDate;
  String? itemsActive;
  String? itemsCount;
  String? itemsCategories;
  String? favoriteId;
  String? favoriteUsersid;
  String? favoriteItemsid;
  String? usersId;

  MyFavoriteModel(
      {this.itemsId,
      this.itemsName,
      this.itemsNameAr,
      this.itemsDesc,
      this.itemsDescAr,
      this.itemsImage,
      this.itemsPrice,
      this.itemsDescount,
      this.itemsDate,
      this.itemsActive,
      this.itemsCount,
      this.itemsCategories,
      this.favoriteId,
      this.favoriteUsersid,
      this.favoriteItemsid,
      this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    itemsId = int.parse(json['items_id']);
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDesc = json['items_desc'];
    itemsDescAr = json['items_desc_ar'];
    itemsImage = json['items_image'];
    itemsPrice = json['items_price'];
    itemsDescount = json['items_descount'];
    itemsDate = json['items_date'];
    itemsActive = json['items_active'];
    itemsCount = json['items_count'];
    itemsCategories = json['items_categories'];
    favoriteId = json['favorite_id'];
    favoriteUsersid = json['favorite_usersid'];
    favoriteItemsid = json['favorite_itemsid'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['items_id'] = itemsId;
    data['items_name'] = itemsName;
    data['items_name_ar'] = itemsNameAr;
    data['items_desc'] = itemsDesc;
    data['items_desc_ar'] = itemsDescAr;
    data['items_image'] = itemsImage;
    data['items_price'] = itemsPrice;
    data['items_descount'] = itemsDescount;
    data['items_date'] = itemsDate;
    data['items_active'] = itemsActive;
    data['items_count'] = itemsCount;
    data['items_categories'] = itemsCategories;
    data['favorite_id'] = favoriteId;
    data['favorite_usersid'] = favoriteUsersid;
    data['favorite_itemsid'] = favoriteItemsid;
    data['users_id'] = usersId;
    return data;
  }
}
