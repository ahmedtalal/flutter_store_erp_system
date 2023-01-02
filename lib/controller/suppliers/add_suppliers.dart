import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddSuppliersController with ChangeNotifier {
  void addSupplier(String address, String category, String name,
      String phonenumber, double pricerate, double supplierrate) async {
    await FirebaseFirestore.instance.collection('suppliers').add({
      'address': "",
      'balance': 0,
      'category': category,
      'name': name,
      "phonenumber": phonenumber,
      "pricerate": pricerate,
      "supplierrate": supplierrate,
      'date': DateTime.now().toIso8601String().toString()
    }).then((value) {
      print(value.id);
    });
  }
}
