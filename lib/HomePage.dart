import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guia_de_jogos_gratis/Endpoints/GetNews.dart';
import 'package:guia_de_jogos_gratis/Telas/TelaDescubra.dart';
import 'package:guia_de_jogos_gratis/Telas/TelaGeneros.dart';
import 'package:guia_de_jogos_gratis/Telas/TelaNoticias.dart';
import 'package:guia_de_jogos_gratis/Widgets/BarApp.dart';
import 'package:guia_de_jogos_gratis/Utils/ThemeConfig.dart';

import 'Model/Game.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
  //configurações manuais de tema
  ThemeConfig _temaApp = ThemeConfig();
  var _indiceAtual = 0;

  @override
  Widget build(BuildContext context) {

    //teste
    //GetGames apiconfg = GetGames();
    //print(apiconfg.getAllGames().toString());
    //GetNews New = GetNews();
    //New.getAllGames();

    //estilização da tela
    //double _heigthNavigatorImages = 37;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: _temaApp.cnavigator));

    //lista
    List<String> _conteudo = ["assasins creed", "league of legends", "need for speed", "grand theft auto", "teste"];

    List<Widget> telas = [
      TelaDescubra(),
      TelaGeneros(),
      TelaNoticias(),
    ];

    return Scaffold(

      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: BarApp()
      ),

      body: Container(
        padding: EdgeInsets.all(0),
        color: _temaApp.csecundaria,
        child: telas[_indiceAtual]
      ),

      bottomNavigationBar: BottomNavigationBar(
        //cor fixada, shifting para criar o efeito de mudança de cores.
        type: BottomNavigationBarType.shifting,
        fixedColor: Colors.white,
        selectedLabelStyle: TextStyle(fontFamily: 'Montserrat'),
        //definir a cor após selecionar um item
        currentIndex: _indiceAtual,
        onTap: (indice) {
          setState(() {
            _indiceAtual = indice;
          });
        },
        //itens do bottom navigation
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.videogame_asset, size: 30,), label: "Todos os Jogos", backgroundColor: _temaApp.cprimaria),
          BottomNavigationBarItem(icon: Icon(Icons.star, size: 30,), label: "Generos", backgroundColor: _temaApp.cprimaria),
          BottomNavigationBarItem(icon: Icon(Icons.newspaper, size: 30,), label: "Notícias", backgroundColor: _temaApp.cprimaria)
        ],
      ),
    );
  }
}
