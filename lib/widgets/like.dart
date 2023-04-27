import 'package:flutter/material.dart';

class like extends StatelessWidget {
  const like({Key? key, required this.onPressed}) : super(key: key);
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: IconButton(
        icon: Icon(
          Icons.favorite,
          color: Colors.redAccent,
        ),
        iconSize: 50,
        onPressed: onPressed,
      ),
    );
  }
}