// import 'package:daftarbelanja/component/dashboard.dart';
import 'package:flutter/material.dart';

import './component/dashboard.dart';
import './component/product_list.dart';
import './component/add_newitem.dart';
import './model/cart.dart';
import 'component/product_list.dart';
import 'model/cart.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "daftarnbelanja",
      theme: ThemeData(
          primarySwatch: Colors.blue,
          accentColor: Colors.blue,
          textTheme: ThemeData.light().textTheme.copyWith(
              title: TextStyle(fontSize: 15, fontWeight: FontWeight.bold))),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<Cart> _carts = [
    Cart(id: 'FL1', title: 'Sabun Mandi', harga: 15000, qty: 1),
    Cart(id: 'FL1', title: 'Shampoo', harga: 17000, qty: 2),
  ];

  void _openModal(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (_) {
          return AddNewItem(_addNewItem);
        });
  }

  void _addNewItem(String title, double harga, int qty) {
    final newItem = Cart(id: DateTime.now().toString(), title: title, harga: harga, qty: qty);
    setState(() {
      _carts.add(newItem);
    });
  }

  void _resetCarts() {
    setState(() {
      _carts.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Daftar Belanjaan"),
        actions: <Widget>[
          FlatButton(child: Icon(Icons.clear, color: Colors.white,), onPressed: () => _resetCarts(),)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Dashboard(_carts),
            ProductList(_carts),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => _openModal(context),
      ),
    );
  }
}