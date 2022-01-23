class Link {
  int id = 0;
  String link = "";
  bool favorite = false;
  int userId = 0;
  int categoryId = 0;

  Link();

  Link.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    link = json['link'];
    favorite = json['favorite'];
    userId = json['user_id'];
    categoryId = json['category_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['link'] = link;
    data['favorite'] = favorite;
    data['user_id'] = userId;
    data['category_id'] = categoryId;

    return data;
  }
}