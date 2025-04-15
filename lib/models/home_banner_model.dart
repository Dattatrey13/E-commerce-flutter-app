class HomeBannerModel {
  String? title;
  String? image;
  String? subTitle;
  String? offers;
  String? buttonTitle;

  HomeBannerModel({required this.title, this.image,this.subTitle,this.buttonTitle,this.offers});

  factory HomeBannerModel.fromJson(Map<dynamic, dynamic> json) {
    return HomeBannerModel(
      title: json['title'] as String?,
      image: json['image'] as String?,
      subTitle: json['subTitle'] as String?,
      buttonTitle: json['buttonTitle'] as String?,
      offers: json['offers'] as String?,
    );
  }
}
