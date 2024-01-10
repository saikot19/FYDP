import 'package:flutter/material.dart';
import './widgets/friends.dart';

class FriendListScreen extends StatelessWidget {
  static const routeName = '/friendListScreen';
  const FriendListScreen({super.key});

  void profileView(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('profileView', arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade200,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Text(
          'Friend List',
          style: Theme.of(context).textTheme.titleLarge?.apply(
                color: Colors.black,
              ),
        ),
      ),
      body: ListView(
        children: [
          friend(),
          friend(),
          friend(),
          friend(),
          friend(),
          friend(),
        ],
      ),
    );
  }
}
