import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';


import '../../resources/style_manager.dart';
import '../../size_config.dart';
import '../auth/component/text_fom_feild.dart';
import '../home/components/botton.dart';
import '../home/components/default_table.dart';
import '../home/components/drop_down.dart';



class ConfirmOrder extends StatefulWidget {
  @override
  State<ConfirmOrder> createState() => _ConfirmOrderState();
}

class _ConfirmOrderState extends State<ConfirmOrder> {
  DateTime now = DateTime.now();
  String? categoryValue;

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
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  DateTime chargeDate = DateTime.now();

  TextEditingController _shopSearch = TextEditingController();
  String search = '';

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
  List dataTable = [
    Row(
      children: [
        IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.add,
              color: Colors.red,
            )),
        const Text('اضافه منتج')
      ],
    )
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
        initialDate: stateDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != stateDate) {
      setState(() {
        stateDate = pickedDate;
      });
    }
  }
  Future<void> _select2Date(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: chargeDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != chargeDate) {
      setState(() {
        chargeDate = pickedDate;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);

    // var format = DateFormat.yMd('ar');

    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20,),
             DefaultContainer(title:  'شحن الطلب'),
              Padding(
                padding: const EdgeInsets.only(top: 64.0, left: 16, right: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: getProportionateScreenWidth(40),
                      height: getProportionateScreenHeight(90),
                      padding: const EdgeInsets.only(top: 35),
                      child: dropDown(
                        const ["facebook", "website", "phone call"],
                        selectTalab: selectTalab,
                        onchanged: () => (val) {
                          setState(() {
                            selectTalab = val;
                          });
                        },
                        label: 'مصدر الطلب',
                        foColor: Colors.white,
                        bgColor: ColorManager.primary,
                        dpColor: ColorManager.primary,
                      ),
                    ),
                    Container(
                      width: getProportionateScreenWidth(40),
                      height: getProportionateScreenHeight(90),
                      padding: const EdgeInsets.only(top: 35),
                      child: dropDown(
                        const [
                          "الكل",
                          "طلب مؤكد",
                          "تم الشحن",
                          "تم التحصيل",
                          "تم الاستلام",
                          "تم الصيانة",
                          "ملغى",
                          "رفض الاستلام"
                        ],
                        selectTalab: stateTalab,
                        onchanged: () => (val) {
                          setState(() {
                            stateTalab = val;
                          });
                        },
                        label: 'حالة الطلب',
                        foColor: Colors.white,
                        bgColor: ColorManager.primary,
                        dpColor: ColorManager.primary,
                      ),
                    ),

                    Container(
                      width: getProportionateScreenWidth(45),
                      height: getProportionateScreenHeight(90),
                      padding: const EdgeInsets.only(top: 35),
                      child: dropDown(
                        const [
                          "Small products",
                          "Medium products",
                          "Huge products"
                        ],
                        selectTalab: shippingMethods,
                        onchanged: () => (val) {
                          setState(() {
                            shippingMethods = val;
                          });
                        },
                        label: 'طرق الشحن',
                        foColor: Colors.white,
                        bgColor: ColorManager.primary,
                        dpColor: ColorManager.primary,
                      ),
                    ),

                    Column(
                      children: [
                        const Text('تاريخ الطلب'),
                        SizedBox(
                          width: getProportionateScreenWidth(50),
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
                        const Text('تاريخ الحالة'),
                        SizedBox(
                          width: getProportionateScreenWidth(50),
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
                        ),                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: getProportionateScreenWidth(40),
                          height: getProportionateScreenHeight(50),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: const Color(0xff82225E)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Icon(
                                    Icons.arrow_drop_down_outlined,
                                    color: Color(0xff82225E)),
                                items: [
                                  "الكل",
                                ]
                                    .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                        color: Colors.black),
                                  ),
                                ))
                                    .toList(),
                                value: city,
                                onChanged: (val) {
                                  setState(() {
                                    city = val;
                                  });
                                },
                                hint: const Text(
                                  "المدينة",
                                  style: TextStyle(
                                    color: Color(0xff82225E),
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                dropdownColor: Colors.white,
                                style:
                                const TextStyle(color: Color(0xff82225E)),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          width: getProportionateScreenWidth(40),
                          height: getProportionateScreenHeight(50),
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 3, color: const Color(0xff82225E)),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Icon(Icons.arrow_drop_down_outlined,
                                    color: Color(0xff82225E)),
                                items: [
                                  "الكل",
                                ]
                                    .map((e) => DropdownMenuItem(
                                  value: e,
                                  child: Text(
                                    e,
                                    style: const TextStyle(
                                        color: Colors.black),
                                  ),
                                ))
                                    .toList(),
                                value: governorate,
                                onChanged: (val) {
                                  setState(() {
                                    governorate = val;
                                  });
                                },
                                hint: const Text(
                                  "المحافظة",
                                  style: TextStyle(
                                    color: Color(0xff82225E),
                                  ),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                dropdownColor: Colors.white,
                                style: const TextStyle(color: Color(0xff82225E)),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Column(
                          children: [
                            Text(
                              'اسم العميل',
                              style: getSemiBoldStyle(color: ColorManager.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(30),
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

                        const SizedBox(
                          height: 20,
                        ),

                        Column(
                          children: [
                            Text(
                              'رقم الموبيل',
                              style: getSemiBoldStyle(color: ColorManager.black),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(30),
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

                      ],
                    ),
                    Container(
                      width: getProportionateScreenWidth(40),
                      height: getProportionateScreenHeight(90),
                      padding: const EdgeInsets.only(top: 35),
                      child: dropDown(
                        const [
                          "طلب جديد",
                          "طلب استبدال",
                          "طلب صيانة",
                          "طلب مرتجع",
                        ],
                        selectTalab: payment,
                        onchanged: () => (val) {
                          setState(() {
                            payment = val;
                          });
                        },
                        label: 'نوع الطلب',
                        foColor: Colors.white,
                        bgColor: ColorManager.primary,
                        dpColor: ColorManager.primary,
                      ),
                    ),

                  ],
                ),
              ),
              const SizedBox(height: 20,),
              DefaultTable(
                columnData: columnData,
                rows: data
                    .map((data) => DataRow(cells: [
                  DataCell(Image.asset(
                    ImageAssets.iconDropDown23,
                    width: 50,
                    height: 50,
                  )),
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
              SizedBox(
                width: 659,
                child: Center(
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(
                          children: List.generate(
                              dataTable.length,
                                  (index) => Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const SizedBox(height: 10),
                                  dataTable[index]
                                ],
                              ))),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20,),


              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: getProportionateScreenWidth(50),
                    height: getProportionateScreenHeight(90),
                    padding: const EdgeInsets.only(top: 35),
                    child: dropDown(
                      const [
                        "خزينة المصنع",
                        "البنك االاهلي",
                        "paymob",
                            "valu"
                      ],
                      selectTalab: payment,
                      onchanged: () => (val) {
                        setState(() {
                          payment = val;
                        });
                      },
                      label: 'طريقة حساب الشحن',
                      foColor: Colors.white,
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                    ),
                  ),

                  Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'صافي القيمة',
                            style: getSemiBoldStyle(color: ColorManager.black),
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
                      Container(
                        width: getProportionateScreenWidth(50),
                        height: getProportionateScreenHeight(90),
                        padding: const EdgeInsets.only(top: 35),
                        child: dropDown(
                          const [
                            "الخط االاول",
                            "الخط الثاني",
                            "الخط الثالث"
                          ],
                          selectTalab: numLine1,
                          onchanged: () => (val) {
                            setState(() {
                              numLine1 = val;
                            });
                          },
                          label: 'رقم الخط',
                          foColor: Colors.white,
                          bgColor: ColorManager.primary,
                          dpColor: ColorManager.primary,
                        ),
                      ),

                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'مبلغ تحت الحساب',
                            style: getSemiBoldStyle(color: ColorManager.black),
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

                    ],
                  ),
                  Column(
                    children: [
                      Column(
                        children: [
                          Text(
                            'اجمالى الفاتورة',
                            style: getSemiBoldStyle(color: ColorManager.black),
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
                      const SizedBox(
                        height: 20,
                      ),
                      const Text('تاريخ الشحن'),
                      SizedBox(
                        width: getProportionateScreenWidth(50),
                        height: 60,
                        child: ElevatedButton(
                          onPressed: () => _select2Date(context),
                          style: ButtonStyle(
                              backgroundColor:
                              MaterialStateProperty.all(Colors.white)),
                          child: Text(
                            '$chargeDate',
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
                      Column(
                        children: [
                          Text(
                            'مصاريف الشحن',
                            style: getSemiBoldStyle(color: ColorManager.black),
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

                      const SizedBox(
                        height: 20,
                      ),
                      Column(
                        children: [
                          Text(
                            'خط التوزيع',
                            style: getSemiBoldStyle(color: ColorManager.black),
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
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 64,),
              Botton(
                bgColor: Colors.black,
                color: Colors.white, title: 'تاكيد', onTap: () {  },
              )
            ],
          ),
        ),
      ),
    );
  }
}
