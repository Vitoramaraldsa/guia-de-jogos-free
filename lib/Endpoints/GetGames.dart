import 'dart:convert';

import 'package:http/http.dart' as http;

import '../Model/Game.dart';
class GetGames{

  String URL_BASE = "https://www.freetogame.com/api/games";

Future<List<Game>?> getAllGames() async{
    http.Response response = await http.get(Uri.parse(URL_BASE));
    if (response.statusCode == 200) {
      List<dynamic> dadosJson = jsonDecode(response.body);
      List<Game> listaGames = dadosJson.map<Game>((map) {
        return Game.fromJson(map);
       }).toList();
      return listaGames;
    }
  }

  getAllGamesPlatform(String platform){

  }
}