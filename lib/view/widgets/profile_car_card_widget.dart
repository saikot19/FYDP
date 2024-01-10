import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class ProfileCarCard extends StatefulWidget {
  const ProfileCarCard({super.key});

  @override
  State<ProfileCarCard> createState() => _ProfileCarCardState();
}

// ignore: camel_case_types
class _ProfileCarCardState extends State<ProfileCarCard> {
  var value1 = false;
  @override
  Widget build(BuildContext context) {
    var _mediaQuery = MediaQuery.of(context);
    return Container(
      height: _mediaQuery.size.height * .13,
      width: _mediaQuery.size.width * .22,
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
              height: _mediaQuery.size.height * .13,
              width: _mediaQuery.size.width * 1,
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
            Padding(
              padding: const EdgeInsets.only(left: 5, top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Sevice Status: ',
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleMedium?.apply(
                          fontSizeFactor: .2,
                        ),
                  ),
                  SizedBox(
                    height: _mediaQuery.size.height * .04,
                    width: _mediaQuery.size.height * .06,
                    child: FittedBox(
                      fit: BoxFit.contain,
                      child: CupertinoSwitch(
                        value: value1,
                        onChanged: (val) {
                          setState(() {
                            value1 = val;
                          });
                        },
                      ),
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
