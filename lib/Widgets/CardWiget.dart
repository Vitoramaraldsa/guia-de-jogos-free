import 'package:flutter/material.dart';
import 'package:guia_de_jogos_gratis/Model/Game.dart';
import 'package:guia_de_jogos_gratis/Utils/ThemeConfig.dart';
import 'package:url_launcher/url_launcher.dart';

class CardWidget extends StatefulWidget {
  final Game dados;

  const CardWidget({Key? key, required this.dados}) : super(key: key);

  @override
  State<CardWidget> createState() => _CardWidgetState();
}

class _CardWidgetState extends State<CardWidget> {
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(widget.dados.game_url))) {
      throw 'Could not launch';
    }
  }
  void _configurandoModalBottomSheet(context) {
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15), topRight: Radius.circular(15))),
        context: context,
        builder: (BuildContext bc) {
          return Container(
            height: 200,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                color: ThemeConfig().csecundaria),
            child: Column(
              children: [
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 10, top: 10),
                      child: Container(
                        width: 130,
                        height: 170,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            image: DecorationImage(
                                image: NetworkImage(widget.dados.thumbnail),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 5, left: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 190,
                            child: Text(
                              widget.dados.title,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 25,
                                  height: 0,
                                  fontFamily: "helvetica"),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    style: TextStyle(fontFamily: "helvetica"),
                                    children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.gamepad,
                                        color: Colors.white,
                                        size: 18,
                                      )),
                                      TextSpan(text: " Plataformas:  "),
                                      TextSpan(text: widget.dados.platform)
                                    ])),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10),
                            child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    style: TextStyle(fontFamily: "helvetica"),
                                    children: [
                                      WidgetSpan(
                                          child: Icon(
                                        Icons.star,
                                        color: Colors.white,
                                        size: 18,
                                      )),
                                      TextSpan(text: " Genero:  "),
                                      TextSpan(text: widget.dados.genre)
                                    ])),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: RichText(
                                  textAlign: TextAlign.left,
                                  text: TextSpan(
                                      style: TextStyle(fontFamily: "helvetica"),
                                      children: [
                                        WidgetSpan(
                                            child: Icon(
                                          Icons.developer_mode,
                                          color: Colors.white,
                                          size: 18,
                                        )),
                                        TextSpan(text: widget.dados.developer)
                                      ]))),
                          GestureDetector(
                            onTap: (){
                              _launchUrl();
                            },
                              child: Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                          style: TextStyle(
                                              fontFamily: "helvetica"),
                                          children: [
                                            WidgetSpan(
                                                child: Icon(
                                              Icons.link,
                                              color: Colors.white,
                                              size: 18,
                                            )),
                                            TextSpan(text: " Abrir link")
                                          ]))))
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 15, left: 25, right: 25),
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
          child: InkWell(
              splashColor: Colors.purple.withAlpha(30),
              onTap: () {
                _configurandoModalBottomSheet(context);
              },
              child: Stack(
                fit: StackFit.passthrough,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                            image: NetworkImage(widget.dados.thumbnail),
                            fit: BoxFit.cover)),
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
                          ],
                        )),
                    width: 300,
                    height: 150,
                    child: Padding(
                      padding: EdgeInsets.only(top: 110, left: 25),
                      child: Text(widget.dados.title,
                          style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontFamily: "Helvetica",
                              fontSize: 20)),
                    ),
                  )
                ],
              )),
        ));
  }
}
