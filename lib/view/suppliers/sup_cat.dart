import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/suppliers/cat_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SupCat extends StatelessWidget {
  SupCat({Key? key}) : super(key: key);
  List data = [
    {
      "1": "قماش",
      "2": "10",
    },
    {
      "1": "حديد",
      "2": "12",
    },
  ];

  List<String> columnData = [
    "عدد الموردين",
    "الفئه",
  ];

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<Controller>(context);
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
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        data.length,
                        (index) => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: DefaultBotton(
                                    title: 'تفاصيل',
                                    top:  MediaQuery.of(context).size.width<=500?getProportionateScreenWidth(8):getProportionateScreenWidth(3),
                                    right: getProportionateScreenWidth(3),
                                    color: ColorManager.white,
                                    onTap: () {
                                      pro.changePage(CatDetails());
                                    },
                                  ),
                                ),
                              ],
                            )),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                DefaultTable(
                  columnData: columnData,
                  size: getProportionateScreenWidth(10),
                  color: ColorManager.second,
                  rows: data
                      .map((data) => DataRow(cells: [
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
