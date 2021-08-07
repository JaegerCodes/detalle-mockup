import 'package:animate_do/animate_do.dart';
import 'package:buscape/src/models/product_response.dart';
import 'package:buscape/src/widgets/button_themed.dart';
import 'package:buscape/src/widgets/colors_and_more.dart';
import 'package:buscape/src/widgets/oeschle_app_bar.dart';
import 'package:buscape/src/widgets/product_description.dart';
import 'package:buscape/src/widgets/product_icon.dart';
import 'package:buscape/src/widgets/product_size_list.dart';
import 'package:flutter/material.dart';
import 'package:buscape/src/helpers/helpers.dart';

class ProductDescPage extends StatelessWidget {
  final String tag;
  final Item data;
  const ProductDescPage({required this.tag, required this.data});

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();

    return Scaffold(
        body: Column(
      children: <Widget>[
        OeschleAppBar(
          title: "Detalle del producto",
        ),
        Stack(
          children: <Widget>[
            ProductIcon(
              url: (data.images?.length ?? 0) > 0
                  ? data.images!.first.imageUrl
                  : null,
              tag: tag,
              size: 0,
              fullPage: true,
            ),
          ],
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              ProductDescription(
                titulo: data.name!,
                descripcion: "",
              ),
              _AmountBuyNow(),
              ColorsAndMore(),
              ProductSizeList(),
              _ButtonsLikeCartSettings()
            ],
          ),
        ))
      ],
    ));
  }
}

class _ButtonsLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 25)),
          _BotonSombreado(Icon(Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4), size: 25)),
          _BotonSombreado(Icon(Icons.settings,
              color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
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
                child: ButtonThemed(texto: 'Buy now', ancho: 120, alto: 40))
          ],
        ),
      ),
    );
  }
}
