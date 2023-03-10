import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_row.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:qlevar_router/qlevar_router.dart';

import '../home/components/botton.dart';

class FiperDetails extends StatelessWidget {
  FiperDetails({required this.storeName,Key? key}) : super(key: key);
  final String storeName ;
  List data = [
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "PO2",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "PO1",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "PO1",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "MO4",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "D1",
    },
    {
      "first_name": "١/١٢/٢٢",
      "last_name": "شراء",
      "Quantity": "١٠٠",
      "verified": "صفر",
      "aftercost": "١٠٠",
      "cost": "٣٠ ",
      "all_cost": "٣٠٠٠ جنيه ",
      "current_value": "٣٠٠٠ ",
      "num_op": "PO2",
    },
  ];
  List<String> columnData = [
    "رقم العملية",
    "القيمة الحالية",
    "التكلفة الاجمالية",
    "تكلفة الوحدة",
    "الرصيد بعد",
    "الرصيد قبل",
    "الكمية",
    "الحركة",
    "التاريخ",
  ];

  TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var pro = Provider.of<Controller>(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 50,
                  ),
                  DefaultContainer(title: 'تفاصيل خام فايبر'),
                  const SizedBox(
                    height: 50,
                  ),
                  Column(
                    children: [
                      Text(
                        ' البحث',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(70),
                        height: 60,
                        child: DefaultInputForm(
                          controller: controller,
                          perFix: const Icon(Icons.search),
                          hint: '',
                          label: '',
                          onTab: () {},
                          validate: () {},
                          onSave: () {},
                          passFun: () {},
                          color: Colors.white70,
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 80),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: List.generate(
                              data.length,
                              (index) => Column(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Padding(
                                        padding: MediaQuery.of(context)
                                                    .size
                                                    .width <=
                                                1000
                                            ? const EdgeInsets.only(bottom: 20)
                                            : const EdgeInsets.only(bottom: 10),
                                        child: DefaultBotton(
                                          top: MediaQuery.of(context)
                                                      .size
                                                      .width <=
                                                  1000
                                              ? getProportionateScreenWidth(8)
                                              : getProportionateScreenWidth(3),
                                          right: getProportionateScreenWidth(3),
                                          title: 'تفاصيل',
                                          color: ColorManager.white,
                                          onTap: () {
                                            if (data[index]['num_op'] ==
                                                'PO1') {
                                              QR.to('/po1_details');
                                            } else if (data[index]['num_op'] ==
                                                'MO4') {
                                              QR.to('/mo4_details');
                                            } else if (data[index]['num_op'] ==
                                                'D1') {
                                              QR.to('/d1_fiper');
                                            } else if (data[index]['num_op'] ==
                                                'PO2') {
                                              QR.to('/d1_fiper');
                                            }
                                          },
                                        ),
                                      ),
                                    ],
                                  )),
                        ),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(5),
                      ),
                      DefaultTable(
                          columnData: columnData,
                          size: getProportionateScreenWidth(2),
                          color: ColorManager.second,
                          rows: [
                           ...pro.
                                .map((data) => DataRow(cells: [
                                      DataCell(Text(
                                        data['num_op'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['current_value'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['all_cost'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['cost'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['aftercost'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['verified'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['Quantity'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['last_name'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['first_name'],
                                        style: style,
                                      )),
                                    ]))
                                .toList(),
                            DataRow(
                                color: MaterialStateProperty.all(
                                    ColorManager.primary),
                                cells: [
                                  DataCell(Text(
                                    '',
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    '',
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    " 250",
                                    style: TextStyle(
                                        color: ColorManager.white,
                                        fontSize:
                                            getProportionateScreenWidth(5),
                                        fontWeight: FontWeight.w800),
                                  )),
                                  DataCell(Text(
                                    '',
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    '',
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    '',
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    '',
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    '',
                                    style: style,
                                  )),
                                  DataCell(
                                      Container(
                                        color: ColorManager.primary,
                                        child: Text(
                                          'الاجمالي',
                                          style: TextStyle(
                                              color: ColorManager.white,
                                              fontSize:
                                                  getProportionateScreenWidth(
                                                      5),
                                              fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                      placeholder: true),
                                ])
                          ]),
                    ],
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Botton(
                    color: ColorManager.white,
                    title: 'المزيد',
                    onTap: () {},
                    bgColor: ColorManager.primary,
                  ),
                ],
              ),
            ),
          ),
          const DefaultRow(),
        ],
      ),
    ));
  }
}
