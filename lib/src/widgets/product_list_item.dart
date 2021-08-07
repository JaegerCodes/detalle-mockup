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
                    Text("Zapatilla Nike"),
                    Text("Desde S/ 10"),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
