import 'package:erb_system/view/home/taps/home_tap.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manger.dart';
import 'drop_down_par.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
           Expanded(flex: 3, child: HomeTap()),
          Expanded(
              flex: 1,
              child: Container(
                  decoration: BoxDecoration(
                    color: ColorManager.primary,
                  ),
                  child: DropDownList())),
        ],
      ),
    );
  }
}
