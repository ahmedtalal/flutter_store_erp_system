import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import 'components/deafult_dorp_down.dart';

class DropDownList extends StatelessWidget {
  DropDownList({Key? key}) : super(key: key);

  List<String> title = [
    'الرئيسه',
    'المخازن',
    'الموردين',
    'اداره الاصناف',
    'المشتريات',
    'التصنيع',
    'اداره الشحن',
    'التقارير',
    'الحسابات',
    'اداره النظام',
    'HR',
    'الايصالات و الاذونات',
  ];
  List<String> image = [
    ImageAssets.iconDropDown2,
    ImageAssets.iconDropDown3,
    ImageAssets.iconDropDown4,
    ImageAssets.iconDropDown5,
    ImageAssets.iconDropDown7,
    ImageAssets.iconDropDown8,
    ImageAssets.iconDropDown9,
    ImageAssets.iconDropDown10,
    ImageAssets.iconDropDown11,
    ImageAssets.iconDropDown12,
    ImageAssets.iconDropDown13,
    ImageAssets.iconDropDown14,
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => DefaultDropDown(
        item: const [],
        title: title[index],
        imageUrl: image[index],
      ),
      itemCount: 12,
    );
  }
}
