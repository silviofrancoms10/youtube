import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyDRSxUQ6QGfH8zn0wSErimE4DYXGjQuUHI";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  Future<List<Video>> pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(
        "${URL_BASE}search?part=snippet&type=video&maxResults=20&order=date&q=${pesquisa}&key=${CHAVE_YOUTUBE_API}&channelId=${ID_CANAL}"));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }).toList();

      return videos;
    } else {
      print("Erro");
      return [];
    }
  }
}
