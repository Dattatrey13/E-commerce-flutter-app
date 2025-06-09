class HomeBannerModel {
  final String? id;
  final String? title;
  final String? image;
  final String? link;

  HomeBannerModel({
    this.id,
    this.title,
    this.image,
    this.link,
  });

  factory HomeBannerModel.fromJson(Map<String, dynamic> json) {
    return HomeBannerModel(
      id: json['id']?.toString(),
      title: json['title']?.toString(),
      image: json['image']?.toString(),
      link: json['link']?.toString(),
    );
  }
} 