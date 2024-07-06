import 'package:todo_app/product/model/base_model.dart';

class TodoModel extends BaseModel {
  TodoModel({
    this.id,
    this.title,
    this.description,
    this.priortyId,
  });

  int? id;
  String? title;
  String? description;
  int? priortyId;

  @override
  TodoModel fromJson(Map<String, dynamic> json) {
    return TodoModel(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      priortyId: json['priortyId'],
    );
  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['description'] = description;
    data['priortyId'] = priortyId;
    return data;
  }
}
