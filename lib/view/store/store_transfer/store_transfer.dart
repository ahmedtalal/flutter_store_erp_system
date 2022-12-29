import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/merge_table/merge_table.dart';
import 'package:erb_system/merge_table/src/datas/m_row.dart';
import 'package:erb_system/merge_table/src/merge_table.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/store/store_transfer/balance_modification.dart';
import 'package:erb_system/view/store/store_transfer/damage_details_transfer.dart';
import 'package:erb_system/view/store/store_transfer/transfer_fiber_details.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';



class StoreTransfer extends StatefulWidget {
  StoreTransfer({Key? key}) : super(key: key);

  @override
  State<StoreTransfer> createState() => _StoreTransferState();
}

class _StoreTransferState extends State<StoreTransfer> {
  String? chose;
  String? chose1;
  String? chose2;
  DateTime orderDate = DateTime.now();


  List data = [
    {"1": "فيبر", "2": "٢٠٠", "3": "كيلو", "4": "٣٠", "5": "٦٠٠٠"},

  ];

  List<String> columnData = [
    "اجمالي قيمة المخزون",
    "متوسط تكلفة الوحده",
    "وحدة القياس",
    "الكمية",
    "اسم الصنف",
  ];
  List data1 = [
    {"1": "كوفر ستاندرد", "2": "٢٠", "3": "قطعة", "4": "١٥٠", "5": "٣٠٠٠"},

  ];

  List<String> columnData1 = [
    "اجمالي قيمة المخزون",
    "متوسط تكلفة الوحده",
    "وحدة القياس",
    "الكمية",
    "اسم الصنف",
  ];
  List data2 = [
    {"1": " ستاندرد", "2": "٢٠", "3": "قطعة", "4": "٣٠٠", "5": "٩٠٠٠"},

  ];

  List<String> columnData2 = [
    "اجمالي قيمة المخزون",
    "متوسط تكلفة الوحده",
    "وحدة القياس",
    "الكمية",
    "اسم الصنف",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style=TextStyle(fontSize: getProportionateScreenWidth(6));
    var pro = Provider.of<Controller>(context);
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 64,
              ),
              Row(
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(70),
                    height: getProportionateScreenHeight(50),
                    child: dropDown(
                      const [
                        'تفاصيل',
                        'صرف جزء تالف',
                        'تعديل الرصيد',

                      ],
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                      selectTalab: chose,
                      foColor: Colors.white,
                      label: 'خيارات',
                      onchanged: () => (val) {
                        if (val== 'تفاصيل') {
                          pro.changePage(FiperTransferDetails());
                        } else if (val ==
                            'صرف جزء تالف') {
                          pro.changePage(ExchangePart());
                        } else if (val ==
                            'تعديل الرصيد') {
                          pro.changePage(ModificationBalance());
                        }
                        setState(() {
                          chose = val;
                        });
                      },
                    ),
                  ),
                   SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(200),
                    child: MergeTable(
                      borderColor: Colors.black,
                      alignment: MergeTableAlignment.center,
                      columns: [
                        MMergedColumns(
                          header: "مخزن مواد خام",
                          columns: columnData,
                        ),
                      ],
                      rows: data
                          .map(
                            (e) => [
                          MMergedRows([
                            Text(e['5'],style: style,),
                            Text(e['4'],style: style,),
                            Text(e['3'],style: style,),
                            Text(e['2'],style: style,),
                            Text(e['1'],style: style,),
                          ]),
                        ],
                      )
                          .toList(),
                      color: ColorManager.second,
                      size: getProportionateScreenWidth(5),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              Row(
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(70),
                    height: getProportionateScreenHeight(50),
                    child: dropDown(
                      const [
                        'تفاصيل',
                        'صرف جزء تالف',
                        'تعديل الرصيد',
                        'تحويل الي مواد خام',
                      ],
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                      selectTalab: chose1,
                      foColor: Colors.white,
                      label: 'خيارات',
                      onchanged: () => (val) {
                        if (val== 'تفاصيل') {
                          pro.changePage(FiperTransferDetails());
                        } else if (val ==
                            'صرف جزء تالف') {
                          pro.changePage(ExchangePart());
                        } else if (val ==
                            'تعديل الرصيد') {
                          pro.changePage(ModificationBalance());
                        }else if (val ==
                            'تحويل الي مواد خام') {
                          pro.changePage(ModificationBalance());
                        }
                        setState(() {
                          chose1 = val;
                        });
                      },
                    ),
                  ),
                   SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(200),
                    child: MergeTable(
                      borderColor: Colors.black,
                      alignment: MergeTableAlignment.center,
                      columns: [
                        MMergedColumns(
                          header: "مخزن منتجات تحت التشغيل",
                          columns: columnData1,
                        ),
                      ],
                      rows: data1
                          .map(
                            (e) => [
                          MMergedRows([
                            Text(e['5'],style: style,),
                            Text(e['4'],style: style,),
                            Text(e['3'],style: style,),
                            Text(e['2'],style: style,),
                            Text(e['1'],style: style,),
                          ]),
                        ],
                      )
                          .toList(),
                      color: ColorManager.second,
                      size: getProportionateScreenWidth(5),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              Row(
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(80),
                    height: getProportionateScreenHeight(50),
                    child: dropDown(
                      const [
                        'تفاصيل',
                        'صرف جزء تالف',
                        'تعديل الرصيد',
                        'تحويل الي مواد خام',
                        'تحويل الي منتج تحت التشغيل',

                      ],
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                      selectTalab: chose2,
                      foColor: Colors.white,
                      label: 'خيارات',
                      onchanged: () => (val) {
                        if (val== 'تفاصيل') {
                          pro.changePage(FiperTransferDetails());
                        } else if (val ==
                            'صرف جزء تالف') {
                          pro.changePage(ExchangePart());
                        } else if (val ==
                            'تعديل الرصيد') {
                          pro.changePage(ModificationBalance());
                        }else if (val ==
                            'تحويل الي مواد خام') {
                          pro.changePage(ModificationBalance());
                        }else if (val ==
                            'تحويل الي منتج تحت التشغيل') {
                          pro.changePage(ModificationBalance());
                        }
                        setState(() {
                          chose2 = val;
                        });
                      },
                    ),
                  ),
                   SizedBox(
                    width: getProportionateScreenWidth(5),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(200),
                    child: MergeTable(
                      borderColor: Colors.black,
                      alignment: MergeTableAlignment.center,
                      columns: [
                        MMergedColumns(
                          header: "مخزن منتجات تامه ",
                          columns: columnData2,
                        ),
                      ],
                      rows: data2
                          .map(
                            (e) => [
                          MMergedRows([
                            Text(e['5'],style: style,),
                            Text(e['4'],style: style,),
                            Text(e['3'],style: style,),
                            Text(e['2'],style: style,),
                            Text(e['1'],style: style,),
                          ]),
                        ],
                      )
                          .toList(),
                      color: ColorManager.second,
                      size: getProportionateScreenWidth(5),
                    ),
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
