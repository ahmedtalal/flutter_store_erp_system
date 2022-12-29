
import 'package:erb_system/routes/deferred_loader.dart';
import 'package:erb_system/view/home/homepage.dart';
import 'package:erb_system/view/store/add_store.dart' deferred as store;
import 'package:erb_system/view/store/stores.dart' deferred as stores;
import 'package:erb_system/view/store/store_transfer/store_transfer.dart' deferred as Stores_transfer;
import 'package:erb_system/view/suppliers/add_sup.dart' deferred as AddSup;
import 'package:qlevar_router/qlevar_router.dart';

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
        DefferedLoader(stores.loadLibrary),
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

  ];
}
