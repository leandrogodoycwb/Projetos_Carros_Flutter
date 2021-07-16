import 'dart:async';

import 'package:carros/carro/carro.dart';
import 'package:carros/carro/carros_model.dart';
import 'package:carros/utils/nav.dart';
import 'package:carros/widgets/text_error.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'carro_page.dart';
import 'carros_api.dart';

class CarrosListView extends StatefulWidget {
  String tipo;
  CarrosListView(this.tipo);

  @override
  _CarrosListViewState createState() => _CarrosListViewState();
}

class _CarrosListViewState extends State<CarrosListView> with AutomaticKeepAliveClientMixin<CarrosListView>{
  List<Carro> carros;

  String get tipo => widget.tipo;

  final _model = CarrosModel();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    _fetch();
      }

      void _fetch() {
        _model.fetch(tipo);
      }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    print("CarrosListView build ${widget.tipo}");

    return Observer(
      builder: (_) {

        List<Carro> carros = _model.carros;

        if (_model.error != null) {
          return TextError("Não foi possível buscar os carros\n\nClique aqui para tentar novamente.",
          onPressed: _fetch
            ,);
        }

        if (carros == null) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }


        return _listView(carros);
      },
    );
  }

  Container _listView(List<Carro> carros) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
          itemCount: carros.length,
          itemBuilder: (context, index) {
            Carro c = carros[index];

            return Card(
              color: Colors.grey[100],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: Image.network(
                        c.urlFoto ?? "https://s3-sa-east-1.amazonaws.com/videos.livetouchdev.com.br/esportivos/Ferrari_FF.png",
                        width: 250,
                      ),
                    ),
                    Text(
                      c.nome,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(fontSize: 25),
                    ),
                    Text(
                      "descrição",
                      style: TextStyle(fontSize: 16),
                    ),
                    ButtonBarTheme(
                      data: ButtonBarTheme.of(context),
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () => _onClickCarro(c),
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {
                              /* ... */
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
    );
  }

  _onClickCarro(Carro c) {
    push(context, CarroPage(c));
  }

}
