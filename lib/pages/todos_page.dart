import 'package:flutter/material.dart';
import 'package:lightspeed_demo/blocs/user_bloc/user_cubit.dart';
import 'package:lightspeed_demo/blocs/user_bloc/user_state.dart';
import 'package:lightspeed_demo/typicode_api/models/user.dart';
import 'package:lightspeed_demo/widgets/todo_card.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodosPage extends StatelessWidget {

  // final Todo todo;

  final User user;

  const TodosPage({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lightspeed Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${user.name}'s Todos",
                    style:
                    const TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                const Divider(
                  height: 8,
                  thickness: 1,
                  indent: 0,
                  endIndent: 0,
                  color: Colors.grey,
                ),
                const SizedBox(
                  height: 16,
                ),
                Expanded(
                    child: LayoutBuilder(
                        builder: (context, constraints) {
                          return BlocBuilder<UserCubit, UserState>(
                              builder: (context, state) {
                                if (state is UserStateLoading && !state.todos.containsKey(user.id)) {
                                  return const Center(child: CircularProgressIndicator());
                                } else {
                                  return Container(
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(4),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: ListView(
                                        children: [
                                          for (final todo in state.todos[user.id]!.values)
                                            TodoCard(todo: todo)
                                        ],),
                                    ),
                                  );
                                }
                              }
                          );
                        }
                    )
                  // child: GridView.count(
                  //   childAspectRatio: 4/1,
                  //     crossAxisCount: 2,
                  //     shrinkWrap: true,
                  //     children: vals.map((e) => UserCard()).toList()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
