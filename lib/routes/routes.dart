
import 'package:erb_system/routes/deferred_loader.dart';
import 'package:erb_system/view/home/homepage.dart';
import 'package:erb_system/view/store/add_store.dart' deferred as store;
import 'package:erb_system/view/store/stores.dart' deferred as stores;
import 'package:erb_system/view/store/store_transfer/store_transfer.dart' deferred as Stores_transfer;
import 'package:erb_system/view/suppliers/add_sup.dart' deferred as AddSup;
import 'package:erb_system/view/suppliers/add_cat_sup.dart' deferred as add_cat_sup;
import 'package:erb_system/view/suppliers/sup_cat.dart' deferred as sup_cat;
import 'package:erb_system/view/suppliers/suppliers.dart' deferred as suppliers;
import 'package:erb_system/view/purchases/add_purchase_bill.dart' deferred as add_purchase_bill;
import 'package:erb_system/view/purchases/purchases.dart' deferred as purchases;
import 'package:erb_system/view/purchases/confirm_back_purchase.dart' deferred as confirm_back_purchase;
import 'package:erb_system/view/category/add_cat.dart'deferred as Addcat;
import 'package:erb_system/view/category/category.dart'deferred as Categories;
import 'package:erb_system/view/category/add_nyotin.dart'deferred as AddNyotin;
import 'package:erb_system/view/category/nyotins.dart'deferred as Nyotins;
import 'package:erb_system/view/category/production.dart'deferred as Production;
import 'package:erb_system/view/industry/add_desc_industry.dart'deferred as AddDescIndustry;
import 'package:erb_system/view/industry/industry_desc.dart'deferred as IndustryDesc;
import 'package:erb_system/view/industry/confirm_indus.dart'deferred as ConfirmIndus;
import 'package:erb_system/view/industry/indus_orders.dart'deferred as IndustryOrder;
import 'package:erb_system/view/industry/spechial_add_indus.dart'deferred as IndustrySpecialAddition;

import 'package:qlevar_router/qlevar_router.dart';
//updated
class Routes {
  static final routes = <QRoute>[
    QRoute(path: '/', builder: () => const HomePage()),

    // route Store
    QRoute(
      path: '/addStore',
      builder: () =>  store.add_Stock(),
      middleware: [
        DefferedLoader(store.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Stores',
      builder: () => stores.Stock(),
      middleware: [
        DefferedLoader(stores.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Stores_transfer',
      builder: () => Stores_transfer.StoreTransfer(),
      middleware: [
        DefferedLoader(Stores_transfer.loadLibrary),
      ],
    ),

    //route supplier
    QRoute(
      path: '/AddSup',
      builder: () =>AddSup.AddSup(),
      middleware: [
        DefferedLoader(AddSup.loadLibrary),
      ],
    ),
    QRoute(
      path: '/sup_cat',
      builder: () =>sup_cat.SupCat(),
      middleware: [
        DefferedLoader(sup_cat.loadLibrary),
      ],
    ),
    QRoute(
      path: '/add_cat_sup',
      builder: () =>add_cat_sup.AddSupCat(),
      middleware: [
        DefferedLoader(add_cat_sup.loadLibrary),
      ],
    ),
    QRoute(
      path: '/suppliers',
      builder: () =>suppliers.Suppliers(),
      middleware: [
        DefferedLoader(suppliers.loadLibrary),
      ],
    ),

    // route category
    QRoute(
      path: '/addcat',
      builder: () =>Addcat.AddCat(),
      middleware: [
        DefferedLoader(Addcat.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Categories',
      builder: () =>Categories.Categories(),
      middleware: [
        DefferedLoader(Categories.loadLibrary),
      ],
    ),
    QRoute(
      path: '/AddNyotin',
      builder: () =>AddNyotin.AddNyotin(),
      middleware: [
        DefferedLoader(AddNyotin.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Nyotins',
      builder: () =>Nyotins.Nyotins(),
      middleware: [
        DefferedLoader(Nyotins.loadLibrary),
      ],
    ),
    QRoute(
      path: '/Production',
      builder: () =>Production.Production(),
      middleware: [
        DefferedLoader(Production.loadLibrary),
      ],
    ),


    //route purchases
    QRoute(
      path: '/add_purchase_bill',
      builder: () =>add_purchase_bill.AddPurchaseBill(),
      middleware: [
        DefferedLoader(add_purchase_bill.loadLibrary),
      ],
    ),
    QRoute(
      path: '/purchases',
      builder: () =>purchases.Purchases(),
      middleware: [
        DefferedLoader(purchases.loadLibrary),
      ],
    ),
    QRoute(
      path: '/confirm_back_purchase',
      builder: () =>confirm_back_purchase.ConfirmBackPurchases(),
      middleware: [
        DefferedLoader(confirm_back_purchase.loadLibrary),
      ],
    ),


    //industry
    QRoute(
      path: '/AddDescIndustry',
      builder: () =>AddDescIndustry.AddDescIndustry(),
      middleware: [
        DefferedLoader(AddDescIndustry.loadLibrary),
      ],
    ),
    QRoute(
      path: '/IndustryDesc',
      builder: () =>IndustryDesc.IndustryDesc(),
      middleware: [
        DefferedLoader(IndustryDesc.loadLibrary),
      ],
    ),
    QRoute(
      path: '/ConfirmIndus',
      builder: () =>ConfirmIndus.ConfirmIndus(),
      middleware: [
        DefferedLoader(ConfirmIndus.loadLibrary),
      ],
    ),
    QRoute(
      path: '/IndustryOrder',
      builder: () =>IndustryOrder.IndustryOrder(),
      middleware: [
        DefferedLoader(IndustryOrder.loadLibrary),
      ],
    ),
    QRoute(
      path: '/IndustrySpecialAddition',
      builder: () =>IndustrySpecialAddition.IndustrySpecialAddition(),
      middleware: [
        DefferedLoader(IndustrySpecialAddition.loadLibrary),
      ],
    ),

  ];
}
