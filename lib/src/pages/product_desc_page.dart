import 'package:animate_do/animate_do.dart';
import 'package:buscape/src/helpers/palette.dart';
import 'package:buscape/src/models/product_model.dart';
import 'package:buscape/src/models/product_response.dart';
import 'package:buscape/src/services/notifications_service.dart';
import 'package:buscape/src/widgets/button_themed.dart';
import 'package:buscape/src/widgets/colors_and_more.dart';
import 'package:buscape/src/widgets/oeschle_app_bar.dart';
import 'package:buscape/src/widgets/product_description.dart';
import 'package:buscape/src/widgets/product_icon.dart';
import 'package:buscape/src/widgets/product_size_list.dart';
import 'package:flutter/material.dart';
import 'package:buscape/src/helpers/helpers.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductDescPage extends StatefulWidget {
  final String tag;
  final Item data;

  const ProductDescPage({required this.tag, required this.data});

  @override
  ProductDescPageState createState() => ProductDescPageState();
}

class ProductDescPageState extends State<ProductDescPage> {
  int presentationIndex = 0;

  static const platform = const MethodChannel("archannel");

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();

    /**
     * final productModel = Provider.of<ProductModel>(context, listen: false);
          productModel.assetImage = this.urlImagen;
          productModel.color = this.color;
     */
    final productModel = Provider.of<ProductModel>(context, listen: false);
    productModel.data = widget.data;

    return Scaffold(
        body: Column(
      children: <Widget>[
        OeschleAppBar(
          title: "Detalle del producto",
        ),
        Expanded(
            child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Container(
                  height: 250,
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: widget
                        .data.presentations[presentationIndex].imageUrls.length,
                    itemBuilder: (BuildContext context, int index) => Card(
                      child: Image.network(
                          widget.data.presentations[presentationIndex]
                              .imageUrls[index],
                          fit: BoxFit.contain,
                          width: 300),
                    ),
                  )),
              GestureDetector(
                  onTap: () async {
                    await platform.invokeMethod("startAR");
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Palette.onPrimary,
                    ),
                    child: Text(
                      'Probármelo!',
                      style: TextStyle(color: Colors.white),
                    ),
                  )),
              ProductDescription(
                titulo: widget.data.productName,
                descripcion: "",
              ),
              _AmountBuyNow(widget.data.minPurchaseAmount),
              ColorsAndMore(
                  presentations: widget.data.presentations,
                  callback: (index) {
                    setState(() {
                      this.presentationIndex = index;
                    });
                  }),
              ProductSizeList(presentations: widget.data.presentations),
              _ButtonsLikeCartSettings()
            ],
          ),
        ))
      ],
    ));
  }
}

class _ButtonsLikeCartSettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 30),
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _BotonSombreado(Icon(Icons.star, color: Colors.red, size: 25)),
          _BotonSombreado(Icon(Icons.add_shopping_cart,
              color: Colors.grey.withOpacity(0.4), size: 25)),
          _BotonSombreado(Icon(Icons.settings,
              color: Colors.grey.withOpacity(0.4), size: 25)),
        ],
      ),
    );
  }
}

class _BotonSombreado extends StatelessWidget {
  final Icon icon;

  const _BotonSombreado(this.icon);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: this.icon,
      width: 55,
      height: 55,
      decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                spreadRadius: -5,
                blurRadius: 20,
                offset: Offset(0, 10))
          ]),
    );
  }
}

class _AmountBuyNow extends StatelessWidget {
  final double amount;
  const _AmountBuyNow(this.amount);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        margin: EdgeInsets.only(top: 20, bottom: 20),
        child: Row(
          children: <Widget>[
            Text('Desde S/.' + amount.toStringAsFixed(2),
                style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)),
            Spacer(),
            Bounce(
                delay: Duration(seconds: 1),
                from: 8,
                child: ButtonThemed(texto: 'Comprar', ancho: 120, alto: 40))
          ],
        ),
      ),
    );
  }
}
