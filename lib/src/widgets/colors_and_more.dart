import 'package:animate_do/animate_do.dart';
import 'package:buscape/src/models/zapato_model.dart';
import 'package:buscape/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'button_color.dart';

class ColorsAndMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Stack(
            children: <Widget>[
              Positioned(
                  left: 90,
                  child: ButtonColor(
                      Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
              Positioned(
                  left: 60,
                  child: ButtonColor(
                      Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
              Positioned(
                  left: 30,
                  child: ButtonColor(
                      Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
              ButtonColor(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
            ],
          )),
          BotonNaranja(
            texto: 'More related items',
            alto: 30,
            ancho: 170,
            color: Color(0xffFFC675),
          )
        ],
      ),
    );
  }
}
