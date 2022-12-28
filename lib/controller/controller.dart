import 'package:erb_system/view/category/add_cat.dart';
import 'package:erb_system/view/category/add_nyotin.dart';
import 'package:erb_system/view/category/category.dart';
import 'package:erb_system/view/category/nyotins.dart';
import 'package:erb_system/view/category/production.dart';
import 'package:erb_system/view/home/taps/home_tap.dart';
import 'package:erb_system/view/purchases/add_purchase_bill.dart';
import 'package:erb_system/view/purchases/purchases.dart';
import 'package:erb_system/view/store/add_store.dart';
import 'package:erb_system/view/store/d1_fiper.dart';
import 'package:erb_system/view/store/fiber_details.dart';
import 'package:erb_system/view/store/mo4_details.dart';
import 'package:erb_system/view/store/mo_fiber.dart';
import 'package:erb_system/view/store/po1_details.dart';
import 'package:erb_system/view/store/store_dtails.dart';
import 'package:erb_system/view/store/store_transfer/balance_modification.dart';
import 'package:erb_system/view/store/store_transfer/damage_details_transfer.dart';
import 'package:erb_system/view/store/store_transfer/store_transfer.dart';
import 'package:erb_system/view/store/store_transfer/transfer_fiber_details.dart';

import 'package:erb_system/view/store/stores.dart';
import 'package:erb_system/view/suppliers/add_cat_sup.dart';
import 'package:erb_system/view/suppliers/add_sup.dart';
import 'package:erb_system/view/suppliers/sup_cat.dart';
import 'package:erb_system/view/suppliers/suppliers.dart';
import 'package:flutter/cupertino.dart';

class Controller with ChangeNotifier {
  Widget current =  HomeTap();

  List screen = [
    [const add_Stock(), Stock(), StoreTransfer()],
    [
      const AddSup(),
      const AddSupCat(),
      SupCat(),
      Suppliers(),
    ],
    [
      const AddCat(),
      const Categories(),
      const AddNyotin(),
      const Nyotins(),
      const Production()
    ]
  ];

  void changePage(Widget page) {
    current = page;
    notifyListeners();
  }
}
