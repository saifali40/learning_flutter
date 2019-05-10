import 'package:flutter/material.dart';

class Product extends StatelessWidget {
  final List<Map<String, dynamic>> products;
  
  Product(this.products) {
    print('[Product Widget] constructor');
  }

  @override
  Widget build(BuildContext context) {
    return _buildProductList();
  }

  Widget _buildProductList() {
    Widget productCards = Center(
      child: Text('no prodct found add some '),
    );
    if (products.length > 0) {
      productCards = ListView.builder(
          itemBuilder: _buildProductItem, itemCount: products.length);
    }
    return productCards;
  }

  Widget _buildProductItem(BuildContext context, int index) {
    return Card(
      child: Column(
        children: <Widget>[
          Text(products[index]['title']),
          Text(products[index]['description']),
          Image.asset(products[index]['image']),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                child: Text('details'),
                onPressed: () => Navigator.pushNamed<bool>(context, '/product/'+index.toString()),
              )
            ],
          )
        ],
      ),
    );
  }
}
