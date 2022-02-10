import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  const Text('{name}'),
                  Row(
                    children: const [
                      Text('Phone'),
                      SizedBox(
                        width: 16,
                      ),
                      Text('email')
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
