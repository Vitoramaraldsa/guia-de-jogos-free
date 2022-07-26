import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:guia_de_jogos_gratis/Endpoints/GetNews.dart';
import 'package:guia_de_jogos_gratis/Telas/TelaGeneros.dart';

import '../Model/New.dart';

class TelaNoticias extends StatefulWidget {
  const TelaNoticias({Key? key}) : super(key: key);

  @override
  State<TelaNoticias> createState() => _TelaNoticiasState();
}



class _TelaNoticiasState extends State<TelaNoticias> {




  Future<List<New>?>_listar() async{
    GetNews News = GetNews();
    return News.getAllNews();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<New>?>(
        future: _listar(),
        builder: (context,snapshot){
          switch(snapshot.connectionState){
            case ConnectionState.done:
              return GridView.builder(
                  itemCount: snapshot.data!.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                    maxCrossAxisExtent: 200,
                    childAspectRatio: 3 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    return Container(decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20), color: Colors.white),
                        child: AnyLinkPreview(
                          link: "${snapshot.data?[index].link}",
                          displayDirection: UIDirection.uiDirectionVertical,
                          showMultimedia: true,
                          bodyMaxLines: 5,
                          bodyTextOverflow: TextOverflow.ellipsis,
                          titleStyle: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                          ),
                          bodyStyle: TextStyle(color: Colors.grey, fontSize: 12),
                          errorBody: 'Show my custom error body',
                          errorTitle: 'Show my custom error title',
                          errorWidget: Container(
                            color: Colors.grey[300],
                            child: Text('Oops!'),
                          ),
                          errorImage: "https://google.com/",
                          cache: Duration(days: 7),
                          backgroundColor: Colors.grey[300],
                          borderRadius: 12,
                          removeElevation: false,
                          boxShadow: [BoxShadow(blurRadius: 3, color: Colors.grey)],
                          onTap: (){}, // This disables tap event
                        )
                    );
                  }
              );
            case ConnectionState.active:
            case ConnectionState.waiting:
              return Center(child: CircularProgressIndicator());
            case ConnectionState.active:

          }
          return Center(child: Text("Ocorreu um erro"));
        }
    );
  }
}
