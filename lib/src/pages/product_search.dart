import 'package:buscape/src/widgets/agregar_carrito.dart';
import 'package:buscape/src/widgets/custom_appbar.dart';
import 'package:buscape/src/widgets/product_list_item.dart';
import 'package:buscape/src/widgets/product_description.dart';
import 'package:buscape/src/widgets/product_size.dart';
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
          CustomAppBar( texto: '' , readonly: false,),
          SizedBox( height: 20),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[
                  ProductListItem(),
                  ProductListItem(),
                  ProductListItem(),
                  ProductListItem(),
                  ProductListItem(),
                  ProductListItem(),
                  ProductListItem(),
                  ProductListItem(),
                  ProductListItem(),
                ],
              ),
            )
          ),
        ],
      ),
   );
  }
}