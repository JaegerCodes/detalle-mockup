import 'package:buscape/src/api/BuscapeApi.dart';
import 'package:buscape/src/models/product_response.dart';
import 'package:buscape/src/widgets/add_to_cart.dart';
import 'package:buscape/src/widgets/custom_appbar.dart';
import 'package:buscape/src/widgets/oeschle_app_bar.dart';
import 'package:buscape/src/widgets/product_list_item.dart';
import 'package:flutter/material.dart';
import 'package:buscape/src/helpers/helpers.dart';

class ProductPage extends StatefulWidget {
  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<Item> products = [];

  getProducts({String searchWord = 'chompa de mujer'}) async {
    final resp =
        await BuscapeApi.httpGet('/products/catalog?searchWord=$searchWord');
    final productsResp = ProductsResponse.fromMap(resp);

    //this.products = [...categoriesResp.categorias];
    setState(() {
      this.products = productsResp.itemList;
    });
  }

  @override
  void initState() {
    super.initState();
    getProducts();
  }

  @override
  Widget build(BuildContext context) {
    cambiarStatusDark();
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
                children: this
                    .products
                    .map((product) => ProductListItem(
                          tag: product.productId.toString(),
                          data: product,
                        ))
                    .toList()),
          )),
          AddCartButton(monto: 0.0)
        ],
      ),
    );
  }
}
