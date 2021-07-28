import 'package:carros/pages/carros/carro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapaPage extends StatelessWidget {
  final Carro carro;

  MapaPage(this.carro);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(carro.nome),
      ),
      body: _body(),
    );
  }

  _body() {
    return Container(
      child: GoogleMap(
        mapType: MapType.satellite,
        initialCameraPosition: CameraPosition(
          target: latLng(),
          zoom: 17
        ),
      ),
    );
  }

  latLng() {
    return LatLng(-22.951911, -43.2126759);
  }
}
