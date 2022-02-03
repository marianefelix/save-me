class LinkModel {
  int id = 0;
  String title = "";
  String link = "";
  bool favorite = false;
  int userId = 0;
  int categoryId = 0;

  LinkModel();

  LinkModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    link = json['link'];
    favorite = json['favorite'];
    userId = json['user_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = title;
    data['link'] = link;
    data['favorite'] = favorite;
    data['user_id'] = userId;
    data['category_id'] = categoryId;

    return data;
  }
}