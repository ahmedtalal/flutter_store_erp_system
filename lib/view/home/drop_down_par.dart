import 'package:flutter/material.dart';

import '../../resources/assets_manager.dart';
import 'components/deafult_dorp_down.dart';

class DropDownList extends StatelessWidget {
  DropDownList({Key? key}) : super(key: key);

  List<String> title = [
    'الرئيسيه',
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
  List taps = [
    [''],
    ['اضافه مخزن ', 'المخازن', ' تحويلات بين المخازن'],
    ['اضافه مورد ', 'اضافه فئه الموردين', 'فئات الموردين', "الموردين"],
    [
      'اضافه صنف ',
      'الاصناف',
      'اضافه وحده القياس',
      "وحدات القياس",
      "فروع الانتاج"
    ],
    ['اضافه فاتوره مشتريات ', 'فواتير المشتريات', 'مرتجعات المشتريات'],
    [
      'اضافه وصفه ',
      'وصفات التصنيع',
      "تأكيد امر التصنيع",
      "اوامر التصنيع",
      "الاضافات الخاصه"
    ],
    [
      'اضافه طلب ',
      'الطلبات',
      "شركات الشحن و المندوبين",
      "فئات المنتجات المطلوبه",
      "مصادر الطلبات",
      "طرق الشحن",
      "خطوط الشحن"
    ],
    [''],
    [''],
    [''],
    [''],
    [''],
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(
        height: 10,
      ),
      itemBuilder: (context, index) => DefaultDropDown(
        item: index == 0 ? [] : taps[index],
        title: title[index],
        imageUrl: image[index],
        leading: index == 0 ? Container(width: 10,): Image.asset("assets/images/15.png"),
        trailing: Image.asset(image[index]),
        index: index,
      ),
      itemCount: 12,
    );
  }
}
