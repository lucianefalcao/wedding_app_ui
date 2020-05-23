import 'package:flutter/material.dart';

class BuildStars extends StatelessWidget {

  final int rating;

  const BuildStars({this.rating});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(5, (index) {
        return index < rating
            ? Icon(Icons.star, color: Colors.amber, size: 16.0)
            : Icon(Icons.star, color: Colors.grey, size: 16.0);
      }),
    );
  }
}
