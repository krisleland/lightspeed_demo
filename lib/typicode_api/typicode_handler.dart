import 'dart:convert';

import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:lightspeed_demo/typicode_api/endpoints.dart';

import 'models/todo.dart';
import 'models/user.dart';

final getIt = GetIt.instance;

class TypicodeApiHandler {
  TypicodeApiHandler._internal();

  factory TypicodeApiHandler() {
    if (!getIt.isRegistered<TypicodeApiHandler>()) {
      getIt.registerSingleton<TypicodeApiHandler>(TypicodeApiHandler._internal());
    }
    return getIt<TypicodeApiHandler>();
  }

  Future<Map<int, User>> users() async {
    Map<int, User> users = {};
    http.Response resp = await http.get(Uri.parse(typicodeApiUsers));
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body);
      for (int i = 0; i < data.length; i++) {
        var user = User.fromJson(data[i]);
        users[user.id!] = user;
      }
    }
    return users;
  }

  Future<List<Todo>> todos({required int id}) async {
    List<Todo> todos = [];
    http.Response resp = await http.get(Uri.parse(typicodeApiUsers + id.toString()));
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body);
      for (int i = 0; i < data.length; i++) {
        var todo = Todo.fromJson(data[i]);
        todos.add(todo);
      }
    }
    return todos;
  }
}