import 'package:cached_network_image/cached_network_image.dart';
import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carro_page.dart';
import 'package:carros/utils/nav.dart';
import 'package:flutter/material.dart';

class CarrosListView extends StatelessWidget {
  List<Carro> carros;

  CarrosListView(this.carros);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: ListView.builder(
        itemCount: carros != null ? carros.length : 0,
        itemBuilder: (context, index) {
          Carro c = carros[index];

          return InkWell(
            onTap: () => _onClickCarro(context, c),
            onLongPress: () => _onLongClickCarro(context, c),
            child: Card(
              color: Colors.grey[150],
              child: Container(
                padding: EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Center(
                      child: CachedNetworkImage(
                        imageUrl:
                        c.urlFoto ??
                            "http://www.livroandroid.com.br/livro/carros/esportivos/Ferrari_FF.png",
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
                      "descrição...",
                      style: TextStyle(fontSize: 16),
                    ),
                    // ignore: deprecated_member_use
                    ButtonTheme.bar(
                      // make buttons use the appropriate styles for cards
                      child: ButtonBar(
                        children: <Widget>[
                          FlatButton(
                            child: const Text('DETALHES'),
                            onPressed: () => _onClickCarro(context, c),
                          ),
                          FlatButton(
                            child: const Text('SHARE'),
                            onPressed: () {
                              _onClickShare(context, c);
                              /* ... */
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onLongClickCarro(BuildContext context, Carro c) {
    showDialog(context: context, builder: (context) {
      return SimpleDialog(
        title: Text(c.nome),
        children: <Widget>[
          ListTile(
            title: Text("Detalhes"),
            leading: Icon(Icons.directions_car),
            onTap: () {
              pop(context);
              _onClickCarro(context, c);
            },
          ),
          ListTile(
            title: Text("Share"),
            leading: Icon(Icons.share),
            onTap: () {
              pop(context);
              _onClickShare(context, c);
            },
          )
        ],
      );
    });
  }

  _onClickCarro(context, Carro c) {
    push(context, CarroPage(c));
  }

  void _onClickShare(contex, Carro c) {
    print("Share ${c.nome}");
  }

}
