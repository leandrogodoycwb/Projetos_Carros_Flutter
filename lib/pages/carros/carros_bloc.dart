
import 'dart:async';

import 'package:carros/pages/carros/carro.dart';
import 'package:carros/pages/carros/carros_api.dart';
import 'package:carros/utils/simple_bloc.dart';

import '../../utils/network.dart';
import '../favoritos/carro_dao.dart';

class CarrosBloc extends SimpleBloc<List<Carro>> {

  Future<List<Carro>> fetch(String tipo) async {
    try {
      bool networkOn = await inNetworkOn();

      if (!networkOn) {
        List<Carro> carros = await CarroDAO().findAllByTipo(tipo);
        add(carros);
        return carros;
      }

      List<Carro> carros = await CarrosApi.getCarros(tipo);

      final dao = CarroDAO();
      // Salvar todos os carros
      carros.forEach(dao.save);


      add(carros);

      return carros;
    } catch (e) {
      print(e);
      addError(e);
    }
  }
}