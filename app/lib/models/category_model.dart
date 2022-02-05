class CategoryModel {
  int id = 0;
  int userId = 0;
  String title = "";

  CategoryModel();

  CategoryModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['user_id'] = userId;
    data['title'] = title;
    
    return data;
  }
}