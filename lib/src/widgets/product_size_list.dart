import 'package:buscape/src/helpers/palette.dart';
import 'package:buscape/src/models/product_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSizeList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: EdgeInsets.symmetric( horizontal: 30, vertical: 40),
      padding: EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          ProductSizeButton(numero: 'XS'),
          ProductSizeButton(numero: 'S'),
          ProductSizeButton(numero: 'M'),
          ProductSizeButton(numero: 'L'),
          ProductSizeButton(numero: 'XL'),
        ],
      ),
    );
  }
}

class ProductSizeButton extends StatelessWidget {
  final String numero;

  const ProductSizeButton({required this.numero});

  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ProductModel>(context);

    return GestureDetector(
      onTap: () {
        final zapatoModel = Provider.of<ProductModel>(context, listen: false);
        zapatoModel.talla = this.numero;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('$numero',
            style: TextStyle(
                color: (this.numero == zapatoModel.talla)
                    ? Colors.white
                    : Palette.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: (this.numero == zapatoModel.talla)
                ? Palette.onPrimary
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: this.numero == zapatoModel.talla
                      ? Palette.onPrimary
                      : Colors.grey[400]!,
                  blurRadius: 10,
                  offset: Offset(0, 5))
            ]),
      ),
    );
  }
}
