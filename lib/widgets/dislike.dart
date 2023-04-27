import 'package:flutter/material.dart';

class dislike extends StatelessWidget {
  const dislike({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.close,
          color: Colors.greenAccent,
        ),
        iconSize: 50,
        onPressed: onPressed,
      ),
    );
  }
}