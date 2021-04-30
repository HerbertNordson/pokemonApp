import 'package:flutter/material.dart';
import 'package:pokemon/poke_controller.dart';
import 'package:pokemon/pokemon.dart';

class PokeView extends StatefulWidget {
  @override
  _PokeViewState createState() => _PokeViewState();
}

class _PokeViewState extends State<PokeView> {
  final controller = PokeController();

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.blueGrey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FutureBuilder<Pokemon>(
              future: controller.pokemon,
              builder: (context, snapshot) {
                if (snapshot.connectionState != ConnectionState.done) {
                  return CircularProgressIndicator();
                }
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: Colors.yellow,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: Colors.white,
                          width: 10,
                        )),
                    child: Column(children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.white,
                              width: 10,
                            )),
                        child: Image.network(
                          snapshot.data.urlImage,
                          height: 300,
                          width: 300,
                          fit: BoxFit.cover,
                        ),
                      ),
                      Text(
                        snapshot.data.nome,
                        style: TextStyle(
                            fontSize: 40,
                            color: Colors.green,
                            fontWeight: FontWeight.bold),
                      ),
                    ]),
                  );
                } else if (snapshot.hasError) {
                  return Text(
                    snapshot.error,
                    style: TextStyle(fontSize: 24, color: Colors.red),
                  );
                }
                return Container();
              }),
          Container(
            margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    controller.loadPokemon();
                  });
                },
                child: Text(
                  'Carregar Pokemon',
                  style: TextStyle(fontSize: 20),
                )),
          ),
        ],
      ),
    );
  }
}
