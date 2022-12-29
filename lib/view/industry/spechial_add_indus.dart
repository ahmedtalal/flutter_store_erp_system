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


class IndustrySpecialAddition extends StatefulWidget {
  const IndustrySpecialAddition({Key? key}) : super(key: key);

  @override
  State<IndustrySpecialAddition> createState() =>
      _IndustrySpecialAdditionState();
}

class _IndustrySpecialAdditionState extends State<IndustrySpecialAddition> {
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

    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "شراء",
      "3": "022",
    },
  ];

  List<String> columnData = [
    "الوحده",
    "التكلفه",
    "اسم الاضافه",
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
                          DefaultContainer(title: 'الاضافات الخاصه للتصنيع'),
                          const SizedBox(
                            height: 50,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(top: 10),
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
                                                  'تعديل ',
                                                  'حذف ',
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
                              Column(
                                children: [
                                  DefaultTable(
                                    columnData: columnData,
                                    size: getProportionateScreenWidth(4),
                                    color: ColorManager.second,
                                    rows: data
                                        .map((data) => DataRow(cells: [

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
                                    child: DataTable(columns: [
                                      DataColumn(
                                          label: Padding(
                                            padding:  EdgeInsets.only(left:getProportionateScreenWidth(1)),
                                            child: Row(
                                              mainAxisAlignment: MainAxisAlignment.center,
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: const Icon(
                                                      Icons.add,
                                                      color: Colors.red,
                                                    )),
                                                const Text('اضافه صنف',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w500),)
                                              ],
                                            ),
                                          ))
                                    ], rows: []),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                        ],
                      ),
                    ),
                  ),                 DefaultAppBar()
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
