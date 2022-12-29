
import 'package:flutter/material.dart';

import '../../../resources/color_manger.dart';
import '../../../resources/style_manager.dart';
import '../../../size_config.dart';
import '../../../view/home/components/default_table.dart';
import '../../../view/home/components/drop_down.dart';


class RequiredList extends StatefulWidget {
  RequiredList({Key? key}) : super(key: key);

  @override
  State<RequiredList> createState() => _RequiredListState();
}

class _RequiredListState extends State<RequiredList> {
  String? chose;
  String? state;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();

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
  Future<void> _select1Date(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: stateDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != stateDate) {
      setState(() {
        stateDate = pickedDate;
      });
    }
  }

  List data = [
    {"1": "كرسي الما", "2": "٥", "3": "١٠٠", "4": "٤٠", "5": "متوفر ","6":"صفر","7":"٦٠"},
    {"1": "كرسي الما", "2": "٥", "3": "١٠٠", "4": "٤٠", "5": "متوفر ","6":"صفر","7":"٦٠"},
    {"1": "كرسي الما", "2": "٥", "3": "١٠٠", "4": "٤٠", "5": "متوفر ","6":"صفر","7":"٦٠"},
  ];

  List<String> columnData = [
    "المطلوب تصنيعه",
    "عدد العجز",
    "توفر الخامات",
    "رصيد المخزن",
    "عدد القطع المطلوبة",
    "عدد الطلبات",
    "اسم المنتج",
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
                      'قائمة المنتجات المطلوبة',
                      style: TextStyle(color: Colors.white, fontSize: 30),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [


                  Container(
                    width: getProportionateScreenWidth(50),
                    height: getProportionateScreenHeight(90),
                    padding: const EdgeInsets.only(top: 35),
                    child: dropDown(
                      const ['تم الشحن', 'تم التحصيل', 'ملغي', 'رفض استالم'],
                      selectTalab: state,
                      onchanged: () => (val) {
                        setState(() {
                          state = val;
                        });
                      },
                      label: 'الحالة',
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
                        'تاريخ الحالة',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(40),
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () => _select1Date(context),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                          child: Text(
                            '$stateDate',
                            style: const TextStyle(
                              color: Color(0xff82225E),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Text(
                        'تاريخ الطلب',
                        style: getSemiBoldStyle(color: ColorManager.black),
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
                ],
              ),
              const SizedBox(
                height: 64,
              ),
              Row(
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(59),
                    height: getProportionateScreenHeight(50),
                    child: dropDown(
                      const [
                        'تاكيد امر تصنيع',
                        'تفاصيل الطلبات',
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
                  SizedBox(
                    width: getProportionateScreenWidth(200),
                    child:
                    DefaultTable(
                      color: ColorManager.primary,
                      columnData: columnData,
                      rows: data
                          .map((data) => DataRow(cells: [
                        DataCell(Text(
                          data['7'],
                        )),
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
