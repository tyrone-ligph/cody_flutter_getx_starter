class ResourceDefinition {
  ResourceDefinition({
    this.endpoint,
    this.dbKey,
    this.type,
    this.builder,
  });

  String? endpoint;
  String? dbKey;
  Type? type;
  Function? builder;
}