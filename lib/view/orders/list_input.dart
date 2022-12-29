
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';
import '../../resources/style_manager.dart';


class ListInput extends StatefulWidget {
  ListInput({Key? key}) : super(key: key);

  @override
  State<ListInput> createState() => _ListInputState();
}

class _ListInputState extends State<ListInput> {
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
    {"1": "االيرادات", "2": "١٢٠٠"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200"},
    {"1": "تكلفة البضاعة المباعة", "2": "-200"},
  ];

  List<String> columnData = [
    "المبلغ",
    "البند",
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
                      'قائمة الدخل',
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


                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Column(
                    children: [
                      Text(
                        'الي تاريخ',
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
                  SizedBox(width: getProportionateScreenWidth(20),),
                  Column(
                    children: [
                      Text(
                        'من تاريخ ',
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
                height: 32,
              ),

              Row(
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(59),
                    height: getProportionateScreenHeight(50),
                    child: dropDown(
                      const [
                        'تفاصيل',
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
                        child:
                        DefaultTable(
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
