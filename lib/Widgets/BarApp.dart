import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:guia_de_jogos_gratis/Utils/ThemeConfig.dart';

import '../HomePage.dart';

class BarApp extends StatefulWidget {
  const BarApp({Key? key}) : super(key: key);

  @override
  State<BarApp> createState() => _BarAppState();
}

class _BarAppState extends State<BarApp> {
  @override
  Widget build(BuildContext context) {
    ThemeConfig _temaApp = ThemeConfig();
    return AppBar(
        title: GestureDetector(
            onTap: (){
              //Navigator.pop(context, MaterialPageRoute(builder: (context) => HomePage()));
            },
            child: Container(
                height: 400,
                child:
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(padding: EdgeInsets.only(top: 32), child: Image.asset("images/logo.gif", height: 120)),
                  ],
                )
            )
        ),
          backgroundColor : _temaApp.cprimaria,
          systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: _temaApp.csecundaria,
        )
    );
  }
}
