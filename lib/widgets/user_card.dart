import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.grey, width: 1), borderRadius: BorderRadius.circular(4)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('{name}'),
                  const SizedBox(height: 4,),
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
