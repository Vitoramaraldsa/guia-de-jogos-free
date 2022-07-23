import 'package:flutter/material.dart';
import 'package:guia_de_jogos_gratis/Widgets/CardWiget.dart';

import '../Endpoints/GetGames.dart';
import '../Model/Game.dart';

class TelaDescubra extends StatefulWidget {
  const TelaDescubra({Key? key}) : super(key: key);

  @override
  State<TelaDescubra> createState() => _TelaDescubraState();
}

class _TelaDescubraState extends State<TelaDescubra> {
  //build do future
  _listar(){
    GetGames apiConfig = GetGames();
    return apiConfig.getAllGames();
  }

  //estilização da tela

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Game>?>(
      future: _listar(),
      builder: (context,snapshot){
        switch(snapshot.connectionState){
          case ConnectionState.none:
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          case ConnectionState.active:
          case ConnectionState.done:
            if(snapshot.hasData){

              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    Game jogo = snapshot.data![index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        CardWidget(dados: jogo)
                      ],
                    );
                  }
              );
            }
        }
        return Center(child: Text(""));
      },
    );
  }
}
