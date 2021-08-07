import 'package:buscape/src/widgets/custom_appbar.dart';
import 'package:buscape/src/widgets/oeschle_app_bar.dart';
import 'package:buscape/src/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:buscape/src/helpers/helpers.dart';

class ProductSearch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();

    return Scaffold(
      // body: CustomAppBar( texto: 'For you' )
      // body: ZapatoSizePreview(),
      body: Column(
        children: <Widget>[
          OeschleAppBar(title: "Búsqueda de producto"),
          SearchBar(
            texto: '',
            readonly: false,
          ),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                ProductListItem(tag: "1"),
                ProductListItem(tag: "2"),
                ProductListItem(tag: "3"),
                ProductListItem(tag: "4"),
                ProductListItem(tag: "5"),
                ProductListItem(tag: "6"),
                ProductListItem(tag: "7"),
                ProductListItem(tag: "8"),
                ProductListItem(tag: "9"),
              ],
            ),
          )),
        ],
      ),
    );
  }
}
