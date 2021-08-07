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
                url == null
                ? Image(
                    image: AssetImage(productModel.assetImage),
                    width: this.fullPage ? null : size,
                    height: this.fullPage ? null : size,
                )
                : Image.network(
                    url!,
                    width: this.fullPage ? null : size,
                    height: this.fullPage ? null : size,
                )
              ],
            )));
  }

  Widget onFullPage(ProductModel productModel) {
    Widget singleImage = url == null
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

    List<Widget> clothes = <Widget>[];

    for (var i = 0; i < productModel.presentation.imageUrls.length; ++i) {
      String currentUrl = productModel.presentation.imageUrls[i];
      Widget currentWidget = Image.network(
          currentUrl,
          width: this.fullPage ? null : size,
          height: this.fullPage ? null : size,
      );
      clothes.add(currentWidget);
    }
    

    return fullPage? CarouselClothes(clothes) : singleImage;
  }
}

class CarouselClothes extends StatefulWidget {
  final List<Widget> clothes;
  CarouselClothes(this.clothes);

  @override
  _CarouselClothesState createState() => _CarouselClothesState();
}

class _CarouselClothesState extends State<CarouselClothes> {
  CarouselController buttonCarouselController = CarouselController();

 @override
  Widget build(BuildContext context) {
    
    return Column(
      children: <Widget>[
        CarouselSlider(
          items: widget.clothes,
          carouselController: buttonCarouselController,
          options: CarouselOptions(
            autoPlay: false,
            enlargeCenterPage: true,
            viewportFraction: 0.9,
            initialPage: 0,
            enableInfiniteScroll: false,
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
}
