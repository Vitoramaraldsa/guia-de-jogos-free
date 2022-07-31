import 'dart:convert';
import 'package:http/http.dart' as http;
import '../Model/New.dart';

class GetNews{

  String URL_BASE = "https://gaming-news.p.rapidapi.com/news";


  Future<List<New>?> getAllNews() async{
    http.Response response = await http.get(Uri.parse(URL_BASE), headers: {
      'X-RapidAPI-Key': '64793d8d3emsh2a75078c6eaecd0p1f3ac5jsn9e724c10a371',
      'X-RapidAPI-Host': 'gaming-news.p.rapidapi.com'
    });

    if (response.statusCode == 200) {
      List<dynamic> dadosJson = jsonDecode(response.body);
      List<New> listNews = dadosJson.map<New>((map) {
        return New.fromJson(map);
      }).toList();

      return listNews;
    }
  }
}