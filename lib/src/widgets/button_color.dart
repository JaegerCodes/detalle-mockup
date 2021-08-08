import 'package:animate_do/animate_do.dart';
import 'package:buscape/src/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonColor extends StatefulWidget {
  final Color color;
  final int index;
  final String urlImagen;

  const ButtonColor(this.color, this.index, this.urlImagen);

  @override
  _ButtonColorState createState() => _ButtonColorState();
}

class _ButtonColorState extends State<ButtonColor> {
  @override
  Widget build(BuildContext context) {
    return FadeInLeft(
      delay: Duration(milliseconds: this.widget.index * 100),
      duration: Duration(milliseconds: 300),
      child: GestureDetector(
        onTap: () {
          final productModel = Provider.of<ProductModel>(context, listen: false);
          productModel.assetImage = this.widget.urlImagen;
          productModel.color = this.widget.color;
        },
        child: Container(
          width: 45,
          height: 45,
          decoration: BoxDecoration(
              color: widget.color,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.grey)),
        ),
      ),
    );
  }
}
