class CartItemsModel {
  int? cartId;
  int? cartUsersid;
  int? cartItemsid;

  CartItemsModel({this.cartId, this.cartUsersid, this.cartItemsid});

  CartItemsModel.fromJson(Map<String, dynamic> json) {
    cartId = json['cart_id'];
    cartUsersid = json['cart_usersid'];
    cartItemsid = json['cart_itemsid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['cart_id'] = this.cartId;
    data['cart_usersid'] = this.cartUsersid;
    data['cart_itemsid'] = this.cartItemsid;
    return data;
  }
}