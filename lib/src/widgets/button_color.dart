import 'package:animate_do/animate_do.dart';
import 'package:buscape/src/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonColor extends StatelessWidget {
  final Color color;
  final int index;
  final String urlImagen;

  const ButtonColor(this.color, this.index, this.urlImagen);

  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final zapatoModel = Provider.of<ProductModel>(context, listen: false);
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
