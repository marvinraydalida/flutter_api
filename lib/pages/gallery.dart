import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//widgets
import 'package:api/widgets/tile.dart';

Future<List<Widget>> GetRandom() async {
  var response = await http.get(Uri.parse('https://api.unsplash.com/photos/random/?query=cat&count=10&orientation=landscape&client_id=V6GpSz7m-TYLtmYUh-O5Hr_DHSyamBmi_IzudF19MOc'));

  if (response.statusCode == 200) {
    var jsonResponse = jsonDecode(response.body);

    var newList = List.generate(10, (int index) => tile(
      url: jsonResponse[index]['urls']['regular'],
      likes: jsonResponse[index]['likes'],
    ));
    return newList;
  } else {
    print('Request failed with status: ${response.statusCode}.');
    return [];
  }
}

class gallery extends StatelessWidget {
  const gallery({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Widget>>(
      future: GetRandom(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Error occurred while fetching data.'),
          );
        } else {
          return ListView(
            children: snapshot.data!,
          );
        }
      },
    );
  }
}