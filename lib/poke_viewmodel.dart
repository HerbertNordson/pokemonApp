import 'dart:async';
import 'dart:math';

import 'package:pokemon/poke_model.dart';
import 'pokemon.dart';

class PokeViewModel {
  final _model = PokeModel();

  Future<Pokemon> get pokemon => _model.pokemon;

  StreamController<Pokemon> streamPokemon = StreamController();

  loadPokemon() {
    _model.fetchPokemon(Random().nextInt(1000));
    _model.pokemon.then((value) => {streamPokemon.add(value)});
  }
}
