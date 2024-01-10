import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import '../profile_view_screen.dart';

// ignore: camel_case_types
class friendRequest extends StatelessWidget {
  const friendRequest({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
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
            child: AutoSizeText(
              'Tahmim Jawad',
              maxLines: 1,
              style: Theme.of(context).textTheme.titleLarge?.apply(
                    fontSizeFactor: .8,
                  ),
            ),
          ),
          subtitle: Row(
            children: [
              SizedBox(
                height: mediaQuery.size.width * .08,
                width: mediaQuery.size.width * .24,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const AutoSizeText(
                    'Confirm',
                    maxLines: 1,
                  ),
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              SizedBox(
                height: mediaQuery.size.width * .08,
                width: mediaQuery.size.width * .24,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                  ),
                  child: const Text('Delete'),
                ),
              ),
            ],
          ),
          trailing: AutoSizeText(
            '4d',
            maxLines: 1,
            style: Theme.of(context)
                .textTheme
                .titleSmall
                ?.apply(color: Colors.grey.shade700, fontSizeFactor: .65),
          ),
        ),
      ),
    );
  }
}
