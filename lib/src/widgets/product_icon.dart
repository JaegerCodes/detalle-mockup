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
            padding: EdgeInsets.all(this.fullPage ? 0 : size / 8),
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

  Widget buildCarrousel(ProductModel productModel) {
    
    return ImageSlider(imgList: productModel.presentation.imageUrls);
  }
}

class ImageSlider extends StatelessWidget {
  final List<String> imgList;

  const ImageSlider({Key? key, required this.imgList}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 15,
              itemBuilder: (BuildContext context, int index) => Card(
                    child: Center(child: Text('Dummy Card Text')),
                  ),
            ),
          );

    /*return Container(
      child: CarouselSlider(
      options: CarouselOptions(),
      items: imgList
          .map((item) => Container(
                child: Center(
                    child: Image.network(item, fit: BoxFit.contain, width: 100)
                  ),
              ))
          .toList(),
    ));*/
  }
}