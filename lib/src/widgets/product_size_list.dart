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
          _TallaZapatoCaja(numero: 'XS'),
          _TallaZapatoCaja(numero: 'S'),
          _TallaZapatoCaja(numero: 'M'),
          _TallaZapatoCaja(numero: 'L'),
          _TallaZapatoCaja(numero: 'XL'),
        ],
      ),
    );
  }
}

class _TallaZapatoCaja extends StatelessWidget {
  final String numero;

  const _TallaZapatoCaja({required this.numero});

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
                    : Color(0xffF1A23A),
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: (this.numero == zapatoModel.talla)
                ? Color(0xffF1A23A)
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              if (this.numero == zapatoModel.talla)
                BoxShadow(
                    color: Color(0xffF1A23A),
                    blurRadius: 10,
                    offset: Offset(0, 5))
            ]),
      ),
    );
  }
}
