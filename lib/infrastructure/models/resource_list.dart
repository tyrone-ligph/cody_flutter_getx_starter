import 'package:projectname_flutter_mobile/helpers/resource_helper.dart';
import 'package:projectname_flutter_mobile/infrastructure/models/base_model.dart';
import 'package:projectname_flutter_mobile/infrastructure/models/resource_definition.dart';

class ResourceList<T extends BaseModel> extends BaseModel {
  ResourceList({
    this.items,
    this.meta,
    this.parseColumn = 'items'
  }) : super.fromJson();

  ResourceList.fromJson(Map<String, dynamic> json) : super.fromJson() {
    if (json[parseColumn] != null) {
      items = <T>[];
      json[parseColumn].forEach((dynamic v) {
        final ResourceDefinition def = ResourceHelper.get<T>();
        items!.add(def.builder!(v) as T);
      });
    }

    if (json['meta'] != null) {
      meta = json['meta'] as Map<String, dynamic>;
    }

    if (json['unread_count'] != null) {
      count = json['unread_count'][0]['count'] as String;
    }
  }

  List<T>? items = <T>[];
  Map<String, dynamic>? meta;
  String? count;
  String? parseColumn;


  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (items != null && parseColumn != null) {
      data[parseColumn!] = items!.map((T v) => v.toJson()).toList();
    }
    return data;
  }

  @override
  void setValue(dynamic value) {}

  @override
  dynamic getValue() {}
}
