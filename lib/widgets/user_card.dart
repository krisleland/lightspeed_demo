import 'package:flutter/material.dart';
import 'package:lightspeed_demo/widgets/styles.dart';

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
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
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
                        children: [
                          const Icon(
                            Icons.phone,
                            color: Colors.blue,
                            size: 14,
                          ),
                          Text(
                            '{phone}',
                            style: content,
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          const Icon(
                            Icons.email,
                            color: Colors.blue,
                            size: 14,
                          ),
                          Text(
                            'email',
                            style: content,
                          )
                        ],
                      )
                    ],
                  ),
                  const Expanded(child: SizedBox(),),
                  Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: GestureDetector(
                          onTap: () => setState(() {
                            expanded = !expanded;
                          }),
                          child: Icon(
                            expanded
                                ? Icons.keyboard_arrow_down
                                : Icons.keyboard_arrow_right,
                            size: 20,
                          )))
                ],
              ),
            ),
            UserCardExpansion(
              expand: expanded,
              child: const SizedBox(
                  width: double.infinity, child: UserCardExpansionContent()),
            )
          ],
        ),
      ),
    );
  }
}

class UserCardExpansion extends StatefulWidget {
  final Widget? child;
  final bool expand;

  const UserCardExpansion({Key? key, this.child, this.expand = false})
      : super(key: key);

  @override
  _UserCardExpansionState createState() => _UserCardExpansionState();
}

class _UserCardExpansionState extends State<UserCardExpansion>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;
  late Animation<double> animation;

  @override
  void initState() {
    super.initState();
    prepareAnimations();
  }

  void prepareAnimations() {
    controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    Animation<double> curve = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn,
    );
    animation = Tween(begin: 0.0, end: 1.0).animate(curve)
      ..addListener(() {
        setState(() {});
      });
  }

  @override
  void didUpdateWidget(UserCardExpansion oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.expand) {
      controller.forward();
    } else {
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
    return SizeTransition(
      axisAlignment: 1.0,
      sizeFactor: animation,
      child: widget.child,
    );
  }
}

class UserCardExpansionContent extends StatelessWidget {
  const UserCardExpansionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.pin_drop,
                color: Colors.blue,
                size: 14,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '{street}',
                    style: content,
                  ),
                  Text(
                    '{city}, {zipcode}',
                    style: content,
                  ),
                ],
              )
            ],
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        const Divider(
          height: 8,
          thickness: 1,
          indent: 0,
          endIndent: 0,
          color: Colors.grey,
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Row(
            children: [
              Text(
                'View Todos',
                style: content,
              ),
              const Expanded(child: SizedBox()),
              const Icon(
                Icons.arrow_right_alt,
                size: 14,
              )
            ],
          ),
        )
      ],
    );
  }
}
