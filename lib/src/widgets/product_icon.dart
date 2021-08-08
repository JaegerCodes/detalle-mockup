import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buscape/src/models/product_model.dart';

class ProductIcon extends StatelessWidget {
  final double size;
  final bool fullPage;
  final String tag;
  final String? url;

  ProductIcon(
      {this.size = 0.0,
      this.fullPage = false,
      required this.tag,
      required this.url});
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);
    return Hero(
        tag: tag,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: this.fullPage
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0))
                    : BorderRadius.circular(size / 4)),
            padding: EdgeInsets.all(0),
            child: Stack(
              children: <Widget>[
                url == null
                    ? Image(
                        image: AssetImage(productModel.assetImage),
                        width: this.fullPage ? null : size,
                        height: this.fullPage ? null : size,
                      )
                    : Image.network(
                        url!,
                        width: this.fullPage ? null : size,
                        height: this.fullPage ? null : size,
                      )
              ],
            )));
  }
}