
import 'package:erb_system/merge_table/merge_table.dart';
import 'package:erb_system/merge_table/src/datas/m_row.dart';
import 'package:erb_system/merge_table/src/merge_table.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:flutter/material.dart';



import '../../resources/color_manger.dart';
import '../../resources/style_manager.dart';
import '../../size_config.dart';
import '../auth/component/text_fom_feild.dart';
import '../home/components/drop_down.dart';

class account_statement extends StatefulWidget {
  account_statement({Key? key}) : super(key: key);

  @override
  State<account_statement> createState() => _account_statementState();
}

class _account_statementState extends State<account_statement> {
  String? chose;
  String? state;
  DateTime orderDate = DateTime.now();

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

  List data = [
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
    {"1": "aramex", "2": "شركة", "3": "٦٠٠٠", "4": "٥", "5": "٪١٠ "},
  ];

  List<String> columnData = [
    "المبلغ",
    "حاله الدفع",
    "رقم الموبيل",
    "اسم العميل",
    "رقم الطلب",
  ];

  List<String> dataTable = ["الطلبات"];

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
              const SizedBox(
                height: 20,
              ),
              DefaultContainer(title:   'aramex كشف حساب',),
              const SizedBox(
                height: 32,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'عدد الطلبات تحت التحصيل',
                        style: getSemiBoldStyle(color: ColorManager.black,fontSize: getProportionateScreenWidth(5)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
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
                  Container(
                    width: getProportionateScreenWidth(60),
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
                        'التاريخ',
                        style: getSemiBoldStyle(color: ColorManager.black,fontSize: getProportionateScreenWidth(5)),
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
                            style:  TextStyle(
                              color: Color(0xff82225E),
                              fontSize: getProportionateScreenWidth(5)
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
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Column(
                    children: [
                      Text(
                        'المبلغ المتبقي',
                        style: getSemiBoldStyle(color: ColorManager.black,fontSize: getProportionateScreenWidth(5)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
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
                  Column(
                    children: [
                      Text(
                        'المبلغ المحصل',
                        style: getSemiBoldStyle(color: ColorManager.black,fontSize: getProportionateScreenWidth(5)),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
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
                height: 64,
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
                  SizedBox(
                    width: getProportionateScreenWidth(200),
                    child: MergeTable(
                      borderColor: Colors.black,
                      alignment: MergeTableAlignment.center,
                      columns: [
                        MMergedColumns(
                          header: "الطلبات",
                          columns: columnData,
                        ),
                      ],
                      rows: data
                          .map(
                            (e) => [
                          MMergedRows([
                            Text(e['5']),
                            Text(e['4']),
                            Text(e['3']),
                            Text(e['2']),
                            Text(e['1']),
                          ]),
                        ],
                      )
                          .toList(),
                      color: ColorManager.second,
                      size: 16,
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
