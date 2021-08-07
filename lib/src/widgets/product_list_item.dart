import 'package:buscape/src/models/product_response.dart';
import 'package:flutter/material.dart';
import 'package:buscape/src/pages/product_desc_page.dart';
import 'package:buscape/src/widgets/product_icon.dart';

class ProductListItem extends StatelessWidget {
  final String title;
  final String tag;
  final Item data;

  ProductListItem({required this.tag, this.title = "", required this.data});

  @override
  Widget build(BuildContext context) {
    print(tag);
    print(data.productName);
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    ProductDescPage(tag: tag, data: data)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 5,
        ),
        child: Row(
          children: [
            ProductIcon(
              tag: tag,
              size: 100,
              url: (data.presentations.length > 0 &&
                      data.presentations.first.imageUrls.length > 0)
                  ? data.presentations.first.imageUrls.first
                  : null,
            ),
            Expanded(
                child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(data.productName),
                    ColorPalette(presentations: data.presentations),
                  ]),
            )),
          ],
        ),
      ),
    );
  }
}

class ColorPalette extends StatelessWidget {
  final List<Presentation> presentations;
  const ColorPalette({
    Key? key,
    required this.presentations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Set<Color> colors = Set();
    presentations.forEach((element) {
      colors.add(element.color);
    });
    return Container(
        padding: EdgeInsets.only(top: 5),
        child: Wrap(
          children:
              colors.map((color) => ColorPaletteButton(color: color)).toList(),
        ));
  }
}

class ColorPaletteButton extends StatelessWidget {
  final Color color;
  const ColorPaletteButton({
    required this.color,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 30,
      height: 30,
      margin: EdgeInsets.only(right: 8),
      decoration: BoxDecoration(color: color, shape: BoxShape.circle),
    );
  }
}
