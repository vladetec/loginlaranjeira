import 'package:flutter/material.dart';

class TabListaServicos extends StatefulWidget {
  @override
  _TabListaServicosState createState() => _TabListaServicosState();
}

class _TabListaServicosState extends State<TabListaServicos> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 15, right: 15, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                "Recomendado",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Text(
                "Ver todos",
                style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo),
              )
            ],
          ),
        ),
        Container(
          height: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              cartaoServico("assets/subcategorias/S_Negocios.jpg",
                  "Apoio Jurídico em Negociações", 60),
              cartaoServico("assets/subcategorias/S_audio_e_video.jpg",
                  "Concerto de Video Cassete", 200),
              cartaoServico("assets/subcategorias/S_Midia.jpg",
                  "Suas fotos em um CD", 40),
            ],
          ),
        )
      ],
    );
  }

  Widget cartaoServico(String imgPath, String nomeServico, int preco) {
    return Padding(
      padding: EdgeInsets.only(left: 15, top: 25, bottom: 10),
      child: Container(
        height: 175,
        width: 200,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                  blurRadius: 3,
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 3)
            ]),
      ),
    );
  }
}
