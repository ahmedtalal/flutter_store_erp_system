import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

class IndustryDesc extends StatefulWidget {
  const IndustryDesc({Key? key}) : super(key: key);

  @override
  State<IndustryDesc> createState() => _IndustryDescState();
}

class _IndustryDescState extends State<IndustryDesc> {
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
      "7": "كيلو",
      "8": "٣٠",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "كيلو",
      "8": "٣٠",
    },
  ];

  List<String> columnData = [
    "اجمالي المتوفره",
    "عدد الخامات غير المتوفره",
    "حاله الخامات",
    "عدد خامات الوصفه",
    "الكميه المطلوبه",
    "الرصيد",
    "النوع",
    "المنتج",
  ];



  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
    return SafeArea(
        child: Scaffold(
          body:
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  flex: 5,
                  child: Stack(
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
                              DefaultContainer(title: 'وصفات التصنيع'),
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
                                        style: getSemiBoldStyle(color: ColorManager.black,fontSize: getProportionateScreenWidth(5)),
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
                                                      'تاكيد امر الشراء',
                                                      'ارسال اشعار عند الاستلام'
                                                    ],
                                                    selectTalab: index == selectedIndex
                                                        ? chose1
                                                        : chose2,
                                                    onchanged: () => (val) {
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
                                    size: getProportionateScreenWidth(4),
                                    color: ColorManager.second,
                                    rows: data
                                        .map((data) => DataRow(cells: [
                                      DataCell(Text(
                                        data['8'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['7'],
                                        style: style,
                                      )),
                                      DataCell(Text(
                                        data['6'],
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
                                ],
                              ),
                              const SizedBox(
                                height: 30,
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
                      ),                    DefaultAppBar()
                    ],
                  )),
              Expanded(
                  flex: 1,
                  child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      decoration: BoxDecoration(
                        color: ColorManager.primary,
                      ),
                      child: DropDownList())),
            ],
          ),

        ));
  }
}
