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
      getIt.registerSingleton<TypicodeApiHandler>(
          TypicodeApiHandler._internal());
    }
    return getIt<TypicodeApiHandler>();
  }

  Future<Map<int, User>> users() async {
    Map<int, User> users = {};
    http.Response resp = await http.get(Uri.parse(typicodeApiUsers));
    print(resp.statusCode);
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body);
      for (int i = 0; i < data.length; i++) {
        var user = User.fromJson(data[i]);
        users[user.id!] = user;
      }
    }
    return users;
  }

  Future<Map<int, Todo>> todos({required int id}) async {
    Map<int, Todo> todos = {};
    http.Response resp =
        await http.get(Uri.parse(todosByUserId + id.toString()));
    if (resp.statusCode == 200) {
      var data = jsonDecode(resp.body);
      for (int i = 0; i < data.length; i++) {
        var todo = Todo.fromJson(data[i]);
        todos[todo.id!] = todo;
      }
    }
    return todos;
  }

  Future<bool> updateTodo(
      {required bool completed, required int todoId}) async {
    var uri = Uri.parse(patchTodo + todoId.toString());
    var resp =
        await http.patch(uri, body: jsonEncode({'completed': completed}));
    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> deleteTodo({required Todo todo}) async {
    var uri = Uri.parse(patchTodo + todo.id.toString());
    var resp = await http.delete(uri);
    if (resp.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
