import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class editCarCard extends StatefulWidget {
  const editCarCard({super.key});

  @override
  State<editCarCard> createState() => _editCarCardState();
}

// ignore: camel_case_types
class _editCarCardState extends State<editCarCard> {
  @override
  Widget build(BuildContext context) {
    var value1 = false;
    var _mediaQuery = MediaQuery.of(context);
    return Container(
      height: _mediaQuery.size.height * .15,
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
              height: _mediaQuery.size.height * .12,
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
            const SizedBox(
              height: 5,
            ),
            Container(
              height: _mediaQuery.size.height * .05,
              width: _mediaQuery.size.width * .35,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  foregroundColor: Colors.grey.shade200,
                ),
                child: AutoSizeText(
                  'Delete',
                  maxLines: 1,
                  style: Theme.of(context).textTheme.titleLarge?.apply(
                        fontSizeFactor: .2,
                        color: Colors.white,
                      ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
