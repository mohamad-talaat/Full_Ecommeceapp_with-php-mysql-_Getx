class CategoriesModel {
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesDatetime;
  String? categoriesImage;

// انا بعمل جيسون لأي داتا جايالي من الباك اند ف شكل ماب .. .لما تيجي ف الثيندر كلاينت وتلاقي الداتاجايالك ف شكل ماب
// زي حتة الكاتيجوري والأيتيمز يبقي لازم ملف جيسون عشان تاخد منه المتغيرات .. تستدعيها يعني

  CategoriesModel(
      {this.categoriesId,
      this.categoriesName,
      this.categoriesNameAr,
      this.categoriesDatetime,
      this.categoriesImage});

  CategoriesModel.fromJson(Map<String, dynamic> json) {
    categoriesId =  json['categories_id'].toString();
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesDatetime = json['categories_datetime'];
    categoriesImage = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['categories_id'] = categoriesId;
    data['categories_name'] = categoriesName;
    data['categories_name_ar'] = categoriesNameAr;
    data['categories_datetime'] = categoriesDatetime;
    data['categories_image'] = categoriesImage;
    return data;
  }
}
