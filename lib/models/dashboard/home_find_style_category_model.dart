class HomeFindStyleCategoryModel {
  final String? id;
  final String? title;
  final String? image;
  final String? description;

  HomeFindStyleCategoryModel({
    this.id,
    this.title,
    this.image,
    this.description,
  });

  factory HomeFindStyleCategoryModel.fromJson(Map<String, dynamic> json) {
    return HomeFindStyleCategoryModel(
      id: json['id']?.toString(),
      title: json['title']?.toString(),
      image: json['image']?.toString(),
      description: json['description']?.toString(),
    );
  }
} 