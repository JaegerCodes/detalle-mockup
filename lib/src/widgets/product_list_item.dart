import 'package:flutter/material.dart';
import 'package:buscape/src/pages/product_desc_page.dart';
import 'package:buscape/src/widgets/product_icon.dart';

class ProductListItem extends StatelessWidget {
  final String title;
  final String tag;

  ProductListItem({required this.tag, this.title = ""});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => ProductDescPage(tag: tag)));
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.transparent,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 25,
          vertical: 5,
        ),
        child: Row(
          children: [
            ProductIcon(
              tag: tag,
              size: 80,
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("NIKE"),
                    Text("Zapatilla Jordan"),
                    Text("Desde S/ 10"),
                    ColorPalette(),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}

class ColorPalette extends StatelessWidget {
  const ColorPalette({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 5),
        child: Row(
          children: [
            ColorPaletteButton(color: Color(0xff364D56)),
            ColorPaletteButton(color: Color(0xff2099F1)),
            ColorPaletteButton(color: Color(0xffFFAD29)),
            ColorPaletteButton(color: Color(0xffC6D642)),
          ],
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
