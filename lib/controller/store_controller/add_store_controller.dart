import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class AddStoreController with ChangeNotifier {
  void addWarehouse(
      {required String name,
      required String description,
      required String unit,
      required BuildContext context}) async {
    await FirebaseFirestore.instance.collection('warehouses').doc(name).set({
      'balance': 0,
      'description': description,
      'unit': unit,
      'name': name,
      'date': DateTime.now().toIso8601String().toString()
    });
    notifyListeners();
  }
}
