import 'package:todo_app/product/model/base_model.dart';

class PriortyModel extends BaseModel<PriortyModel> {
  int? priortyCode;
  String? priortyName;
  String? priortyIcon;

  PriortyModel({
    this.priortyCode,
    this.priortyName,
    this.priortyIcon,
    String? id,
  }) : super() {
    this.id = id;
  }

  @override
  Map<String, dynamic> get toJson {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['priortyCode'] = priortyCode;
    data['priortyName'] = priortyName;
    data['priortyIcon'] = priortyIcon;

    return data;
  }

  @override
  PriortyModel fromJson(Map<String, dynamic> json) {
    return PriortyModel(
      priortyCode: json['priortyCode'],
      priortyName: json['priortyName'],
      priortyIcon: json['priortyIcon'],
    );
  }
}
