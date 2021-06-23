import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Listproducts extends StatefulWidget {
  @override
  _ListproductsState createState() => _ListproductsState();
}

class _ListproductsState extends State<Listproducts> {
  @override
  Widget build(BuildContext context) {
    return Card(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        elevation: 3.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Expanded(
              flex: 4,
              child: Image.asset(
                "assets/product.jpg",
                height: MediaQuery.of(context).size.height / 2,
              ),
            ),
            Expanded(
              flex: 2,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Ariana Grande Ari Eau de Parfum Spray for Women, 3.4 Fl Oz",
                    maxLines: 2,
                  ),
                  Text(
                    "\u{20A6}18,000",
                    maxLines: 2,
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
