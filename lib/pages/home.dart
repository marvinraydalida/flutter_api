import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 400,
          width: 300,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage('https://scontent.fmnl30-2.fna.fbcdn.net/v/t39.30808-6/320070449_720631522754367_8049869735449231555_n.jpg?_nc_cat=110&ccb=1-7&_nc_sid=174925&_nc_eui2=AeH-PIYTH_Y-oK1D4J--31IxxGrVvi7OZLLEatW-Ls5ksuQUI1n-lPz7_gs6P9ikyFKZgkrdDqloejzwHSWcx5nQ&_nc_ohc=yEnLWX9wJLAAX8CRIMP&_nc_ht=scontent.fmnl30-2.fna&oh=00_AfAxtXvbVGPouaz32aUW24c0EpQ2rDv8IbxSt2ruJ4tH1Q&oe=644E8F5B'),
              fit: BoxFit.cover,
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.2),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Transform.translate(
                offset: Offset(0, 40),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      '🎓',
                      style: TextStyle(
                          fontSize: 50
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(10)
              ),
              child: Text(
                '🏃 Unhealthy',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.lightBlueAccent,
                    borderRadius: BorderRadius.circular(10)
                ),
                child: Text(
                  '🧟 Zombie',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                )
            ),
          ],
        ),
        Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: Colors.green[300],
                borderRadius: BorderRadius.circular(10)
            ),
            child: Text(
              '😪 Need Sleep',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            )
        ),
      ],
    );
  }
}