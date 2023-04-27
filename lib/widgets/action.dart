import 'package:flutter/material.dart';
import 'package:api/widgets/like.dart';
import 'package:api/widgets/dislike.dart';

class action extends StatefulWidget {
  const action({Key? key, required this.likes}) : super(key: key);
  final int likes;
  @override
  State<action> createState() => _actionState();
}

class _actionState extends State<action> {

  int _likes = 0;

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
  }

  void _like() {
    setState(() {
      _likes++;
    });
  }

  void _dislike() {
    setState(() {
      _likes--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Color.fromRGBO(255, 255, 255, 20),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          )
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 100,
            child: dislike(onPressed: _dislike,),
          ),
          Text(
            '$_likes',
            style: TextStyle(
                fontSize: 20
            ),
          ),
          SizedBox(
            width: 100,
            child: like(onPressed: _like,),
          ),
        ],
      ),
    );
  }
}
