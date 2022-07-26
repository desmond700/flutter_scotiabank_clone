import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Helpers {
  static const Color appColor = Color.fromARGB(255, 221, 15, 0);

  static String toCurrency(double number) {
    final oCcy = NumberFormat("#,##0.00", "en_US");
    return oCcy.format(number);
  }
}