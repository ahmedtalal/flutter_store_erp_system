import 'package:flutter/material.dart';

import '../../../resources/color_manger.dart';
import '../../../size_config.dart';
import '../../../view/home/components/default_table.dart';
import '../../../view/home/components/drop_down.dart';

class ShippingMethods extends StatefulWidget {
  ShippingMethods({Key? key}) : super(key: key);

  @override
  State<ShippingMethods> createState() => _ShippingMethodsState();
}

class _ShippingMethodsState extends State<ShippingMethods> {
  String? chose;
  String? state;
  DateTime orderDate = DateTime.now();

  List data = [
    {"1": "١", "2": "Small products"},
    {"1": "٢", "2": "Huge products"},
  ];

  List<String> columnData = [
    "الاسم",
    "طريقة",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  width: getProportionateScreenWidth(200),
                  height: getProportionateScreenHeight(60),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: const Color(0xff82225E),
                  ),
                  child: const Center(
                    child: Text(
                      'طرق الشحن',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(59),
                    height: getProportionateScreenHeight(50),
                    child: dropDown(
                      const [
                        'تحصيل',
                        'رفض استالم',
                      ],
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                      selectTalab: chose,
                      foColor: Colors.white,
                      label: 'خيارات',
                      onchanged: () => (val) {
                        setState(() {
                          chose = val;
                        });
                      },
                    ),
                  ),
                  const SizedBox(
                    width: 32,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: getProportionateScreenWidth(200),
                        child: DefaultTable(
                          color: ColorManager.second,
                          columnData: columnData,
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
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
