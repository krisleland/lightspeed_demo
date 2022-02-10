import 'package:flutter/material.dart';

class UserCard extends StatefulWidget {
  const UserCard({Key? key}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
          side: const BorderSide(color: Colors.grey, width: 1),
          borderRadius: BorderRadius.circular(4)),
      elevation: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '{name}',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  Row(
                    children: const [
                      Icon(
                        Icons.phone,
                        color: Colors.blue,
                        size: 12,
                      ),
                      Text(
                        '{phone}',
                        style: TextStyle(fontSize: 12),
                      ),
                      SizedBox(
                        width: 16,
                      ),
                      Icon(
                        Icons.email,
                        color: Colors.blue,
                        size: 12,
                      ),
                      Text(
                        'email',
                        style: TextStyle(fontSize: 12),
                      )
                    ],
                  ),
                  UserCardExpansion(expand: expanded, child: const Text('{address}'),)
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(right: 8),
                child: GestureDetector(
                    onTap: () => setState(() {
                          expanded = !expanded;
                        }),
                    child: const Icon(
                      Icons.chevron_right,
                      size: 20,
                    )))
          ],
        ),
      ),
    );
  }
}

class UserCardExpansion extends StatefulWidget {
  final Widget? child;
  final bool expand;

  const UserCardExpansion({Key? key, this.child, this.expand = false}) : super(key: key);

  @override
  _UserCardExpansionState createState() => _UserCardExpansionState();
}

class _UserCardExpansionState extends State<UserCardExpansion> with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  void prepareAnimations() {
    controller = AnimationController(
        vsync: this,
        duration: const Duration(milliseconds: 500)
    );
    Animation<double> curve = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {

        });
      }
      );
  }

  @override
  void didUpdateWidget(UserCardExpansion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if(widget.expand) {
      controller.forward();
    }
    else {
      controller.reverse();
    }
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}


// class UserCardExpansion extends StatefulWidget {
//   final Widget? child;
//   final bool expand;
//
//   const UserCardExpansion({Key? key, this.expand = false, this.child}) : super(key: key);
//
//   @override
//   _UserCardExpansionS
// }