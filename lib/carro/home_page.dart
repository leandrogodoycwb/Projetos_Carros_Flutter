import 'package:carros/carro/carro.dart';
import 'package:carros/carro/carros_api.dart';
import 'package:carros/carro/carros_listview.dart';
import 'package:carros/drawer_list.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Carros"),
          bottom: TabBar(tabs: [
            Tab(text: "Clássicos",),
            Tab(text: "Esportivos",),
            Tab(text: "Luxos",)
          ],),
        ),
        body: TabBarView(children: [
          CarrosListView(),
          CarrosListView(),
          CarrosListView()
        ],),
        drawer: DrawerList(),
      ),
    );
  }


}
