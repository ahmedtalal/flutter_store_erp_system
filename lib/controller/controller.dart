import 'package:erb_system/view/category/add_cat.dart';
import 'package:erb_system/view/category/add_nyotin.dart';
import 'package:erb_system/view/category/category.dart';
import 'package:erb_system/view/category/nyotins.dart';
import 'package:erb_system/view/category/production.dart';
import 'package:erb_system/view/home/taps/home_tap.dart';
import 'package:erb_system/view/industry/add_desc_industry.dart';
import 'package:erb_system/view/industry/confirm_indus.dart';
import 'package:erb_system/view/industry/indus_orders.dart';
import 'package:erb_system/view/industry/industry_desc.dart';
import 'package:erb_system/view/industry/spechial_add_indus.dart';
import 'package:erb_system/view/orders/account_statement.dart';
import 'package:erb_system/view/orders/add_orders.dart';
import 'package:erb_system/view/orders/collection_order_details.dart';
import 'package:erb_system/view/orders/companies_representatives.dart';
import 'package:erb_system/view/orders/confirm_order.dart';
import 'package:erb_system/view/orders/load_order.dart';
import 'package:erb_system/view/orders/order_maintenance.dart';
import 'package:erb_system/view/orders/orders_details.dart';
import 'package:erb_system/view/purchases/add_purchase_bill.dart';
import 'package:erb_system/view/purchases/confirm_back_purchase.dart';
import 'package:erb_system/view/purchases/confirm_purchase.dart';
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
  Widget current = HomeTap();
//
  List screen = [
    ['/addStore',  '/Stores', '/Stores_transfer'],

    [
      '/AddSup',
      '/add_cat_sup',
      '/sup_cat',
      '/suppliers',
    ],
    [
      '/addcat',
      '/Categories',
      '/AddNyotin',
      '/Nyotins',
      '/Production'
    ],
    [ '/add_purchase_bill',  '/purchases', '/confirm_back_purchase'],
    [
      '/AddDescIndustry',
      '/IndustryDesc',
      '/ConfirmIndus',
      '/IndustryOrder',
      '/IndustrySpecialAddition',
    ],
    [
      '/AddOrderv',
      '/Talabat',
    ]
  ];

  void changePage(Widget page) {
    current = page;
    notifyListeners();
  }
}
