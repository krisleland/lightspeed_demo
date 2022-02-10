import 'package:flutter/material.dart';
import 'package:lightspeed_demo/widgets/user_card.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const <Widget>[
            Text('Users', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            Divider(
              height: 8,
              thickness: 1,
              indent: 0,
              endIndent: 0,
              color: Colors.grey,
            ),
            SizedBox(height: 16,),
            UserCard()
          ],
        ),
      ),
    );
  }
}
