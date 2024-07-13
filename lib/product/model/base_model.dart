abstract class BaseModel<T> {
  String? id;

  T fromJson(Map<String, dynamic> json);

  Map<String, dynamic> get toJson;
}
