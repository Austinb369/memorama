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
  int? preclicked = -1;
  bool? flag = false, habilitado = true;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    cartas = [];
    initialState = [];
    inicializar(widget.nivel!);
  }
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cartas.length,
      shrinkWrap: true,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
      itemBuilder: (context, index) => FlipCard(
        onFlip: () {
          if (!flag!) {
             preclicked = index;
             flag = true;
          } else {
            flag = false;
            setState(() {
              habilitado = false;
            });
          }
          if (preclicked != index) {
            // Voltear las cartas
            if (cartas.elementAt(index) == cartas.elementAt(preclicked!)) {
              debugPrint("Son iguales");
              setState(() {
                initialState[preclicked!] = false;
                initialState[index] = false;
                habilitado = true;
              });
            } else {
              // Voltear las cartas programáticamente
              Future.delayed(Duration(milliseconds: 1000), () {
                controllers.elementAt(preclicked!).toggleCard();
                preclicked = index;
                controllers.elementAt(index).toggleCard();
                setState(() {
                  habilitado = true;
                });
              },);

            }
          }
          // Future.delayed(Duration(milliseconds: 100));

        },
          direction: FlipDirection.HORIZONTAL,
         fill: Fill.fillBack,
         flipOnTouch: habilitado!?initialState[index]:false,
          controller: controllers[index],
         // autoFlipDuration: const Duration(milliseconds: 500),
          back: Image.asset(cartas[index]),
          front: Image.asset("./images/reverso.png")),
    );
  }
}
