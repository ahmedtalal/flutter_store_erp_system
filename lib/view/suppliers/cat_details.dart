import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:flutter/material.dart';

class CatDetails extends StatelessWidget {
  CatDetails({Key? key}) : super(key: key);
  List data = [
    {
      "1": "اسلام",
      "2": "1115156",
      "3": "022",
      "4": "100",
      "5": "مرتفع",
    },
    {
      "1": "اسلام",
      "2": "1115156",
      "3": "022",
      "4": "100",
      "5": "مرتفع",
    },
  ];

  List<String> columnData = [
    "تقييم السعر",
    "تقييم المورد",
    "العنوان",
    "رقم الهاتف",
    "اسم المورد",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            DefaultContainer(title: 'تفاصيل موردين القماش'),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DefaultTable(
                  columnData: columnData,
                  size: getProportionateScreenWidth(10),
                  color: ColorManager.second,
                  rows: data
                      .map((data) => DataRow(cells: [
                    DataCell(Text(
                      data['5'],
                    )),
                            DataCell(Text(
                              data['4'],
                            )),
                            DataCell(Text(
                              data['3'],
                            )),
                            DataCell(Text(
                              data['2'],
                            )),
                            DataCell(Text(
                              data['1'],
                            )),
                          ]))
                      .toList(),
                ),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
