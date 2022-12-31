import 'package:erb_system/view/home/taps/home_tap.dart';
import 'package:flutter/cupertino.dart';

class Controller with ChangeNotifier {
  Widget current = HomeTap();
//
  List screen = [
    ['/addStore', '/Stores', '/Stores_transfer'],
    [
      '/AddSup',
      '/add_cat_sup',
      '/sup_cat',
      '/suppliers',
    ],
    ['/addcat', '/Categories', '/AddNyotin', '/Nyotins', '/Production'],
    ['/add_purchase_bill', '/purchases', '/confirm_back_purchase'],
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
      '/companies_representatives',
      '/required_list',
    ]
  ];

  void changePage(Widget page) {
    current = page;
    notifyListeners();
  }
}
