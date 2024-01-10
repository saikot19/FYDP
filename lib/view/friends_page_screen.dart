import 'package:flutter/material.dart';
import './profile_view_screen.dart';
import './widgets/find_friend_list.dart';
import './widgets/friend_request_list.dart';

// ignore: camel_case_types
class friendListScreen extends StatelessWidget {
  const friendListScreen({super.key});

  void profileView(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(ProfileViewScreen.routeName, arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: SingleChildScrollView(
          child: Column(children: [
            const SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.all(20),
              child: TextField(
                // onChanged: (value) => _runFilter(value),
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey.shade600),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  contentPadding: const EdgeInsets.symmetric(
                      vertical: 15.0, horizontal: 20),
                  hintText: "Search Friends",
                  hintStyle: TextStyle(
                    color: Colors.grey.shade500,
                  ),
                  suffixIcon: const Icon(
                    Icons.search_sharp,
                    color: Colors.black,
                  ),

                  // prefix: Icon(Icons.search),
                ),
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Expanded(
                    child: Divider(
                  thickness: 0.5,
                  color: Colors.grey.shade500,
                )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text(
                    'Friend Request',
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                        color: Colors.grey.shade700, fontSizeFactor: .7),
                  ),
                ),
                Expanded(
                    child: Divider(
                  thickness: 0.5,
                  color: Colors.grey.shade500,
                )),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            friendRequest(),
            const findFriend(),
          ]),
        ),
      ),
    );
  }
}
