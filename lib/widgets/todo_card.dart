import 'package:flutter/material.dart';
import 'package:lightspeed_demo/blocs/user_bloc/user_cubit.dart';
import 'package:lightspeed_demo/typicode_api/models/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoCard extends StatelessWidget {
  final Todo todo;

  const TodoCard({Key? key, required this.todo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Row(
              children: [
                Checkbox(
                  value: todo.completed,
                  onChanged: (bool? value) => context
                      .read<UserCubit>()
                      .updateTodoCompletion(
                          todo: todo, completed: value ?? false),
                ),
                Flexible(
                    child: Text(
                  todo.title!,
                  style: TextStyle(
                      decoration:
                          todo.completed! ? TextDecoration.lineThrough : null),
                )),
                const SizedBox(
                  width: 40,
                )
              ],
            ),
            Positioned.fill(
              child: Align(
                  alignment: Alignment.centerRight,
                  child: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () {
                      context.read<UserCubit>().deleteTodo(todo: todo);
                    },
                  )),
            )
          ],
        ),
        const Divider(
          height: 8,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: Colors.grey,
        ),
      ],
    );
  }
}
