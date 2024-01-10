import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

// ignore: camel_case_types
class friendCard extends StatelessWidget {
  const friendCard({
    super.key,
  });

  void profileView(BuildContext ctx) {
    Navigator.of(ctx).pushNamed('profileView', arguments: {});
  }

  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return GestureDetector(
      onTap: () {
        profileView(context);
      },
      child: Container(
        height: _mediaQuery.size.height * .18,
        width: _mediaQuery.size.height * .18,
        child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5,
          margin: EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                height: _mediaQuery.size.height * .10,
                width: _mediaQuery.size.height * .18,
                child: Image.asset(
                  'assets/images/Amit.jpg',
                  fit: BoxFit.fill,
                ),
              ),
              const SizedBox(
                height: 4,
              ),
              AutoSizeText(
                'Amit Hassan',
                maxLines: 1,
                style: Theme.of(context).textTheme.titleLarge?.apply(
                      fontSizeFactor: .7,
                    ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
