import 'package:animate_do/animate_do.dart';
import 'package:buscape/src/models/zapato_model.dart';
import 'package:buscape/src/widgets/custom_widgets.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

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
                  child: _BotonColor(
                      Color(0xffC6D642), 4, 'assets/imgs/verde.png')),
              Positioned(
                  left: 60,
                  child: _BotonColor(
                      Color(0xffFFAD29), 3, 'assets/imgs/amarillo.png')),
              Positioned(
                  left: 30,
                  child: _BotonColor(
                      Color(0xff2099F1), 2, 'assets/imgs/azul.png')),
              _BotonColor(Color(0xff364D56), 1, 'assets/imgs/negro.png'),
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


class _BotonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  const _BotonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ZapatoModel>(context, listen: false);
          zapatoModel.assetImage = this.urlImagen;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
        ),
      ),
    );
  }
}

class _AmountBuyNow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: <Widget>[
            Text('\$180.0',
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
                delay: Duration(seconds: 1),
                from: 8,
                child: BotonNaranja(texto: 'Buy now', ancho: 120, alto: 40))
          ],
        ),
      ),
    );
  }
}


