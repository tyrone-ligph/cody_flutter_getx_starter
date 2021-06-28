import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../../environment.dart';

class Api {

  Api({required String jwt, required String username}) {
    _headers = <String, String>{
      'Authorization': jwt,
      'auth-user': username,
      'Content-type': 'application/json',
      'Accept': 'application/json'
    };
  }

  late String baseUrl = Env.apiUrl;
  late Map<String, String> _headers;

  /// Convert [params] to URL query string.
  ///
  ///
  String _toQueryString(Map<String, dynamic>? params) {
    if (params != null && params.isNotEmpty) {
      final List<String> list = <String>[];
      params.forEach((String k, dynamic v) => list.add('$k=$v'));
      return '?' + list.join('&');
    } else {
      return '';
    }
  }

  /// Http GET request.
  ///
  ///
  Future<http.Response> get(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    final String query = _toQueryString(params);
    final http.Response res = await http.get(
      Uri.parse('$baseUrl/$endpoint$query'),
      headers: _headers,
    );
    return res;
  }

  /// Http DELETE request.
  ///
  ///
  Future<http.Response> delete(
    String endpoint, {
    Map<String, dynamic>? params,
  }) async {
    final String query = _toQueryString(params);
    final http.Response res = await http.delete(
      Uri.parse('$baseUrl/$endpoint$query'),
      body: jsonEncode(<String, String>{'_method': 'delete'}),
      headers: _headers,
    );

    return res;
  }

  /// Http PUT request.
  ///
  ///
  Future<http.Response> put(
    String endpoint, {
    Map<String, dynamic>? params,
    dynamic body,
  }) async {
    final String query = _toQueryString(params);
    final http.Response res = await http.put(
      Uri.parse('$baseUrl/$endpoint$query'),
      body: body == null ? '' : jsonEncode(body),
      headers: _headers,
    );

    return res;
  }

  Future<http.Response> patch(
    String endpoint, {
    Map<String, dynamic>? params,
    dynamic body,
  }) async {
    final String query = _toQueryString(params);
    final http.Response res = await http.patch(
      Uri.parse('$baseUrl/$endpoint$query'),
      body: body == null ? null : jsonEncode(body),
      headers: _headers,
    );
    return res;
  }

  /// Http POST request.
  ///
  ///
  Future<http.Response> post(
    String endpoint, {
    Map<String, dynamic>? params,
    dynamic body,
  }) async {
    final String query = _toQueryString(params);
    final http.Response res = await http.post(
      Uri.parse('$baseUrl/$endpoint$query'),
      body: body == null ? '' : jsonEncode(body),
      headers: _headers,
    );
    return res;
  }

  Future<http.Response> download(String url) async =>
      await http.get(Uri.parse(url));
}
