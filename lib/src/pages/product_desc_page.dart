import 'package:animate_do/animate_do.dart';
import 'package:buscape/src/api/BuscapeApi.dart';
import 'package:buscape/src/helpers/palette.dart';
import 'package:buscape/src/models/product_model.dart';
import 'package:buscape/src/models/product_response.dart';
import 'package:buscape/src/widgets/button_themed.dart';
import 'package:buscape/src/widgets/colors_and_more.dart';
import 'package:buscape/src/widgets/oeschle_app_bar.dart';
import 'package:buscape/src/widgets/product_description.dart';
import 'package:buscape/src/widgets/product_size_list.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:buscape/src/helpers/helpers.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ProductDescPage extends StatefulWidget {
  final String tag;
  final Item data;
  final bool fromOutfits;

  const ProductDescPage({required this.tag, required this.data, this.fromOutfits = false});

  @override
  ProductDescPageState createState() => ProductDescPageState();
}

class ProductDescPageState extends State<ProductDescPage> {
  int presentationIndex = 0;
  List<Presentation> outfits = [];
  Item? outfitContent;

  static const platform = const MethodChannel("archannel");

  getOutfits() async {
    if (!widget.fromOutfits && widget.data.outfitItems != null) {
      final id = widget.data.outfitItems!.first;
      final resp = await BuscapeApi.httpGet('/products/$id');
      if (resp.itemList.isNotEmpty) {
        outfitContent = resp.itemList.first;
        outfits = outfitContent!.presentations;
      }
      setState(() {});
      //final resp = await BuscapeApi.httpGet('/products/$id');
      /*final id = widget.data.outfitItems.first;
      final resp = await BuscapeApi.httpGet('/products/$id');
      if (resp.itemList.isNotEmpty) {
        outfitContent = resp.itemList.first;
        outfits = outfitContent!.presentations;
      }
      if (this.mounted) {
        setState(() {});
      }*/
        
    }
  }

  @override
  Widget build(BuildContext context) {
    cambiarStatusLight();
    getOutfits();

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
              buildCarrousel(widget.data.presentations),
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
                      'Pruébalo!',
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
              ProductSizeList(
                  presentations: widget.data.presentations,
                  index: presentationIndex),
              if (!widget.fromOutfits)
              ...[
                ProductDescription(
                  titulo: "Sugerencias",
                  descripcion: "",
                ),
                if (outfits.isNotEmpty)
                  buildOutFitCarrousel(outfits)
              ],
              _ButtonsLikeCartSettings()
            ],
          ),
        ))
      ],
    ));
  }

  Widget buildCarrousel(List<Presentation> presentations) {

    return presentations.isNotEmpty
    ? Container(
      height: 250,
      child: ListView.builder(
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        itemCount: presentations[presentationIndex].imageUrls.length,
        itemBuilder: (BuildContext context, int index) => Card(
          child: Image.network(
              presentations[presentationIndex].imageUrls[index],
              fit: BoxFit.contain,
              width: 300)
        ),
      ))
    : Container();
  }

  Widget buildOutFitCarrousel(List<Presentation> presentations) {
    print(presentations.first.imageUrls);
    if (presentations.isNotEmpty && presentations.first.imageUrls.isNotEmpty) {
      final slides = [
        for(int index = 0; index < presentations.first.imageUrls.length; index++)
          GestureDetector(
            onTap: () {
              if (outfitContent != null) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                  builder: (BuildContext context) =>
                      ProductDescPage(tag: outfitContent!.productId.toString()+"o", data: outfitContent!, fromOutfits: true,))
                );
              }
            },
            child: Image.network(
              presentations.first.imageUrls[index],
              fit: BoxFit.contain,
              width: 300),
          )
      ];
      return Slider(slides: slides);
    } else {
      return Container();
    }
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

class Slider extends StatelessWidget {
  final List<Widget> slides;

  const Slider({Key? key, required this.slides}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: slides,
      options: CarouselOptions(
          height: 250,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          scrollDirection: Axis.horizontal,
      )
    );
  }
}
