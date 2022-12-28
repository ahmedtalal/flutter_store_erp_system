import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/view/auth/login.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/taps/home_tap.dart';
import 'package:erb_system/view/store/PO_fiper.dart';
import 'package:erb_system/view/store/add_store.dart';
import 'package:erb_system/view/store/d1_fiper.dart';
import 'package:erb_system/view/store/d_fiper.dart';
import 'package:erb_system/view/store/fiber_details.dart';
import 'package:erb_system/view/store/mo4_details.dart';
import 'package:erb_system/view/store/mo_fiber.dart';
import 'package:erb_system/view/store/po1_details.dart';
import 'package:erb_system/view/store/store_dtails.dart';
import 'package:erb_system/view/store/stores.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../resources/color_manger.dart';
import 'drop_down_par.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Consumer<Controller>(
            builder: (context, value, child) {
              return Expanded(
                  flex: 5,
                  child: Stack(
                    children: [value.current, DefaultAppBar()],
                  ));
            },
          ),
          Expanded(
              flex: 1,
              child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                  ),
                  child: DropDownList())),
        ],
      ),
    );
  }
}
