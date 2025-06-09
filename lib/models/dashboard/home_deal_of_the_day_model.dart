class HomeDealOfTheDayModel {
  final String? id;
  final String? title;
  final String? image;
  final String? price;
  final String? discountPrice;

  HomeDealOfTheDayModel({
    this.id,
    this.title,
    this.image,
    this.price,
    this.discountPrice,
  });

  factory HomeDealOfTheDayModel.fromJson(Map<String, dynamic> json) {
    return HomeDealOfTheDayModel(
      id: json['id']?.toString(),
      title: json['title']?.toString(),
      image: json['image']?.toString(),
      price: json['price']?.toString(),
      discountPrice: json['discount_price']?.toString(),
    );
  }
} 