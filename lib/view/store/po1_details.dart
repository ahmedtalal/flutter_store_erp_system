import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/store/PO_fiper.dart';
import 'package:flutter/material.dart';

class PO1Details extends StatelessWidget {
  PO1Details({Key? key}) : super(key: key);
  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "اسلام",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "خزينة المنصع",
      "9": "موظف احمد",
    },
  ];

  List<String> columnData = [
    "الموظف المسؤل",
    "الخزينة",
    "التكلفة االجمالية",
    "تكلفة الوحدة",
    "وحدة القياس",
    "الكمية",
    " اسم المورد",
    "الحركة",
    "التاريخ",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style=TextStyle(fontSize: getProportionateScreenWidth(5));
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
            DefaultContainer(title: 'تفاصيل PO1'),
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
                              data['9'],style: style,
                            )),
                            DataCell(Text(
                              data['8'],style: style,
                            )),
                            DataCell(Text(
                              data['7'],style: style,
                            )),
                            DataCell(Text(
                              data['6'],style: style,
                            )),
                            DataCell(Text(
                              data['5'],style: style,
                            )),
                            DataCell(Text(
                              data['4'],style: style,
                            )),
                            DataCell(Text(
                              data['3'],style: style,
                            )),
                            DataCell(Text(
                              data['2'],style: style,
                            )),
                            DataCell(Text(
                              data['1'],style: style,
                            )),
                          ]))
                      .toList(),
                ),
              ],
            ),
            POFiper()
          ],
        ),
      ),
    ));
  }
}
