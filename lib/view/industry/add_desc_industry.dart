import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';


class AddDescIndustry extends StatefulWidget {
  const AddDescIndustry({Key? key}) : super(key: key);

  @override
  State<AddDescIndustry> createState() => _AddDescIndustryState();
}

class _AddDescIndustryState extends State<AddDescIndustry> {
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
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
    },
  ];

  List<String> columnData = [
    "صوره الصنف",
    "التكلفه الاجاليه",
    "التكلفه",
    "الوحده",
    "الكميه المطلوبه",
    "النوع",
    " الصنف",
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
              DefaultContainer(title: 'اضافه وصفه'),
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
                        'اسم المنتج',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                        height: 60,
                        child: DefaultInputForm(
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
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Container(
                    width: getProportionateScreenWidth(70),
                    height: getProportionateScreenHeight(90),
                    padding: const EdgeInsets.only(top: 35),
                    child: dropDown(
                      const ['منتج تحت التشيل', 'منتج تام'],
                      selectTalab: chose,
                      onchanged: () => (val) {
                        setState(() {
                          chose = val;
                        });
                      },
                      label: 'حاله المنتج',
                      foColor: Colors.white,
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                    ),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                ],
              ),
              const SizedBox(
                height: 90,
              ),
              Column(
                children: [
                  DefaultTable(
                    columnData: columnData,
                    size: getProportionateScreenWidth(5),
                    color: ColorManager.second,
                    rows: data
                        .map((data) => DataRow(cells: [
                              DataCell(Image.asset(
                                ImageAssets.iconDropDown23,
                                width: 50,
                                height: 50,
                              )),
                              DataCell(Text(
                                data['5'],
                                style: style,
                              )),
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
                  SizedBox(
                    width: double.infinity,
                    child: DataTable(columns: [
                      DataColumn(
                          label: Padding(
                            padding:  EdgeInsets.only(left:getProportionateScreenWidth(140)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                IconButton(
                                    onPressed: () {},
                                    icon: const Icon(
                                      Icons.add,
                                      color: Colors.red,
                                      size: 30,
                                    )),
                                const Text('اضافه صنف',style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500),)
                              ],
                            ),
                          ))
                    ], rows: []),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Column(
                    children: [
                      Text(
                        'اجمالي التكلفه',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(60),
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
                        'التكلفه المتغيره',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: getProportionateScreenWidth(60),
                        height: 60,
                        child: DefaultInputForm(
                          hint: '',
                          label: '',
                          onTab: () {},
                          validate: () {},
                          onSave: () {},
                          passFun: () {},
                          color: Colors.grey,
                          obscureText: false,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getProportionateScreenWidth(20),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: SizedBox(
                        width: getProportionateScreenWidth(59),
                        height: getProportionateScreenHeight(50),
                        child: dropDown(
                          const [
                            'ثابت',
                            'متغير',
                          ],
                          selectTalab: chose1,
                          onchanged: () => (val) {
                            setState(() {
                              chose1 = val;
                            });
                          },
                          label: 'نوع التكلفه',
                          foColor: Colors.white,
                          bgColor: ColorManager.primary,
                          dpColor: ColorManager.primary,
                        )),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Botton(
                color: ColorManager.white,
                title: 'تاكيد',
                onTap: () {},
                bgColor: ColorManager.black,
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
