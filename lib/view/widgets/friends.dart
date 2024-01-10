import 'package:flutter/material.dart';

import '../profile_view_screen.dart';

class friend extends StatelessWidget {
  const friend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          ProfileViewScreen.routeName,
        );
      },
      child: Card(
        color: Colors.grey.shade200,
        elevation: 1,
        margin: const EdgeInsets.symmetric(
          vertical: 8,
          horizontal: 8,
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            bottom: 3,
            top: 3,
          ),
          child: ListTile(
            leading: CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/images/Me.jpg'),
              onBackgroundImageError: (e, s) {
                debugPrint('image issue, $e,$s');
              },
            ),
            title: Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Text(
                'Tahmim Jawad',
                style: Theme.of(context).textTheme.titleLarge?.apply(
                      fontSizeFactor: .8,
                    ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
