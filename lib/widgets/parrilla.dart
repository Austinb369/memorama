import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:memorama/config/config.dart';

class Parrilla extends StatefulWidget {
  final Nivel? nivel;
  const Parrilla(this.nivel, {super.key});

  @override
  _ParrillaState createState() => _ParrillaState();
}

class _ParrillaState extends State<Parrilla> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    inicializar(widget.nivel!);
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cartas.length,
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => FlipCard(
          direction: FlipDirection.HORIZONTAL,
          autoFlipDuration: const Duration(milliseconds: 500),
          front: Image.asset(cartas[index]),
          back: Image.asset("./images/reverso.png")),
    );
  }
}
