import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/suppliers/sup_money_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Suppliers extends StatefulWidget {
  Suppliers({Key? key}) : super(key: key);

  @override
  State<Suppliers> createState() => _SuppliersState();
}

class _SuppliersState extends State<Suppliers> {
  String? chose1;
  String? chose2;
  int? selectedIndex;

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "موظف احمد",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "موظف احمد",
    },
  ];

  List<String> columnData = [
    "طلبات قيد الانتظار",
    "رصيد حساب المورد",
    "فئه المورد",
    "العنوان",
    "رقم الهاتف",
    "اسم المورد",
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
            DefaultContainer(title: 'الموردين'),
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 71),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: List.generate(
                        data.length,
                        (index) => Column(
                              children: [
                                SizedBox(
                                    width: getProportionateScreenWidth(70),
                                    child: dropDown(
                                      const [
                                        'تفاصيل الطلبات',
                                        'تفاصيل حساب الموردين',
                                        "تعديل المورد"
                                      ],
                                      selectTalab: index == selectedIndex
                                          ? chose1
                                          : chose2,
                                      onchanged: () => (val) {
                                        print(index);
                                        setState(() {
                                          selectedIndex = index;
                                          chose1 = val;
                                        });
                                        if(chose1=='تفاصيل الطلبات'){
                                          pro.changePage(Container());
                                        }else if(chose1=='تفاصيل حساب الموردين'){
                                          pro.changePage(const SupMoneyDetails());
                                        }else if(chose1== "تعديل المورد"){
                                          pro.changePage(Container());
                                        }
                                      },
                                      label: 'خيارات',
                                      foColor: Colors.white,
                                      bgColor: ColorManager.primary,
                                      dpColor: ColorManager.primary,
                                    )),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            )),
                  ),
                ),
                DefaultTable(
                  columnData: columnData,
                  size: getProportionateScreenWidth(10),
                  color: ColorManager.second,
                  rows: data
                      .map((data) => DataRow(cells: [
                            DataCell(Text(
                              data['6'],
                            )),
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
