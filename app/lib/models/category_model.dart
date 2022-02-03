class CategoryModel {
  int id = 0;
  String title = "";
  DateTime createdAt = DateTime.now();

  CategoryModel();

  CategoryModel.fromJson(Map<String, dynamic> json) {
    final parsedDate = DateTime(json['created_at']);
  
    id = json['id'];
    title = json['title'];
    createdAt = parsedDate;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['id'] = id;
    data['title'] = title;
    data['created_at'] = createdAt.toString();
    
    return data;
  }
}