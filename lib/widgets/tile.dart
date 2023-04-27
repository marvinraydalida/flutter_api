import 'package:flutter/material.dart';
import 'package:api/widgets/action.dart';

class tile extends StatelessWidget {
  const tile({Key? key, required this.url, required this.likes}) : super(key: key);
  final String url;
  final int likes;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      // padding: EdgeInsets.fromLTRB(0, 400, 0, 0),
      margin: EdgeInsets.all(20),
      decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(this.url),
              fit: BoxFit.cover
          )
      ),
      child:  Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          SizedBox(
            height: 100,
            child: action(likes: this.likes),
          ),
        ],
      ),
    );
  }
}