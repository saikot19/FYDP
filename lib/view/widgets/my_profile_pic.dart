import 'package:flutter/material.dart';

// ignore: camel_case_types
class myProfilePic extends StatelessWidget {
  const myProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(800),
      child: Image.asset(
        'assets/images/Me.jpg',
        width: 120,
        height: 120,
        fit: BoxFit.cover,
      ),
    );
  }
}
