import 'package:flutter/material.dart';
import 'package:http_app/models/user_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.user}) : super(key: key);

  final UserModel user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          user.lastName,
          style: Theme.of(context).textTheme.headline6,
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: <Widget>[
            Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        user.profileUrl,
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text('Id'),
                    subtitle: Text('${user.id}'),
                  ),
                  ListTile(
                    title: const Text('First Name'),
                    subtitle: Text(user.firstName),
                  ),
                  ListTile(
                    title: const Text('Last Name'),
                    subtitle: Text(user.lastName),
                  ),
                  ListTile(
                    title: const Text('Email'),
                    subtitle: Text(user.email),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
