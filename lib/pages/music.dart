import 'package:flutter/material.dart';

//Authentication
import 'package:api/authentication/spotify.dart';

class music extends StatefulWidget {
  const music({Key? key}) : super(key: key);

  @override
  State<music> createState() => _musicState();
}

class _musicState extends State<music> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.white,
        foregroundColor: Colors.redAccent,
        textStyle: TextStyle(
            fontSize: 25
        ),
      ),
      child: Text('Login to spotify 🎧'),
      onPressed: () async{

        final spotify = SpotifyOAuth();
        String? accessToken = '';

        if(!await spotify.hasAccessToken()){
          var code = await spotify.getAuthorizationCode();
          accessToken = await spotify.getAccessToken(code!);
          await spotify.saveAccessToken(accessToken);
        }
        else {
          accessToken = await spotify.readAccessToken();
        }

        Map<String,dynamic> topTracks = await spotify.fetchTopTracks(accessToken!);
        Map<String,dynamic> topArtists = await spotify.fetchTopArtists(accessToken!);
        for(var i = 0; i < 10; i++) {
          print(topTracks['items'][i]['name']);
        }
        for(var i = 0; i < 10; i++) {
          print(topArtists['items'][i]['name']);
        }

      },
    );
  }
}