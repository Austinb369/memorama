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
  int? clicked = 0, preclicked = -1;
  bool? flag = false;
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
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3),
      itemBuilder: (context, index) => FlipCard(
        onFlip: () {
          if (!flag!) {
             preclicked = index;
             clicked = -1;
             flag = true;
          } else {
            clicked = index;
            flag = false;
          }
          if (preclicked != clicked) {
            // Voltear las cartas
          }
          if (cartas.elementAt(clicked!) == cartas.elementAt(preclicked!)) {
            debugPrint("Clicked: Son iguales");
          } else {
            Future.delayed(Duration(seconds: 1), () {
              controllers.elementAt(clicked!).toggleCard();
              controllers.elementAt(preclicked!).toggleCard();
            },);
          }
          debugPrint("Clicker: $preclicked");
          debugPrint("Clicker: $clicked");
        },
          direction: FlipDirection.HORIZONTAL,
         fill: Fill.fillBack,
         flipOnTouch: true,
          controller: controllers[index],
         // autoFlipDuration: const Duration(milliseconds: 500),
          back: Image.asset(cartas[index]),
          front: Image.asset("./images/reverso.png")),
    );
  }
}
