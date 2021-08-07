import 'package:buscape/src/widgets/agregar_carrito.dart';
import 'package:buscape/src/widgets/custom_appbar.dart';
import 'package:buscape/src/widgets/zapato_desc.dart';
import 'package:buscape/src/widgets/zapato_size.dart';
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
          CustomAppBar( texto: '' , readonly: true,),
          SizedBox( height: 20),

          Expanded(
            child: SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: <Widget>[

                    ProductCardItem(tag: 'zapato-1', title: 'Nike Air Max 720',),
                    ProductCardItem(tag: 'zapato-2', title: 'Nike Air Max 721',),

                ],
              ),
            )
          ),

          AgregarCarritoBoton( monto: 180.0 )

        ],
      ),
   );
  }
}

class ProductCardItem extends StatelessWidget {

  final String? tag;
  final String? title;
  //final String? description;

  const ProductCardItem({
    Key? key, required this.tag, required this.title,
  }) : super(key: key);
  // 'zapato-1'
  // 'title' 'Nike Air Max 720'
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Hero(
          tag: tag!,
          child: ZapatoSizePreview()
        ),

        ZapatoDescripcion(
          titulo: title!,
          descripcion: "",
        ),
      ],
    );
  }
}