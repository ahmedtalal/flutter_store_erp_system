import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:flutter/material.dart';

import '../../resources/color_manger.dart';
import '../../view/auth/component/text_fom_feild.dart';
import '../../view/home/components/botton.dart';
import '../../view/home/components/default_botton.dart';
import '../../view/home/components/default_table.dart';
import '../../view/home/components/drop_down.dart';

class companies_representatives extends StatefulWidget {
  companies_representatives({Key? key}) : super(key: key);

  @override
  State<companies_representatives> createState() =>
      _companies_representativesState();
}

class _companies_representativesState extends State<companies_representatives> {
  String? chose;

  List data = [
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
  ];

  List<String> columnData = [
    "نسبة رفض االستالم",
    "عدد الطلبات تحت التحصيل",
    "الرصيد",
    "النوع",
    "الاسم",
  ];

  List<String> dataTable = [""];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(6));
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              DefaultContainer(title: 'شركات الشحن والمندوبين'),
              const SizedBox(
                height: 32,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  dropDown(
                    const [
                      'كشف حساب',
                      'تعديل شركة الشحن',
                      'تحصيل االجمالي',
                    ],
                    bgColor: ColorManager.primary,
                    dpColor: ColorManager.primary,
                    selectTalab: chose,
                    foColor: Colors.white,
                    width: getProportionateScreenWidth(65),
                    label: 'خيارات',
                    onchanged: () => (val) {
                      setState(() {
                        chose = val;
                      });
                    },
                  ),
                  Column(
                    children: [
                      DefaultTable(
                        color: ColorManager.primary,
                        columnData: columnData,
                        size: getProportionateScreenWidth(2),
                        rows: data
                            .map((data) => DataRow(cells: [
                                  DataCell(Text(
                                    data['5'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['4'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['3'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['2'],
                                    style: style,
                                  )),
                                  DataCell(Text(
                                    data['1'],
                                    style: style,
                                  )),
                                ]))
                            .toList(),
                      ),
                      // SizedBox(
                      //   width: width / 3.01,
                      //   child: Table(
                      //     border: TableBorder.all(color: Colors.black),
                      //     children: [
                      //       TableRow(
                      //           decoration: const BoxDecoration(
                      //             color: Colors.white,
                      //           ),
                      //           children: List.generate(
                      //               dataTable.length,
                      //               (index) => Column(
                      //                     children: [
                      //                       const SizedBox(height: 10),
                      //                       Text(
                      //                         dataTable[index],
                      //                         style: const TextStyle(
                      //                             color: Colors.white),
                      //                       ),
                      //                     ],
                      //                   ))),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 32,
              ),
              DefaultContainer(
                title: 'اضافة شركة شحن او مندوب',
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(40),
                    child: Column(
                      children: [
                        Text('النوع',style: style,),
                        DefaultInputForm(
                          hint: '',
                          label: '',
                          onTab: () {},
                          validate: () {},
                          onSave: () {},
                          passFun: () {},
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                   SizedBox(
                    width: getProportionateScreenWidth(10),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(40),
                    child: Column(
                      children: [
                        Text('النوع',style: style,),
                        DefaultInputForm(
                          hint: '',
                          label: '',
                          onTab: () {},
                          validate: () {},
                          onSave: () {},
                          passFun: () {},
                          obscureText: false,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              Botton(
                bgColor: Colors.black,
                color: Colors.white,
                title: 'اضافة',
                onTap: () {},
              )
            ],
          ),
        ),
      ),
    ));
  }
}
