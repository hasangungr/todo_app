import 'package:todo_app/product/model/base_model.dart';

class PriortyModel extends BaseModel {
  int? id;
  String? priortyName;
  String? priortyIcon;
  PriortyModel({
    this.id,
    this.priortyName,
    this.priortyIcon,
  });

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['priortyName'] = priortyName;
    data['priortyIcon'] = priortyIcon;

    return data;
  }

  @override
  PriortyModel fromJson(Map<String, dynamic> json) => PriortyModel(
        id: json['id'],
        priortyName: json['priortyName'],
        priortyIcon: json['priortyIcon'],
      );
}
