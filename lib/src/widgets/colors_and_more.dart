import 'package:flutter/material.dart';

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
                  left: 180,
                  child: ButtonColor(
                      Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
              Positioned(
                  left: 120,
                  child: ButtonColor(
                      Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
              Positioned(
                  left: 60,
                  child: ButtonColor(
                      Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
              ButtonColor(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
            ],
          )),
        ],
      ),
    );
  }
}
