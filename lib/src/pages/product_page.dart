import 'package:buscape/src/api/BuscapeApi.dart';
import 'package:buscape/src/models/product_response.dart';
import 'package:buscape/src/providers/product_provider.dart';
import 'package:buscape/src/widgets/add_to_cart.dart';
import 'package:buscape/src/widgets/custom_appbar.dart';
import 'package:buscape/src/widgets/oeschle_app_bar.dart';
import 'package:buscape/src/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:buscape/src/helpers/helpers.dart';
import 'package:provider/provider.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Item> products = [];

  getProducts({String searchWord = 'chompa de mujer'}) async {
    final resp = await BuscapeApi.httpGet('/products/catalog?searchWord=$searchWord');
    final productsResp = ProductsResponse.fromMap(resp);

    //this.products = [...categoriesResp.categorias];
    this.products = productsResp.body.hits.hits.first.source.items;
    setState(() {});
  }

  @override
    void initState() {
      super.initState();
      products = Provider.of<ProductsProvider>(context, listen: false).products??[];
    }

  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
    getProducts();
    return Scaffold(
      // body: CustomAppBar( texto: 'For you' )
      // body: ZapatoSizePreview(),
      body: Column(
        children: <Widget>[
          OeschleAppBar(isRoot: true, title: "Tienda Oeschle"),
          SearchBar(
            texto: '',
            readonly: true,
          ),
          SizedBox(height: 20),
          Expanded(
              child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>  [
                if( products.isNotEmpty ) 
                ...[
                  ProductListItem(
                  tag: 'zapato-1',
                  title: 'Nike Air Max 720',
                  ),
                  ProductListItem(
                    tag: 'zapato-2',
                    title: 'Nike Air Max 721',
                  ),
                ],
              ],
            ),
          )),
          AddCartButton(monto: 180.0)
        ],
      ),
    );
  }
}
