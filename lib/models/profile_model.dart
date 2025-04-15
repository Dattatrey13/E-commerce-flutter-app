import 'package:dapperz/config.dart';

class ProfileModel {
  String? title;
  IconData? icon;
  String? subTitle;

  ProfileModel({this.title, this.icon, this.subTitle});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    subTitle = json['subTitle'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['icon'] = icon;
    data['subTitle'] = subTitle;
    return data;
  }
}
