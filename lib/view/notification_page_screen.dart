import 'package:flutter/material.dart';
import './widgets/notice_notification.dart';
import './widgets/request_notification.dart';

// ignore: camel_case_types
class notificationListScreen extends StatelessWidget {
  const notificationListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        body: ListView(
          children: [
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'New',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                              fontSizeFactor: .8,
                            ),
                      ),
                    ],
                  ),
                  requestNotification(),
                  noticeNotification(),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Yesterday',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                              fontSizeFactor: .8,
                            ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Oldest',
                        style: Theme.of(context).textTheme.titleLarge?.apply(
                              fontSizeFactor: .8,
                            ),
                      ),
                    ],
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
