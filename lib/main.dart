import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/controller/store_controller/add_store_controller.dart';
import 'package:erb_system/routes/routes.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => Controller()),
        ChangeNotifierProvider(create: (context) => AddStoreController()),
      ],
      child: Builder(builder: (context) {
        return MaterialApp.router(
          routeInformationParser: const QRouteInformationParser(),
          routerDelegate: QRouterDelegate(Routes.routes),
          debugShowCheckedModeBanner: false,
          locale: const Locale('ar', 'eg'),
          title: 'ERB System',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          // home: TransferTreasury(),
        );
      }),
    );
  }
}
