import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "موظف احمد",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
      "4": "100",
      "5": "كيلو",
      "6": "٣٠",
      "7": "3000",
      "8": "موظف احمد",
    },
  ];

  List<String> columnData = [
    "صورة الصنف",
    "التكلفه سعر البيع",
    "المطلوب",
    "الرصيد",
    "فرع الانتاج",
    "الوحده",
    "نوع الصنف",
    "اسم الصنف",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    return SafeArea(
        child: Scaffold(
      body: Row(
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
                          DefaultContainer(title: 'الاصناف'),
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
                                    'فرع الانتاج',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller1,
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
                              const SizedBox(
                                width: 50,
                              ),
                              Container(
                                width: getProportionateScreenWidth(41),
                                height: 80,
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    'مواد خام',
                                    'منتج التشغيل',
                                    "منتج تام"
                                  ],
                                  selectTalab: chose,
                                  onchanged: () => (val) {
                                    setState(() {
                                      chose = val;
                                    });
                                  },
                                  label: 'نوع الصنف',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              const SizedBox(
                                width: 50,
                              ),
                              Column(
                                children: [
                                  Text(
                                    'بحث',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  SizedBox(
                                    width: getProportionateScreenWidth(60),
                                    height: 60,
                                    child: DefaultInputForm(
                                      controller: controller2,
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
                              const SizedBox(
                                width: 20,
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
                                                  width:
                                                      getProportionateScreenWidth(
                                                          41),
                                                  child: dropDown(
                                                    const [
                                                      'تفاصيل',
                                                      'تاكيد طلب شراء',
                                                      'تعديل الصنف',
                                                      'تعديل الرصيد'
                                                    ],
                                                    selectTalab:
                                                        index == selectedIndex
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
                                                    bgColor:
                                                        ColorManager.primary,
                                                    dpColor:
                                                        ColorManager.primary,
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
                                size: getProportionateScreenWidth(15),
                                color: ColorManager.second,
                                rows: data
                                    .map((data) => DataRow(cells: [
                                          DataCell(Image.asset(
                                            ImageAssets.iconDropDown23,
                                            width: 50,
                                            height: 50,
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
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: 'المزيد',
                            onTap: () {},
                          )
                        ],
                      ),
                    ),
                  ),
                  DefaultAppBar()
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
