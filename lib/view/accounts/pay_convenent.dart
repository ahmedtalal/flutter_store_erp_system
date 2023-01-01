import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:flutter/material.dart';

class PayCovenant extends StatefulWidget {
  const PayCovenant({Key? key}) : super(key: key);

  @override
  State<PayCovenant> createState() => _PayCovenantState();
}

class _PayCovenantState extends State<PayCovenant> {
  String? chose;
  String? chose1;
  String? chose2;
  int? selectedIndex;
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();

  DateTime orderDate = DateTime.now();
  DateTime orderDate1 = DateTime.now();

  List data = [
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "100",
      "5": "كيلو",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "100",
      "5": "كيلو",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "100",
      "5": "كيلو",
    },
    {
      "1": "١/١٢.٢٠٢٢",
      "2": "احمد",
      "3": "022",
      "4": "100",
      "5": "كيلو",
    },
  ];

  List<String> columnData = [
    "بواسطة",
    "السبب",
    "المبلغ",
    "متحصل العهدة",
    "التاريخ",
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

  Future<void> _select1Date(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: orderDate1,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != orderDate1) {
      setState(() {
        orderDate1 = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    TextStyle style = TextStyle(fontSize: getProportionateScreenWidth(4));
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
                          DefaultContainer(title: 'صرف العهده'),
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
                                    ' التاريخ',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
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
                                              MaterialStateProperty.all(
                                                  Colors.white)),
                                      child: Text(
                                        "${orderDate.year.toString()}/${orderDate.month.toString().padLeft(2, '0')}/${orderDate.day.toString().padLeft(2, '0')}",
                                        style: const TextStyle(
                                          color: Colors.black,
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
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width <= 708
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "خزينه المصنع",
                                    "فودافون كاش",
                                    "البنك الاهلي",
                                  ],
                                  selectTalab: chose1,
                                  onchanged: () => (val) {
                                    setState(() {
                                      chose1 = val;
                                    });
                                  },
                                  label: 'الخزينه',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width <= 708
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "موسي",
                                    "خالد",
                                  ],
                                  selectTalab: chose2,
                                  onchanged: () => (val) {
                                    setState(() {
                                      chose2 = val;
                                    });
                                  },
                                  label: 'متحصل العهده',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                              Column(
                                children: [
                                  Text(
                                    'مبلغ العهده',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black,
                                        fontSize:
                                            getProportionateScreenWidth(5)),
                                  ),
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
                                      color: Colors.grey,
                                      obscureText: false,
                                    ),
                                  ),
                                ],
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width <= 708
                                    ? getProportionateScreenWidth(65)
                                    : getProportionateScreenWidth(43),
                                height: getProportionateScreenHeight(90),
                                padding: const EdgeInsets.only(top: 35),
                                child: dropDown(
                                  const [
                                    "نقديه",
                                    "عينيه",
                                  ],
                                  selectTalab: chose,
                                  onchanged: () => (val) {
                                    setState(() {
                                      chose = val;
                                    });
                                  },
                                  label: 'نوع العهده',
                                  foColor: Colors.white,
                                  bgColor: ColorManager.primary,
                                  dpColor: ColorManager.primary,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: getProportionateScreenWidth(90),
                                height: getProportionateScreenHeight(250),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  border: Border.all(
                                      color: ColorManager.primary, width: 2),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Icon(
                                          Icons.more_horiz,
                                          color: ColorManager.primary,
                                        ),
                                        Text(
                                          'ملحوظات',
                                          style: style,
                                        ),
                                        Icon(
                                          Icons.close,
                                          color: ColorManager.primary,
                                        )
                                      ],
                                    ),
                                    Divider(
                                      color: ColorManager.primary,
                                      thickness: 2,
                                    ),
                                    TextFormField(
                                      controller: controller3,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    )
                                  ],
                                ),
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'وصف',
                                    style: getSemiBoldStyle(
                                        color: ColorManager.black),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    width: getProportionateScreenWidth(90),
                                    height: getProportionateScreenHeight(250),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      border: Border.all(
                                          color: ColorManager.primary,
                                          width: 2),
                                    ),
                                    child: TextFormField(
                                      controller: controller4,
                                      keyboardType: TextInputType.multiline,
                                      maxLines: 3,
                                      decoration: const InputDecoration(
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
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
    ));
  }
}
