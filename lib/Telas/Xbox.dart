import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Utils/ThemeConfig.dart';
import '../Widgets/BarApp.dart';
import '../Widgets/CardWiget.dart';
import 'Mobile.dart';
import 'Playstation.dart';
import 'Windows.dart';

class Xbox extends StatefulWidget {
  const Xbox({Key? key}) : super(key: key);

  @override
  State<Xbox> createState() => _XboxState();
}

class _XboxState extends State<Xbox> {
  ThemeConfig _temaApp = ThemeConfig();
  @override
  Widget build(BuildContext context) {
    //estilização da tela

    double _heigthNavigatorImages = 37;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(systemNavigationBarColor: _temaApp.cnavigator));

    //lista
    List<String> _conteudo = ["assasins creed", "league of legends", "need for speed", "grand theft auto", "teste"];

    return Scaffold(
      drawer: Drawer(
        backgroundColor: _temaApp.csecundaria,
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.deepPurple,
                  image: DecorationImage(
                      image: NetworkImage(
                          "https://s2.glbimg.com/"
                              "ZTXRVnwHdYosrf93vkFLPuBq6ug=/"
                              "0x0:695x391/1000x0/smart/filters:strip_icc()/i.s3.glbimg.com"
                              "/v1/AUTH_08fbf48bc0524877943fe86e43087e7a/internal_photos/bs/2021/K/C/loetxzQ8Ai3CRg1nArWA"
                              "/2016-03-14-cheats-skyrim-2.jpg"),
                      fit: BoxFit.cover
                  )
              ),
              child: Text(''),
            ),
            ListTile(
                title: Text("Pesquise por plataforma: ",
                    style: TextStyle(fontFamily: _temaApp.fontNavigator, fontSize: 16, color: Colors.white))
            ),
            Container(
              //color: _cprimaria,
              child: new Column(
                  children: new List.generate(4, (int index){
                    switch(index){
                      case 0:
                        return new GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Windows()));},child: ListTile(title: Text("Microsoft Windows (PC)",style: TextStyle(fontFamily: "dhyana-bold" ,color: Colors.white,fontSize: 11)), leading: new Image.asset("images/janelas.png", height: _heigthNavigatorImages-9), tileColor: _temaApp.cprimaria,),);
                        break;
                      case 1:
                        return new GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Playstation()));},child: ListTile(title: Text("Playstation",style: TextStyle(fontFamily: "zrnic",color: Colors.white)), leading:  new Image.asset("images/playstation.png", height: _heigthNavigatorImages), tileColor: _temaApp.csecundaria),);
                        break;
                      case 2:
                        return new GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Xbox()));},child: ListTile(title: Text("XBOX",style: TextStyle(fontFamily: "microsoftXbox",color: Colors.white)), leading:  new Image.asset("images/xbox.png",  height: _heigthNavigatorImages), tileColor: _temaApp.cprimaria),);
                        break;
                      case 3:
                        return new GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => Mobile()));},child: ListTile(title: Text("Mobile",style: TextStyle(fontFamily: _temaApp.fontNavigator ,color: Colors.white)), leading:  new Image.asset("images/aplicativo-movel.png",  height: _heigthNavigatorImages),tileColor: _temaApp.csecundaria),);
                        break;
                      default:
                        return new ListTile(leading: new Icon(Icons.error), title: Text("Ocorreu um erro"));
                        break;
                    }
                  })
              ),
            )
          ],
        ),
      ),
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: BarApp()
      ),
      body: Container(
          color: _temaApp.csecundaria,
          child: ListView.builder(
              itemCount: _conteudo.length,
              itemBuilder: (context, index){
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    //CardWidget()
                  ],
                );
              }
          )
      ),
    );
  }
}
