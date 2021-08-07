import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buscape/src/models/zapato_model.dart';

class ProductIcon extends StatelessWidget {
  final double size;
  final bool fullPage;
  final String tag;

  ProductIcon({this.size = 0.0, this.fullPage = false, required this.tag});
  @override
  Widget build(BuildContext context) {
    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Hero(
        tag: tag,
        child: Container(
            decoration: BoxDecoration(
                color: Color(0xffFFCF53),
                borderRadius: this.fullPage
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0))
                    : BorderRadius.circular(size / 4)),
            padding: EdgeInsets.all(this.fullPage ? 20 : size / 8),
            child: Stack(
              children: <Widget>[
                Image(
                  image: AssetImage(zapatoModel.assetImage),
                  width: this.fullPage ? null : size,
                  height: this.fullPage ? null : size,
                )
              ],
            )));
  }
}
