import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lightspeed_demo/typicode_api/models/todo.dart';
import 'package:lightspeed_demo/typicode_api/typicode_handler.dart';
import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  final TypicodeApiHandler handler = TypicodeApiHandler();

  UserCubit()
      : super(UserState.loading(users: {}, expandedIds: {}, todos: {}, sortById: true)) {
    _getUserData();
  }

  _getUserData() async {
    var users = await handler.users();
    if (users.isNotEmpty) {
      emit(UserState.loaded(users: users, expandedIds: {}, todos: {}, sortById: true));
    }
  }

  getUserTodos({required int id, bool clearCache = false}) async {
    if (state.todos.containsKey(id) && !clearCache) {
      return;
    }
    emit(UserState.loading(
      sortById: state.sortById,
        users: state.users,
        expandedIds: state.expandedIds,
        todos: state.todos));
    var todos = await handler.todos(id: id);
    Map<int, Map<int, Todo>> newTodos = Map.from(state.todos);
    newTodos[id] = todos;
    emit(UserState.loaded(
      sortById: state.sortById,
        users: state.users, expandedIds: state.expandedIds, todos: newTodos));
  }

  updateTodoCompletion({required Todo todo, required bool completed}) async {
    if (!state.users.containsKey(todo.userId)) {
      return;
    }
    emit(UserState.loading(
      sortById: state.sortById,
        users: state.users,
        expandedIds: state.expandedIds,
        todos: state.todos));
    bool success =
        await handler.updateTodo(completed: completed, todoId: todo.id!);
    if (success) {
      var newTodos = Map<int, Map<int, Todo>>.from(state.todos);
      var newTodo = Todo(
          userId: todo.userId,
          completed: !todo.completed!,
          title: todo.title,
          id: todo.id!);
      newTodos[todo.userId]![todo.id!] = newTodo;
      emit(UserState.loaded(
        sortById: state.sortById,
          users: state.users, expandedIds: state.expandedIds, todos: newTodos));
    } else {
      emit(UserState.loaded(
        sortById: state.sortById,
          users: state.users,
          expandedIds: state.expandedIds,
          todos: state.todos));
    }
  }

  deleteTodo({required Todo todo}) async {
    emit(UserState.loading(
      sortById: state.sortById,
        users: state.users,
        expandedIds: state.expandedIds,
        todos: state.todos));
    bool success = await handler.deleteTodo(todo: todo);
    if (success) {
      var newTodos = Map<int, Map<int, Todo>>.from(state.todos);
      newTodos[todo.userId]!.remove(todo.id);
      emit(UserState.loaded(
        sortById: state.sortById,
          users: state.users, expandedIds: state.expandedIds, todos: newTodos));
    } else {
      emit(UserState.loaded(
        sortById: state.sortById,
          users: state.users,
          expandedIds: state.expandedIds,
          todos: state.todos));
    }
  }

  changeSort({required bool sortById}) {
    emit(state.copyWith(sortById: sortById));
  }
}
