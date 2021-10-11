import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:http_app/models/user_model.dart';
import 'package:http_app/screens/detail_screen.dart';

class ListWidget extends StatelessWidget {
  const ListWidget({
    Key? key,
    required this.users,
    required this.scroll,
  }) : super(key: key);

  final List<UserModel> users;
  final ScrollController scroll;

  @override
  Widget build(BuildContext context) {
    return CupertinoScrollbar(
      controller: scroll,
      child: ListView.separated(
        controller: scroll,
        itemCount: users.length,
        physics: const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (context, int index) => const SizedBox(height: 10),
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                users[index].profileUrl,
              ),
            ),
            title: Text(users[index].firstName),
            subtitle: Text(users[index].lastName),
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => DetailScreen(user: users[index]),
              ),
            ),
          );
        },
      ),
    );
  }
}
