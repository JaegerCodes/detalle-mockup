import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:buscape/src/models/product_model.dart';

class ProductIcon extends StatelessWidget {
  final double size;
  final bool fullPage;
  final String tag;
  final String? url;

  ProductIcon(
      {this.size = 0.0,
      this.fullPage = false,
      required this.tag,
      required this.url});
  @override
  Widget build(BuildContext context) {
    final productModel = Provider.of<ProductModel>(context);
    return Hero(
        tag: tag,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: this.fullPage
                    ? BorderRadius.only(
                        bottomLeft: Radius.circular(40),
                        bottomRight: Radius.circular(40),
                        topLeft: Radius.circular(0),
                        topRight: Radius.circular(0))
                    : BorderRadius.circular(size / 4)),
            padding: EdgeInsets.all(this.fullPage ? 20 : size / 8),
            child: Stack(
              children: <Widget> [
                onFullPage(productModel)
              ],
            )));
  }

  Widget onFullPage(ProductModel productModel) {
    Widget clothe = url == null
    ? Image(
        image: AssetImage(productModel.assetImage),
        width: this.fullPage ? null : size,
        height: this.fullPage ? null : size,
    )
    : Image.network(
        url!,
        width: this.fullPage ? null : size,
        height: this.fullPage ? null : size,
    );

    Widget whenFullPage = clothe;

    if (this.fullPage) {

      List<Widget> clothes = <Widget>[];

      for (var i = 0; i < productModel.presentation.imageUrls.length; ++i) {
          clothes.add(
            Image.network(
              productModel.presentation.imageUrls[i],
              width: this.fullPage ? null : size,
              height: this.fullPage ? null : size,
            )
          );
      } 


      whenFullPage = CarouselClothes(clothes: clothes,);
    
    
    
    }
    return whenFullPage;
  }
}

class CarouselClothes extends StatefulWidget {

  final List<Widget>? clothes;


  CarouselClothes({Key? key, required this.clothes}) : super(key: key);

  @override
  _CarouselClothesState createState() => _CarouselClothesState();
}

class _CarouselClothesState extends State<CarouselClothes> {
  CarouselController buttonCarouselController = CarouselController();

 @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      CarouselSlider(
        items: widget.clothes,
        carouselController: buttonCarouselController,
        options: CarouselOptions(
          autoPlay: false,
          enlargeCenterPage: true,
          viewportFraction: 0.9,
          aspectRatio: 1.0,
          initialPage: 0,
          enableInfiniteScroll: false
        ),
      ),
      ElevatedButton(
        onPressed: () => buttonCarouselController.nextPage(
            duration: Duration(milliseconds: 300), curve: Curves.linear),
        child: Text('→'),
      )
    ]
  );
}
