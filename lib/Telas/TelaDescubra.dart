import 'package:flutter/material.dart';
import 'package:guia_de_jogos_gratis/Utils/ThemeConfig.dart';
import 'package:guia_de_jogos_gratis/Widgets/CardWiget.dart';

import '../Endpoints/GetGames.dart';
import '../Model/Game.dart';

class TelaDescubra extends StatefulWidget {
  const TelaDescubra({Key? key}) : super(key: key);

  @override
  State<TelaDescubra> createState() => _TelaDescubraState();
}

class _TelaDescubraState extends State<TelaDescubra> {
  int indexGender = 0;
  ThemeConfig _temaApp = ThemeConfig();

  //build do future
  _listar() {
    GetGames apiConfig = GetGames();
      return apiConfig.getAllGames();


    }



  //estilização da tela
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.only(top: 45),
          child: FutureBuilder<List<Game>?>(
            future: _listar(),
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                case ConnectionState.active:
                case ConnectionState.done:
                  if (snapshot.hasData) {
                    return ListView.builder(
                        physics: ScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, index) {
                          Game jogo = snapshot.data![index];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [CardWidget(dados: jogo)],
                          );
                        });
                  }
              }
              return Center(child: Text("Nenhum conteúdo disponível."));
            },
          ),
        ),
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  bottomLeft: Radius.circular(10)),
              color: Colors.blue),
          height: 50,
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                    onPressed: () {

                    },
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 15, right: 15, top: 6),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text("TIRO", style: TextStyle(color: Colors.white)),
                    )),
                TextButton(
                    onPressed: () {


                    },
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 15, right: 15, top: 6),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text("RPG", style: TextStyle(color: Colors.white)),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 15, right: 15, top: 6),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text("CORRIDA", style: TextStyle(color: Colors.white)),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 15, right: 15, top: 6),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text("LUTA", style: TextStyle(color: Colors.white)),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 15, right: 15, top: 6),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text("BATTLE ROYALE", style: TextStyle(color: Colors.white)),
                    )),
                TextButton(
                    onPressed: () {},
                    child: Container(
                      height: 30,
                      padding: EdgeInsets.only(left: 15, right: 15, top: 6),
                      decoration: BoxDecoration(
                          color: Colors.deepPurple,
                          borderRadius: BorderRadius.circular(50)),
                      child: Text("ESTRATÉGIA", style: TextStyle(color: Colors.white)),
                    )),
              ],
            ),
          )
        ),
      ],
    );
  }
}
