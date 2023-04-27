import 'dart:convert';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:dio/dio.dart';

class SpotifyOAuth {
  final String client_id = '946f9d597887478487a38e3dd16f0c19';
  final String client_secret = '3e4cd3888c6548fa815cb6e70cb3bb5d';
  final String redirect_uri = 'api://callback';
  final storage = new FlutterSecureStorage();
  final dio = Dio();


  final Map<String, dynamic> _queryParameters = {
    'client_id': '946f9d597887478487a38e3dd16f0c19',
    'response_type': 'code',
    'redirect_uri': 'api://callback',
    'scope': 'user-read-private user-read-email user-top-read',
  };

  Future<String?> getAuthorizationCode() async {
    var uri = Uri.https('accounts.spotify.com', '/authorize', _queryParameters);
    await launch(uri.toString());
    var result = await getUriLinksStream().first;
    var code = result?.queryParameters['code'];
    return code.toString();
  }

  Future<String> getAccessToken(String codeString) async {
    final dio = Dio();
    final response = await dio.post(
      'https://accounts.spotify.com/api/token',
      options: Options(
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
          'Authorization': 'Basic ' +
              base64Encode(utf8.encode('$client_id:$client_secret')),
        },
      ),
      data: {
        'grant_type': 'authorization_code',
        'code': codeString,
        'redirect_uri': redirect_uri,
      },
    );

    if (response.statusCode == 200) {
      final data = response.data;
      return data['access_token'];
      // do something with the access token
    } else {
      return 'No-Access-Token';
      // handle error
    }
  }

  Future<Map<String, dynamic>> fetchTopArtists(String accessToken) async {
    final response = await dio.get(
      'https://api.spotify.com/v1/me/top/artists?limit=10',
      options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          }
      ),
    );

    return response.data;
  }

  Future<Map<String, dynamic>> fetchTopTracks(String accessToken) async {
    final response = await dio.get(
      'https://api.spotify.com/v1/me/top/tracks?limit=10',
      options: Options(
          headers: {
            'Authorization': 'Bearer $accessToken',
          }
      ),
    );

    return response.data;
  }

  Future<void> saveAccessToken(String accessToken) async {
    storage.write(key: 'accessToken', value: accessToken);
  }

  Future<String?> readAccessToken() async {
    return storage.read(key: 'accessToken');
  }

  Future<bool> hasAccessToken() async {
    return storage.containsKey(key: 'accessToken');
  }
}
