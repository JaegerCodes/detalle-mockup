import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buscape/src/models/zapato_model.dart';
import 'package:buscape/src/pages/product_desc_page.dart';



class ProductListItem extends StatelessWidget {
  
  final bool fullScreen;

  ProductListItem({ 
    this.fullScreen = false
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        if ( !this.fullScreen ) {
          Navigator.push(context,  MaterialPageRoute(builder: (BuildContext context) => ProductDescPage() ) );
        }
      },
      child: Padding(
        padding: EdgeInsets.symmetric( 
          horizontal: 25,
          vertical: 5,
        ),
        child: Row(children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xffFFCF53),
              borderRadius: BorderRadius.circular(20)
            ),
            child: _ZapatoConSombra(),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child:Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text("Zapatilla Nike"),
              Text("Desde S/ 10"),
            ]),
          ),
        ],),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(10),
      child: Stack(
        children: <Widget>[
          Image( image: AssetImage( zapatoModel.assetImage ), width: 80, height: 80, )
        ],
      ),
    );
  }
}