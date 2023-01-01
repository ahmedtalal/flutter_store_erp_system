import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../auth/component/text_fom_feild.dart';
import '../home/components/botton.dart';
import '../home/components/default_table.dart';
import '../home/components/drop_down.dart';

class AddExpenses extends StatefulWidget {
  @override
  State<AddExpenses> createState() => _AddExpensesState();
}

class _AddExpensesState extends State<AddExpenses> {
  DateTime now = DateTime.now();
  String? categoryValue;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  // DateTime _dateTime = DateTime.now();
  String? selectTalab;
  String? stateTalab;
  String? shippingMethods;
  String? numLine;
  String? payment;
  String? city;
  String? typeCustomer;

  String? governorate;
  String? numLine1;
  String? typeOrder;
  String? order;






  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(5));
    // var format = DateFormat.yMd('ar');

    return Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          DefaultContainer(title: ' اضافة مصروف'),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 10.0, left: 16, right: 16),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width <= 500
                                          ? getProportionateScreenWidth(65)
                                          : getProportionateScreenWidth(43),
                                  height: getProportionateScreenHeight(90),
                                  padding: const EdgeInsets.only(top: 35),
                                  child: dropDown(
                                    const ["خزينة المصنع", "البنك الاهلي", "بنك مصر"],
                                    selectTalab: selectTalab,
                                    onchanged: () => (val) {
                                      setState(() {
                                        selectTalab = val;
                                      });
                                    },
                                    label: 'الخزينة',
                                    foColor: Colors.white,
                                    bgColor: ColorManager.primary,
                                    dpColor: ColorManager.primary,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text(
                                      'المبلغ',
                                      style: style,
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(40),
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
                                        controller: controller1,
                                      ),
                                    ),
                                  ],
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width:
                                          MediaQuery.of(context).size.width <= 500
                                              ? getProportionateScreenWidth(65)
                                              : getProportionateScreenWidth(43),
                                      height: getProportionateScreenHeight(90),
                                      padding: const EdgeInsets.only(top: 35),
                                      child: dropDown(
                                        const [
                                          " مصروف تشغيل",
                                          "مصروف تسويق",
                                          "مصروف اداري",
                                        ],
                                        selectTalab: typeOrder,
                                        onchanged: () => (val) {
                                          setState(() {
                                            typeOrder = val;
                                          });
                                        },
                                        label: 'نوع المصروف',
                                        foColor: Colors.white,
                                        bgColor: ColorManager.primary,
                                        dpColor: ColorManager.primary,
                                      ),
                                    ),
                                    Text('بيان الصرف', style: style),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    SizedBox(
                                      width: getProportionateScreenWidth(50),
                                      height: 60,
                                      child: DefaultInputForm(
                                        controller: controller2,
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
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Container(
                                    width: getProportionateScreenWidth(70),
                                    height: getProportionateScreenHeight(183),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.more_horiz),
                                            Text(
                                              'ملحوظات',
                                              style: style,
                                            ),
                                            Icon(Icons.close)
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                          thickness: 2,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 5,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        )
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: getProportionateScreenWidth(70),
                                    height: getProportionateScreenHeight(183),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: Colors.black, width: 2),
                                    ),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Icon(Icons.more_horiz),
                                            Text(
                                              'تتبع',
                                              style: style,
                                            ),
                                            Icon(Icons.close)
                                          ],
                                        ),
                                        const Divider(
                                          color: Colors.black,
                                          thickness: 2,
                                        ),
                                        TextFormField(
                                          keyboardType: TextInputType.multiline,
                                          maxLines: 5,
                                          decoration: const InputDecoration(
                                              border: InputBorder.none),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: getProportionateScreenWidth(35),
                                height: getProportionateScreenHeight(132),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.black,
                                      width: 2,
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'ارفاق ايصال الدفع',
                                      style: style,
                                    ),
                                    InkWell(
                                        onTap: () {},
                                        child: Image.asset(
                                          ImageAssets.iconDropDown20,
                                          width:
                                          getProportionateScreenWidth(35),
                                          height:
                                          getProportionateScreenHeight(85),
                                        ))
                                  ],
                                ),
                              ),

                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Botton(
                            bgColor: Colors.black,
                            color: Colors.white,
                            title: 'صرف',
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
    );
  }
}
