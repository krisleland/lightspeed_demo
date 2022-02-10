import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightspeed_demo/typicode_api/models/todo.dart';
import 'package:lightspeed_demo/typicode_api/typicode_handler.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final TypicodeApiHandler handler = TypicodeApiHandler();

  UserCubit() : super(UserState.loading(users: {}, expandedIds: {}, todos: {})) {
    _getUserData();
  }

  _getUserData() async {
    var users = await handler.users();
    if (users.isNotEmpty) {
      emit(state.copyWith(users: users));
    }
  }

  getUserTodos({required int id, bool clearCache = false}) async {
    if (state.todos.containsKey(id) && !clearCache) {
      return;
    }
    emit(UserState.loading(users: state.users, expandedIds: state.expandedIds, todos: state.todos));
    var todos = await handler.todos(id: id);
    Map<int, List<Todo>> newTodos = Map.from(state.todos);
    newTodos[id] = todos;
    emit(state.copyWith(todos: newTodos));
  }
}
