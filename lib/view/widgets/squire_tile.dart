import 'package:flutter/material.dart';

class SquireTile extends StatelessWidget {
  final String imgUrl;
  const SquireTile({super.key, required this.imgUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.white),
        borderRadius: BorderRadius.circular(16),
        color: Colors.grey.shade100,
      ),
      child: Image.asset(
        imgUrl,
        height: 30,
      ),
    );
  }
}
