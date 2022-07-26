import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';

class TelaGeneros extends StatefulWidget {
  const TelaGeneros({Key? key}) : super(key: key);

  @override
  State<TelaGeneros> createState() => _TelaNoticiasState();
}

class _TelaNoticiasState extends State<TelaGeneros> {
  List<String> _conteudo = [
    "assasins creed",
    "league of legends",
    "need for speed",
    "grand theft auto",
    "teste"
  ];

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: _conteudo.length,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3 / 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20), color: Colors.white),
          );
        }
    );
  }
}
