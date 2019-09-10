import 'package:loginlaranjeira/src/User/profissional_pagina_publica.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'dart:async';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController _controller;
  String screenText = "";
  String screenSubText = "";
  Timer timer;
  int pos = 0;
  List<String> screenTextList = [
    "Encontre pessoas qualificadas",
    "Agorinha ou em outro horário",
    "Pague o combinado",
    "Várias formas de pagamento"
  ];
  List<String> screenSubTextList = [
    "Encontre proficionais com qualifições e avaliadas por usuarios de sua cidade",
    "Chame Agorinha, ou agende um horário de acordo com a agenda do profissional",
    "Contrate exatamente aquilo que será prestado, sem suspresas na hora do pagamento",
    "Escolhe entre as mais diveras forma de pagamentos. Pague no cartão de Crédito/Débito ou em espécie"
  ];

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.asset("assets/video.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
    _controller.setVolume(0.0);
    Timer.periodic(Duration(seconds: 5), (Timer t) {
      setState(() {
        screenText = screenTextList[pos];
        screenSubText = screenSubTextList[pos];
        pos++;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Agorinha Serviços",
      home: Scaffold(
        body: Stack(
          fit: StackFit.expand,
          children: <Widget>[
            Container(
              child: _controller.value.initialized
                  ? AspectRatio(
                      aspectRatio: _controller.value.aspectRatio,
                      child: VideoPlayer(_controller),
                    )
                  : Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            Container(
                width: double.infinity,
                height: double.infinity,
                color: Colors.black.withOpacity(0.6)),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    child: Text(
                      screenText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 16),
                  child: Container(
                    child: Text(
                      screenSubText,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white70, fontSize: 16),
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.only(left: 20, right: 16, bottom: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RaisedButton(
                            onPressed: () {},
                            child: Text(
                              "Oferecer Serviços",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600),
                            ),
                            color: Colors.amber,
                            // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            splashColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          RaisedButton(
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return ProfPublicProfile();
                              }));
                            },
                            child: Text("Buscar Serviços",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                            color: Theme.of(context).accentColor,
                            // padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            splashColor: Colors.grey,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
