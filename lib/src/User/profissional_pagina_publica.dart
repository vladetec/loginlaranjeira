import 'package:loginlaranjeira/src/User/profissional_pagina_servicos.dart';
import 'package:flutter/material.dart';

class ProfPublicProfile extends StatefulWidget {
  @override
  _ProfPublicProfileState createState() => _ProfPublicProfileState();
}

class _ProfPublicProfileState extends State<ProfPublicProfile>
    with SingleTickerProviderStateMixin {
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = TabController(
        vsync: this, length: 3); // aqui se coloca a quantida de Tabelas
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Stack(
            children: <Widget>[
              Container(
                height: 250,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage("assets/subcategorias/S_Juridico.jpg"),
                        fit: BoxFit.cover)),
              ),
              Positioned(
                top: 150,
                left: 25,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.white, width: 2),
                      borderRadius: BorderRadius.circular(70),
                      image: DecorationImage(
                          image: AssetImage("assets/faces (2).jpg"))),
                ),
              ),
              Positioned(
                top: 205,
                left: 130,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Elisabete Tereza",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w500)),
                        SizedBox(
                          height: 2,
                        ),
                        Text(
                          "25 Agorinhas",
                          style: TextStyle(color: Colors.black45, fontSize: 12),
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Container(
                      alignment: Alignment.center,
                      height: 25,
                      width: 85,
                      decoration: BoxDecoration(
                          color: Theme.of(context).primaryColor,
                          borderRadius: BorderRadius.circular(12)),
                      child: Text(
                        "Seguir",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        textAlign: TextAlign.center,
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
          Padding(
            padding: EdgeInsets.only(top: 20),
            child: TabBar(
              controller: tabController,
              indicatorColor: Theme.of(context).primaryColor,
              labelColor: Colors.black,
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelColor: Colors.grey.withOpacity(0.6),
              isScrollable: false,
              tabs: <Widget>[
                Tab(
                  child: Text(
                    "Serviços",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Avaliações",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Tab(
                  child: Text(
                    "Perfil",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: TabBarView(
              controller: tabController,
              children: <Widget>[
                TabListaServicos(),
                TabListaServicos(),
                TabListaServicos(),
              ],
            ),
          )
        ],
      ),
    );
  }
}
