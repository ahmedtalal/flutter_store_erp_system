import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Controller(),
      child: MaterialApp.router(
        routeInformationParser: const QRouteInformationParser(),
        routerDelegate: QRouterDelegate(Routes.routes),
        debugShowCheckedModeBanner: false,
        locale: const Locale('ar', 'eg'),
        title: 'ERB System',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // home: TransferTreasury(),
      ),
    );
  }
}
