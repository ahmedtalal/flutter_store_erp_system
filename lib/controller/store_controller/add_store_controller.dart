import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core_web/firebase_core_web_interop.dart';
import 'package:flutter/material.dart';

class AddStoreController with ChangeNotifier {
  List storeData = [];
  List rowMaterial = [];
  Map<String, dynamic>? storeModel;
  Map<String, dynamic>? storeTypeModel;

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

  Future getStoreDetails() async {
    await FirebaseFirestore.instance
        .collection('warehouses')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        storeData.add(element.data());
      });
    });
    print(storeData);
    notifyListeners();
  }

  getRowMaterials(String type) async {
    rowMaterial.clear();
    await FirebaseFirestore.instance
        .collection('warehouses')
        .doc(type)
        .collection('Materials')
        .get()
        .then((value) {
      value.docs.forEach((element) {
        rowMaterial.add(element.data());
      });
    });
    notifyListeners();
  }

  // my code here ????????????????????
  _getStoreDateFromMaterialcoll(String storeName) async {
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection("Materials")
        .doc(storeName)
        .collection("Reports")
        .doc("yDEw1rNzGXmai1shvpQ6")
        .get();

    storeModel = documentSnapshot.data() as Map<String, dynamic>;
    notifyListeners();
  }

  getStoreTypeModel(String storeName) async {
    Map<String, dynamic> model = await _getStoreDateFromMaterialcoll(storeName);
    DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
        .collection(model["type"])
        .doc(model["id"])
        .collection("rawmaterials")
        .doc(storeName)
        .get();
    storeTypeModel = documentSnapshot.data() as Map<String, dynamic>;
    notifyListeners();
  }
}
