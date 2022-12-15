import 'dart:convert';

import 'package:http/http.dart';

class NetworkService {
  final baseUrl = "http://localhost:3000";
  Future<List<dynamic>?> fetchTodos() async {
    try {
      final response = await get(Uri.parse('$baseUrl/todos'));
      print(response.body);
      jsonDecode(response.body) as List;
    } catch (e) {
      print(e);
      return [];
    }
    return [];
  }

  Future<bool> patchTodo(Map<String, String> patchObj, int id) async {
    try {
      await patch(Uri.parse("$baseUrl/todos/$id"), body: patchObj);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<Map?> addTodo(Map<String, String> todoObj) async {
    try {
      final response = await post(
        Uri.parse(
          "$baseUrl/todos",
        ),
        body: todoObj,
      );
      return jsonDecode(response.body);
    } catch (e) {
      return null;
    }
  }
}
