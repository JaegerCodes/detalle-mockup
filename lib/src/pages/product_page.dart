import 'package:buscape/src/widgets/agregar_carrito.dart';
import 'package:buscape/src/widgets/custom_appbar.dart';
import 'package:buscape/src/widgets/product_description.dart';
import 'package:buscape/src/widgets/product_icon.dart';
import 'package:buscape/src/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:buscape/src/helpers/helpers.dart';

class ProductPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();

    return Scaffold(
      // body: CustomAppBar( texto: 'For you' )
      // body: ZapatoSizePreview(),
      body: Column(
        children: <Widget>[
          CustomAppBar(
            texto: '',
            readonly: true,
          ),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                ProductListItem(
                  tag: 'zapato-1',
                  title: 'Nike Air Max 720',
                ),
                ProductListItem(
                  tag: 'zapato-2',
                  title: 'Nike Air Max 721',
                ),
              ],
            ),
          )),
          AgregarCarritoBoton(monto: 180.0)
        ],
      ),
    );
  }
}
