import 'package:flutter/material.dart';
import 'package:lightspeed_demo/blocs/user_bloc/user_cubit.dart';
import 'package:lightspeed_demo/pages/todos_page.dart';
import 'package:lightspeed_demo/typicode_api/models/user.dart';
import 'package:lightspeed_demo/widgets/styles.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCard extends StatefulWidget {
  final User user;

  const UserCard({Key? key, required this.user}) : super(key: key);

  @override
  State<UserCard> createState() => _UserCardState();
}

class _UserCardState extends State<UserCard> {
  bool expanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          shape: RoundedRectangleBorder(
              side: const BorderSide(color: Colors.grey, width: 1),
              borderRadius: BorderRadius.circular(4)),
          elevation: expanded ? 8 : 0,
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.user.name ?? '{name}',
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold),
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
                                    widget.user.phone ?? '{phone}',
                                    style: content,
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.email,
                                    color: Colors.blue,
                                    size: 14,
                                  ),
                                  Text(
                                    widget.user.email ?? '{email}',
                                    style: content,
                                  )
                                ],
                              )
                            ],
                          ),
                          const Expanded(
                            child: SizedBox(),
                          ),
                          // Padding(
                          //     padding: const EdgeInsets.only(top: 6),
                          //     child: GestureDetector(
                          //         onTap: () => setState(() {
                          //               expanded = !expanded;
                          //             }),
                          //         child: Icon(
                          //           expanded
                          //               ? Icons.keyboard_arrow_down
                          //               : Icons.keyboard_arrow_right,
                          //           size: 20,
                          //         )))
                        ],
                      ),
                    ),
                    UserCardExpansion(
                      expand: expanded,
                      child: SizedBox(
                          width: double.infinity,
                          child: UserCardExpansionContent(
                            user: widget.user,
                          )),
                    )
                  ],
                ),
              ),
              Positioned.fill(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Align(
                    alignment: Alignment.topRight,
                    child: Padding(
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
                            ))),
                  ),
                ),
              )
            ],
          ),
        ),
      ],
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
  final User user;

  const UserCardExpansionContent({Key? key, required this.user})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
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
                    user.address?.street ?? '{street}',
                    style: content,
                  ),
                  Text(
                    '${user.address?.city ?? '{city}'}, ${user.address?.zipcode ?? '{zipcode}'}',
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
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.read<UserCubit>().getUserTodos(id: user.id!);
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => TodosPage(
                          user: user,
                        )));
          },
          child: Column(
            children: [
              const SizedBox(
                height: 8,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
              ),
            ],
          ),
        )
      ],
    );
  }
}
