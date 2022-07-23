import 'package:flutter/material.dart';
import 'package:guia_de_jogos_gratis/Model/Game.dart';

class CardWidget extends StatefulWidget {
  final dados;
  const CardWidget({Key? key,required this.dados}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}


void _configurandoModalBottomSheet(context){
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15))
      ),
      context: context,
      builder: (BuildContext bc){
        return Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
          child: Wrap(children: <Widget>[
            ListTile(
                leading: new Icon(Icons.music_note),
                title: new Text('Músicas'),
                onTap: () => {}
            ),
            ListTile(
              leading: new Icon(Icons.videocam),
              title: new Text('Videos'),
              onTap: () => { },
            ),
            ListTile(
              leading: new Icon(Icons.satellite),
              title: new Text('Tempo'),
              onTap: () => {},
            ),
          ],
          ),
        );
      }
  );
}

class _CardWidgetState extends State<CardWidget> {
  @override
  Widget build(BuildContext context) {
    Game jogo = widget.dados;
    return Container(
      padding: EdgeInsets.only(top: 15 ,left: 25, right: 25),
      child: Card(
      shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0)
      ),
        child: InkWell(
          splashColor: Colors.purple.withAlpha(30),
          onTap: () {
            _configurandoModalBottomSheet(context);
          },
          child: Stack(
            fit: StackFit.passthrough,
            children: [
              Container(
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(8.0), image: DecorationImage(image: NetworkImage(jogo.thumbnail), fit: BoxFit.cover)),
                width: 300,
                height: 150,
              ),
              Container(
                //margin: EdgeInsets.only(top: 0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black,
                      ],)
                ),
                width: 300,
                height: 150,
                child: Padding(
                    padding: EdgeInsets.only(top: 110,left: 25),
                    child: Text(jogo.title, style: TextStyle(color: Colors.white.withOpacity(0.9), fontFamily: "Helvetica", fontSize: 20)),
                ),
              )
            ],
          )
       ),
      )
    );
  }
}



