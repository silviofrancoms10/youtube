import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:youtube/model/video.dart';

const CHAVE_YOUTUBE_API = "AIzaSyAzNtpZcIrjoaHypmj29E7UoEtqUXOUQes";
const ID_CANAL = "UCVHFbqXqoYvEWM1Ddxl0QDg";
const URL_BASE = "https://www.googleapis.com/youtube/v3/";

class Api {
  pesquisar(String pesquisa) async {
    http.Response response = await http.get(Uri.parse(
        "${URL_BASE}search?part=snippet&type=video&maxResults=20&order=date&q=${pesquisa}&key=${CHAVE_YOUTUBE_API}&channelId=${ID_CANAL}"));

    if (response.statusCode == 200) {
      Map<String, dynamic> dadosJson = json.decode(response.body);
      List<Video> videos = dadosJson["items"].map<Video>((map) {
        return Video.fromJson(map);
      }
      ).toList();

      for (var video in videos) {
        print("titulo: ${video.titulo}");
      }

    } else {
      print("Erro");
    }
  }
}
