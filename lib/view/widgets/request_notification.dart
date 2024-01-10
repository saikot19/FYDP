import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class requestNotification extends StatelessWidget {
  const requestNotification({super.key});

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Card(
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
        subtitle: AutoSizeText(
          'Requested to be friend',
          maxLines: 2,
          style: Theme.of(context).textTheme.titleMedium?.apply(
                fontSizeFactor: .7,
              ),
        ),
        trailing: Column(
          children: [
            SizedBox(
              height: _mediaQuery.size.width * .058,
              width: _mediaQuery.size.width * .22,
              child: ElevatedButton(
                onPressed: () {},
                child: AutoSizeText(
                  'Accept',
                  maxLines: 1,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              height: _mediaQuery.size.width * .058,
              width: _mediaQuery.size.width * .22,
              child: ElevatedButton(
                onPressed: () {},
                child: AutoSizeText(
                  'Reject',
                  maxLines: 1,
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
