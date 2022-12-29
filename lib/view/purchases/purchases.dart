import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/purchases/confirm_back_purchase.dart';
import 'package:erb_system/view/purchases/confirm_purchase.dart';
import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

class Purchases extends StatefulWidget {
  const Purchases({Key? key}) : super(key: key);

  @override
  State<Purchases> createState() => _PurchasesState();
}

class _PurchasesState extends State<Purchases> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;

  DateTime orderDate = DateTime.now();


  List dataTable = [
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            )),
        const Text('اضافه صنف')
      ],
    )
  ];

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "١/١٢.٢٠٢٢",
      "8": "شراء",
      "9": "022",
      "10": "100",
      "11": "كيلو",
      "12": "٣٠",
      "13": "٣٠",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "١/١٢.٢٠٢٢",
      "8": "شراء",
      "9": "022",
      "10": "100",
      "11": "كيلو",
      "12": "٣٠",
      "13": "٣٠",
    },
  ];

  List<String> columnData = [
    "تاريخ الاستيلام",
    "تاريخ الطلب",
    "نوع الدفع",
    "المدفوع",
    "حاله الشراء",
    "اسم المورد",
    "اجمالي الفاتوره",
    "سعر الوحده",
    "الوحده",
    "الكميه",
    "الصنف",
    "الحركه",
    "المرجع",
  ];

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: orderDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate) {
      setState(() {
        orderDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    var pro=Provider.of<Controller>(context);
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 50,
              ),
              DefaultContainer(title: 'فواتير المشتريات'),
              const SizedBox(
                height: 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'التاريخ',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(40),
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () => _selectDate(context),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white)),
                          child: Text(
                            '$orderDate',
                            style: const TextStyle(
                              color: Color(0xff82225E),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Container(
                    width: getProportionateScreenWidth(50),
                    height: getProportionateScreenHeight(90),
                    padding: const EdgeInsets.only(top: 35),
                    child: dropDown(
                      const ['تم الطلب', 'تم الاستلام'],
                      selectTalab: chose,
                      onchanged: () => (val) {
                        setState(() {
                          chose = val;
                        });
                      },
                      label: 'حاله الشراء',
                      foColor: Colors.white,
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Column(
                    children: [
                      Text(
                        'اسم المورد',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
                        height: 60,
                        child: DefaultInputForm(
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
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                ],
              ),
              const SizedBox(
                height: 90,
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
                                      'تفاصيل',
                                      'تاكيد استيلام',
                                      'تاكيد مرتجع',
                                      'الغاء',
                                    ],
                                    selectTalab: index == selectedIndex
                                        ? chose1
                                        : chose2,
                                    onchanged: () => (val) {
                                      if(val == 'تاكيد استيلام'){
                                        pro.changePage(const ConfirmPurchase());
                                      }else if(val == 'تاكيد مرتجع'){
                                        pro.changePage(ConfirmBackPurchases());
                                      }
                                      setState(() {
                                        selectedIndex = index;
                                        chose1 = val;
                                      });
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
                    size: getProportionateScreenWidth(0.8),
                    color: ColorManager.second,
                    rows: data
                        .map((data) => DataRow(cells: [
                              DataCell(
                                Text(data['13'], style: style),
                              ),
                              DataCell(Text(
                                data['12'], style: style
                              )),
                              DataCell(Text(
                                data['11'], style: style
                              )),
                              DataCell(Text(
                                data['10'], style: style
                              )),
                              DataCell(Text(
                                data['9'], style: style
                              )),
                              DataCell(Text(
                                data['8'], style: style
                              )),
                              DataCell(Text(
                                data['7'], style: style
                              )),
                              DataCell(Text(
                                data['6'], style: style
                              )),
                              DataCell(Text(
                                data['5'], style: style
                              )),
                              DataCell(Text(
                                data['4'], style: style
                              )),
                              DataCell(Text(
                                data['3'], style: style
                              )),
                              DataCell(Text(
                                data['2'], style: style
                              )),
                              DataCell(Text(
                                data['1'], style: style
                              )),
                            ]))
                        .toList(),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
