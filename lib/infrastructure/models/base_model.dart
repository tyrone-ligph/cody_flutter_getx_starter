abstract class BaseModel {
  // BaseModel(Map<String, dynamic>? json) {
  //   fromJson(json);
  // }
  BaseModel.fromJson();

  DateTime? date;

  Map<String, dynamic> toJson();

  void setValue(dynamic value);

  dynamic getValue();
}
