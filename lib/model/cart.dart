//models
import 'package:flutter/foundation.dart';

class Cart{
  //deklarasi variabel
  final String id;
  final String title;
  final double harga;
  final int qty;
  //buat constructor dimana secara default class ini akan meminta data
  Cart({
    @required this.id,
    @required this.title,
    @required this.harga,
    @required this.qty,
  });
}