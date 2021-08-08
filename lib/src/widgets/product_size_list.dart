import 'package:buscape/src/helpers/palette.dart';
import 'package:buscape/src/models/product_model.dart';
import 'package:buscape/src/models/product_response.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductSizeList extends StatelessWidget {
  final List<Presentation> presentations;
  final int index;

  const ProductSizeList(
      {Key? key, required this.presentations, required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Set<String> colorSet = Set();
    Set<String> sizeSet = Set();
    presentations.forEach((element) {
      if (element.color == presentations[index].color)
        sizeSet.add(element.size);
    });
    // List<Color> colors = colorSet.toList();
    List<String> sizes = sizeSet.toList();
    List<Widget> sizeButtons = <Widget>[];
    for (var i = 0; i < sizes.length; ++i) {
      sizeButtons.add(ProductSizeButton(size: sizes[i]));
    }
    final productModel = Provider.of<ProductModel>(context, listen: false);
    productModel.initSize(sizes.first);
    return Padding(
      //padding: EdgeInsets.symmetric( horizontal: 30, vertical: 40),
      padding: EdgeInsets.only(left: 30, right: 30, top: 40),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: sizeButtons),
    );
  }
}

class ProductSizeButton extends StatefulWidget {
  final String size;

  const ProductSizeButton({required this.size});

  @override
  _ProductSizeButtonState createState() => _ProductSizeButtonState();
}

class _ProductSizeButtonState extends State<ProductSizeButton> {
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);

    return GestureDetector(
      onTap: () {
        final productModel = Provider.of<ProductModel>(context, listen: false);
        productModel.size = this.widget.size;
      },
      child: Container(
        alignment: Alignment.center,
        child: Text('${widget.size}',
            style: TextStyle(
                color: (this.widget.size == productModel.size)
                    ? Colors.white
                    : Palette.onPrimary,
                fontSize: 16,
                fontWeight: FontWeight.bold)),
        width: 45,
        height: 45,
        decoration: BoxDecoration(
            color: (this.widget.size == productModel.size)
                ? Palette.onPrimary
                : Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                  color: this.widget.size == productModel.size
                      ? Palette.onPrimary
                      : Colors.grey[400]!,
                  blurRadius: 10,
                  offset: Offset(0, 5))
            ]),
      ),
    );
  }
}
