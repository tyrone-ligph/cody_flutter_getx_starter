import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;
import 'package:projectname_flutter_mobile/helpers/resource_helper.dart';
import 'package:projectname_flutter_mobile/infrastructure/models/base_model.dart';
import 'package:projectname_flutter_mobile/infrastructure/models/resource_definition.dart';
import 'package:projectname_flutter_mobile/infrastructure/models/resource_list.dart';
import 'package:projectname_flutter_mobile/infrastructure/repository/api.dart';

class RemoteDataProvider {
  RemoteDataProvider._(String jwt, String username) {
    api = Api(jwt: jwt, username: username);
  }

  late Api api;

  Future<T> get<T extends BaseModel>(dynamic id,
      {Map<String, dynamic>? params}) async {
    final ResourceDefinition def = ResourceHelper.get<T>();
    final http.Response response = await api
        .get(
          '${def.endpoint}/$id',
          params: params,
        )
        .then(_validateResponse)
        .catchError(_onError);

    return def.builder!(json.decode(response.body)) as T;
  }

  Future<T> post<T extends BaseModel>(
    Map<String, dynamic> body, {
    String ext = '',
  }) async {
    final ResourceDefinition def = ResourceHelper.get<T>();
    final http.Response response = await api
        .post(
          '${def.endpoint}/$ext',
          body: body,
        )
        .then(_validateResponse)
        .catchError(_onError);
    return def.builder!(json.decode(response.body)) as T;
  }

  Future<ResourceList<T>> list<T extends BaseModel>({
    Map<String, dynamic>? params,
    String ext = '',
    String parseColumn = 'items',
    bool validateResponseCode = true,
  }) async {
    final ResourceDefinition def = ResourceHelper.get<T>();
    final http.Response response = await api
        .get(
          '${def.endpoint}$ext',
          params: params,
        )
        .then(_validateResponse)
        .catchError(_onError);

    final dynamic decodedBody = json.decode(response.body);

    return ResourceList<T>.fromJson(decodedBody);
    // return Future<ResourceList<T>>.value(ResourceList<T>(
    //     parseColumn: parseColumn,
    //     json: decodedBody is List
    //         ? <String, dynamic>{parseColumn: decodedBody}
    //         : decodedBody));
  }

  Future<bool> delete<T extends BaseModel>(
    T resource, {
    Map<String, dynamic>? params,
    String ext = '',
  }) async {
    final ResourceDefinition def = ResourceHelper.get<T>();

    final http.Response response = await api
        .delete('${def.endpoint}/$ext', params: params)
        .then(_validateResponse)
        .catchError(_onError);

    return Future<bool>.value(true);
  }

  Future<T> update<T extends BaseModel>(
    T resource, {
    String ext = '',
  }) async {
    final ResourceDefinition def = ResourceHelper.get<T>();
    final http.Response response = await api
        .put(
          '${def.endpoint}/$ext',
          body: resource.toJson(),
        )
        .then(_validateResponse)
        .catchError(_onError);

    return def.builder!(json.decode(response.body)) as T;
  }

  Future<T> patch<T extends BaseModel>(
    dynamic date, {
    Map<String, dynamic>? params,
    dynamic body,
    bool validateResponseCode = true,
  }) async {
    final ResourceDefinition def = ResourceHelper.get<T>();
    final http.Response response = await api
        .patch(
          '${def.endpoint}/$date',
          params: params,
          body: body,
        )
        .then(_validateResponse)
        .catchError(_onError);
    return def.builder!(json.decode(response.body)) as T;
  }

  Future<T> put<T extends BaseModel>(
    dynamic ext, {
    Map<String, dynamic>? params,
    dynamic body,
  }) async {
    final ResourceDefinition def = ResourceHelper.get<T>();
    final http.Response response = await api
        .put(
          '${def.endpoint}/$ext',
          params: params,
          body: body,
        )
        .then(_validateResponse)
        .catchError(_onError);

    return def.builder!(json.decode(response.body)) as T;
  }

  FutureOr _validateResponse(http.Response response) {
    if (response.statusCode >= 400 && response.statusCode < 500) {
      throw HttpException(response.body.toString());
    }
  }

  _onError(err) {
    print(err);
  }

  Future<File> download(String url, String filename) async {
    final http.Response response =
        await api.download(url).then(_validateResponse).catchError(_onError);

    if (response.statusCode != 200) {
      throw Exception();
    }

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final File file = File('$dir/$filename');
    await file.writeAsBytes(response.bodyBytes);
    return file;
  }
}
