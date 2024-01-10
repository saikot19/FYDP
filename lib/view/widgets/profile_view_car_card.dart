import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ProfileViewCarCard extends StatefulWidget {
  const ProfileViewCarCard({super.key});

  @override
  State<ProfileViewCarCard> createState() => _ProfileViewCarCardState();
}

// ignore: camel_case_types
class _ProfileViewCarCardState extends State<ProfileViewCarCard> {
  var value1 = false;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Container(
      height: mediaQuery.size.height * .13,
      width: mediaQuery.size.width * .22,
      child: Card(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        elevation: 5,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              height: mediaQuery.size.height * .17,
              width: mediaQuery.size.width * 1,
              child: Image.asset(
                'assets/images/car.jpg',
                fit: BoxFit.fill,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Toyota Premio',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                          fontSizeFactor: .2,
                        ),
                  ),
                  AutoSizeText(
                    'MX2104',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                          fontSizeFactor: .2,
                        ),
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
