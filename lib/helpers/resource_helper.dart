import 'package:projectname_flutter_mobile/constants/db_keys.dart';
import 'package:projectname_flutter_mobile/infrastructure/models/resource_definition.dart';
import 'package:projectname_flutter_mobile/infrastructure/models/user.dart';

class ResourceHelper {

  ResourceHelper._();

  static final List<ResourceDefinition> _resources = <ResourceDefinition>[
    ResourceDefinition(
      type: User,
      endpoint: 'user',
      dbKey: DBKeys.DB_USER_KEY,
      builder: (dynamic json) => User.fromJson(json),
    ),
  ];

  static ResourceDefinition get<T>() => _resources
      .singleWhere((ResourceDefinition resource) => resource.type == T);

}
