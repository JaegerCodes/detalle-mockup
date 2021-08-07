import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buscape/src/models/zapato_model.dart';
import 'package:buscape/src/pages/product_desc_page.dart';



class ProductSizePreview extends StatelessWidget {
  
  final bool fullScreen;

  ProductSizePreview({ 
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
          horizontal: (this.fullScreen) ? 5: 30,
          vertical: (this.fullScreen) ? 5: 0,
        ),
        child: Container(
          width: double.infinity,
          // height: (this.fullScreen) ? 410 : 430,
          decoration: BoxDecoration(
            color: Color(0xffFFCF53),
            borderRadius: 
                (!this.fullScreen) 
                  ? BorderRadius.circular(50)
                  : BorderRadius.only( bottomLeft: Radius.circular(50),
                                       bottomRight: Radius.circular(50),
                                       topLeft: Radius.circular(40),
                                       topRight: Radius.circular(40))
          ),
          child: _ZapatoConSombra(),
        ),
      ),
    );
  }
}

class _ZapatoConSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final zapatoModel = Provider.of<ZapatoModel>(context);

    return Padding(
      padding: EdgeInsets.all(50),
      child: Stack(
        children: <Widget>[
          Positioned(
            bottom: 20,
            right: 0,
            child: _ZapatoSombra()
          ),
          Image( image: AssetImage( zapatoModel.assetImage ), )
        ],
      ),
    );
  }
}

class _ZapatoSombra extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: -0.5,
      child: Container(
        width: 230,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow( color: Color(0xffEAA14E), blurRadius: 40 )
          ]
        ),
      ),
    );
  }
}