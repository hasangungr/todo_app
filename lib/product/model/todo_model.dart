import 'package:todo_app/product/model/base_model.dart';

class TodoModel extends BaseModel {
  TodoModel({
    this.title,
    this.description,
    this.priortyId,
    String? id,
  }) : super() {
    this.id = id;
  }

  String? title;
  String? description;
  int? priortyId;

  @override
  TodoModel fromJson(Map<String, dynamic> json) {
    return TodoModel(
      title: json['title'],
      description: json['description'],
      priortyId: json['priortyId'],
    );
  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};

    data['title'] = title;
    data['description'] = description;
    data['priortyId'] = priortyId;
    return data;
  }
}
