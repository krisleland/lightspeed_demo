import 'package:flutter/material.dart';
import 'package:lightspeed_demo/widgets/user_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 700),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                const Text('Users',
                    style:
                        TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
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
                  child: MasonryGridView.count(
                    addAutomaticKeepAlives: true,
                   crossAxisCount: 2,
                    mainAxisSpacing: 4,
                    crossAxisSpacing: 4,
                    itemBuilder: (context, index) {
                     return UserCard(key: Key('user_card_$index'));
                    },
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
