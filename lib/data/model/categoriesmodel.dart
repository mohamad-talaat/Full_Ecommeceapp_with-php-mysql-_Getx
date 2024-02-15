class CategoriesModel {
  int? categoriesId;
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
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesDatetime = json['categories_datetime'];
    categoriesImage = json['categories_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_datetime'] = this.categoriesDatetime;
    data['categories_image'] = this.categoriesImage;
    return data;
  }
}
