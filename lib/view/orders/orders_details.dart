import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../resources/color_manger.dart';

class Talabat extends StatefulWidget {
  @override
  State<Talabat> createState() => _TalabatState();
}

class _TalabatState extends State<Talabat> {
  DateTime now = DateTime.now();
  String? categoryValue;

  // DateTime _dateTime = DateTime.now();
  String? selectTalab;
  String? stateTalab;
  String? shippingMethods;
  String? numLine;
  String? city;
  String? typeCustomer;
  String? governorate;
  String? numLine1;
  String? typeOrder;
  String? order;
  DateTime orderDate = DateTime.now();
  DateTime stateDate = DateTime.now();
  TextEditingController _shopSearch = TextEditingController();
  String search = '';
  bool visable = false;

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

  List<String> dataTable = [
    'تاريخ الحاله',
    'نوع العميل',
    'طريقه الشحن',
    'موجل',
    'خط التوزيع',
    'مصدر الطلب',
    'شركه الشحن',
    'المدفوع',
    'حاله الدفع',
    'اجمالي الفاتوره',
    'رقم التليفون',
    'اسم العميل',
    'المدينة',
    'المحافظة',
    'حالة الطلب',
    'نوع الطلب',
    'تاريخ الطلب',
    'رقم الطلب',
  ];
  List data = [
    {
      "1": "0",
      "2": "1/11/1111",
      "3": "جديد",
      "4": "جديد",
      "5": "القاهرة",
      "6": "مدينة نصر",
      "7": "احمد",
      "8": "١٢٣٢١٣١٢",
      "9": "١٢٠٠",
      "10": "مستحق",
      "11": "0",
      "12": "aaaaa",
      "13": "facebook",
      "14": "aaaaa",
      "15": "عدد 1",
      "16": "small",
      "17": "فرد",
      "18": "aaa ",
    },
    {
      "1": "0",
      "2": "1/11/1111",
      "3": "جديد",
      "4": "جديد",
      "5": "القاهرة",
      "6": "مدينة نصر",
      "7": "احمد",
      "8": "١٢٣٢١٣١٢",
      "9": "١٢٠٠",
      "10": "مستحق",
      "11": "0",
      "12": " ",
      "13": "facebook",
      "14": " ",
      "15": "عدد 1",
      "16": "small",
      "17": "فرد",
      "18": " ",
    },
    {
      "1": "0",
      "2": "1/11/1111",
      "3": "جديد",
      "4": "جديد",
      "5": "القاهرة",
      "6": "مدينة نصر",
      "7": "احمد",
      "8": "١٢٣٢١٣١٢",
      "9": "١٢٠٠",
      "10": "مستحق",
      "11": "0",
      "12": " ",
      "13": "facebook",
      "14": " ",
      "15": "عدد 1",
      "16": "small",
      "17": "فرد",
      "18": " ",
    },
    {
      "1": "0",
      "2": "1/11/1111",
      "3": "جديد",
      "4": "جديد",
      "5": "القاهرة",
      "6": "مدينة نصر",
      "7": "احمد",
      "8": "١٢٣٢١٣١٢",
      "9": "١٢٠٠",
      "10": "مستحق",
      "11": "0",
      "12": " ",
      "13": "facebook",
      "14": " ",
      "15": "عدد 1",
      "16": "small",
      "17": "فرد",
      "18": " ",
    },
    {
      "1": "0",
      "2": "1/11/1111",
      "3": "جديد",
      "4": "جديد",
      "5": "القاهرة",
      "6": "مدينة نصر",
      "7": "احمد",
      "8": "١٢٣٢١٣١٢",
      "9": "١٢٠٠",
      "10": "مستحق",
      "11": "0",
      "12": " ",
      "13": "facebook",
      "14": " ",
      "15": "عدد 1",
      "16": "small",
      "17": "فرد",
      "18": " ",
    },
    {
      "1": "0",
      "2": "1/11/1111",
      "3": "جديد",
      "4": "جديد",
      "5": "القاهرة",
      "6": "مدينة نصر",
      "7": "احمد",
      "8": "١٢٣٢١٣١٢",
      "9": "١٢٠٠",
      "10": "مستحق",
      "11": "0",
      "12": " ",
      "13": "facebook",
      "14": " ",
      "15": "عدد 1",
      "16": "small",
      "17": "فرد",
      "18": " ",
    },
  ];

  List data1 = [
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

  List<String> columnData1 = [
    "تكلفة الوحدة",
    "وحدة القياس",
    "الكمية",
    "الطلب",
    "الحركة",
    "التاريخ",
  ];

  @override
  Widget build(BuildContext context) {
    // var format = DateFormat.yMd('ar');
    SizeConfig.init(context);
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        width: width,
        height: height,
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    width: 250,
                    height: 70,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color(0xff82225E),
                    ),
                    child: const Center(
                      child: Text(
                        'الطلبات',
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(top: 64.0, left: 16, right: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: width / 12,
                        height: 40,
                        child: Center(
                            child: Container(
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xff82225E),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.white,
                                ),
                                items: ["facebook", "website", "phone call"]
                                    .map((e) => DropdownMenuItem(
                                          value: e,
                                          child: Text(
                                            e,
                                            style: const TextStyle(
                                                color: Colors.black),
                                          ),
                                        ))
                                    .toList(),
                                value: selectTalab,
                                onChanged: (val) {
                                  setState(() {
                                    selectTalab = val;
                                  });
                                },
                                hint: const Text(
                                  "مصدر الطلب",
                                  style: TextStyle(color: Colors.white),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                dropdownColor: Colors.white,
                                style:
                                    const TextStyle(color: Color(0xff82225E)),
                              ),
                            ),
                          ),
                        )),
                      ),
                      SizedBox(
                        width: width / 12,
                        height: 40,
                        child: Center(
                            child: Container(
                          width: double.infinity,
                          height: 55,
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                              color: const Color(0xff82225E),
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                icon: const Icon(
                                  Icons.arrow_drop_down_outlined,
                                  color: Colors.white,
                                ),
                                items: [
                                  "الكل",
                                  "طلب مؤكد",
                                  "تم الشحن",
                                  "تم التحصيل",
                                  "تم الاستلام",
                                  "تم الصيانة",
                                  "ملغى",
                                  "رفض الاستلام"
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
                                value: stateTalab,
                                onChanged: (val) {
                                  setState(() {
                                    stateTalab = val;
                                  });
                                },
                                hint: const Text(
                                  "حالة الطلب",
                                  style: TextStyle(color: Colors.white),
                                ),
                                borderRadius: BorderRadius.circular(10),
                                dropdownColor: Colors.white,
                                style:
                                    const TextStyle(color: Color(0xff82225E)),
                              ),
                            ),
                          ),
                        )),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: width / 9.5,
                            height: 40,
                            child: Center(
                                child: Container(
                              width: double.infinity,
                              height: 55,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0xff82225E),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Colors.white,
                                    ),
                                    items: [
                                      "Small products",
                                      "Medium products",
                                      "Huge products"
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
                                    value: shippingMethods,
                                    onChanged: (val) {
                                      setState(() {
                                        shippingMethods = val;
                                      });
                                    },
                                    hint: const Text(
                                      "طرق الشحن",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    dropdownColor: Colors.white,
                                    style: const TextStyle(
                                        color: Color(0xff82225E)),
                                  ),
                                ),
                              ),
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: width / 12,
                            height: 40,
                            child: Center(
                                child: Container(
                              width: double.infinity,
                              height: 55,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0xff82225E),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Colors.white,
                                    ),
                                    items: [
                                      "الخط االاول",
                                      "الخط الثاني",
                                      "الخط الثالث"
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
                                    value: numLine,
                                    onChanged: (val) {
                                      setState(() {
                                        numLine = val;
                                      });
                                    },
                                    hint: const Text(
                                      "رقم الخط",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    dropdownColor: Colors.white,
                                    style: const TextStyle(
                                        color: Color(0xff82225E)),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const Text('تاريخ الطلب'),
                          ElevatedButton(
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
                          const Text('تاريخ الحالة'),
                          ElevatedButton(
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
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: width / 12,
                            height: 40,
                            child: Center(
                                child: Container(
                              width: double.infinity,
                              height: 55,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                    style: const TextStyle(
                                        color: Color(0xff82225E)),
                                  ),
                                ),
                              ),
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: width / 12,
                            height: 40,
                            child: Center(
                                child: Container(
                              width: double.infinity,
                              height: 55,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0xff82225E),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Colors.white,
                                    ),
                                    items: [
                                      "افراد",
                                      "شركة",
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
                                    value: typeCustomer,
                                    onChanged: (val) {
                                      setState(() {
                                        typeCustomer = val;
                                      });
                                    },
                                    hint: const Text(
                                      "نوع العميل",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    dropdownColor: Colors.white,
                                    style: const TextStyle(
                                        color: Color(0xff82225E)),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: width / 12,
                        height: 40,
                        child: Center(
                            child: Container(
                          width: double.infinity,
                          height: 55,
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
                                style:
                                    const TextStyle(color: Color(0xff82225E)),
                              ),
                            ),
                          ),
                        )),
                      ),
                      Column(
                        children: [
                          SizedBox(
                            height: 40,
                            width: width / 12,
                            child: TextFormField(
                              controller: _shopSearch,
                              // textAlignVertical: TextAlignVertical.bottom,
                              maxLines: 1,
                              style: const TextStyle(
                                  fontSize: 16, color: Color(0xff82225E)),
                              onChanged: (textValue) {
                                setState(() {
                                  search = textValue;
                                });
                              },
                              decoration: InputDecoration(
                                fillColor: Colors.grey[100],
                                filled: true,
                                hintText: 'البحث',
                                prefixIcon: IconButton(
                                  icon: const Icon(Icons.search),
                                  color: Colors.grey[500],
                                  onPressed: () {},
                                ),
                                suffixIcon: (search == '')
                                    ? null
                                    : GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _shopSearch =
                                                TextEditingController(text: '');

                                            search = '';
                                          });
                                        },
                                        child: Icon(Icons.close,
                                            color: Colors.grey[500])),
                                focusedBorder: const UnderlineInputBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    borderSide:
                                        BorderSide(color: Color(0xff82225E))),
                                enabledBorder: const UnderlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff82225E)),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: width / 12,
                            height: 40,
                            child: Center(
                                child: Container(
                              width: double.infinity,
                              height: 55,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                      "1",
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
                                    value: numLine1,
                                    onChanged: (val) {
                                      setState(() {
                                        numLine1 = val;
                                      });
                                    },
                                    hint: const Text(
                                      "رقم الخط",
                                      style: TextStyle(
                                        color: Color(0xff82225E),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    dropdownColor: Colors.white,
                                    style: const TextStyle(
                                        color: Color(0xff82225E)),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          SizedBox(
                            width: width / 12,
                            height: 40,
                            child: Center(
                                child: Container(
                              width: double.infinity,
                              height: 55,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                  color: const Color(0xff82225E),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    icon: const Icon(
                                      Icons.arrow_drop_down_outlined,
                                      color: Colors.white,
                                    ),
                                    items: [
                                      "طلب جديد",
                                      "طلب استبدال",
                                      "طلب صيانة",
                                      "طلب مرتجع",
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
                                    value: typeOrder,
                                    onChanged: (val) {
                                      setState(() {
                                        typeOrder = val;
                                      });
                                    },
                                    hint: const Text(
                                      "نوع الطلب",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    dropdownColor: Colors.white,
                                    style: const TextStyle(
                                        color: Color(0xff82225E)),
                                  ),
                                ),
                              ),
                            )),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            width: width / 12,
                            height: 40,
                            child: Center(
                                child: Container(
                              width: double.infinity,
                              height: 55,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
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
                                      "100 طلب",
                                      "200 طلب",
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
                                    value: order,
                                    onChanged: (val) {
                                      setState(() {
                                        order = val;
                                      });
                                    },
                                    hint: const Text(
                                      "عرض",
                                      style: TextStyle(
                                        color: Color(0xff82225E),
                                      ),
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                    dropdownColor: Colors.white,
                                    style: const TextStyle(
                                        color: Color(0xff82225E)),
                                  ),
                                ),
                              ),
                            )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                DefaultTable(
                  columnData: dataTable,
                  color: ColorManager.second,
                  size: getProportionateScreenWidth(5),
                  icon: Image.asset(
                    ImageAssets.iconDropDown32,
                    width: 30,
                    height: 30,
                  ),
                  rows: data
                      .map((data) => DataRow(cells: [
                            DataCell(Text(
                              data['18'],
                            )),
                            DataCell(Text(
                              data['17'],
                            )),
                            DataCell(Text(
                              data['16'],
                            )),
                            DataCell(Text(
                              data['15'],
                            )),
                            DataCell(Text(
                              data['14'],
                            )),
                            DataCell(Text(
                              data['13'],
                            )),
                            DataCell(Text(
                              data['12'],
                            )),
                            DataCell(Text(
                              data['11'],
                            )),
                            DataCell(Text(
                              data['10'],
                            )),
                            DataCell(Text(
                              data['9'],
                            )),
                            DataCell(Text(
                              data['8'],
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
                            DataCell(
                              Container(
                                  color: const Color(0xff82225E),
                                  child: const Text(
                                    'تم الشحن',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                            DataCell(
                              Column(
                                children: const [
                                  Text('مستعمل'),
                                  Icon(
                                    Icons.notifications,
                                    color: Color(0xff82225E),
                                  )
                                ],
                              ),
                            ),
                            DataCell(Text(
                              data['2'],
                            )),
                            DataCell(
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text('0'),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      InkWell(
                                        child: Image.asset(
                                          ImageAssets.iconDropDown29,
                                          width: 20,
                                          height: 20,
                                        ),
                                        onTap: () {},
                                      ),
                                      Image.asset(
                                        ImageAssets.iconDropDown28,
                                        width: 20,
                                        height: 30,
                                      ),
                                      InkWell(
                                        child: Image.asset(
                                          ImageAssets.iconDropDown27,
                                          width: 20,
                                          height: 30,
                                        ),
                                        onTap: () {
                                          setState(() {
                                            visable = !visable;
                                          });
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            )
                          ]))
                      .toList(),
                ),
                visable
                    ? Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: Stack(children: [
                          Positioned(
                            right: width / 6,
                            child: CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 50,
                                child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        visable = false;
                                      });
                                    },
                                    child: const Icon(
                                      Icons.clear,
                                      size: 100,
                                      color: Colors.white,
                                    ))),
                          ),
                          Center(
                            child: Container(
                                width: 700,
                                height: 600,
                                decoration: const BoxDecoration(
                                    color: Color(0xff82225E),
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(400.0),
                                      topRight: Radius.circular(400.0),
                                      bottomLeft: Radius.circular(400.0),
                                      bottomRight: Radius.circular(400.0),
                                    ))),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 128.0),
                            child: Center(
                              child: Container(
                                width: 600,
                                height: 450,
                                decoration: const BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(300.0),
                                      topRight: Radius.circular(300.0),
                                      bottomLeft: Radius.circular(350.0),
                                      bottomRight: Radius.circular(350.0),
                                    )),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SizedBox(
                                          width:
                                              getProportionateScreenWidth(30),
                                          child: DefaultInputForm(
                                            hint: '',
                                            label: '',
                                            onTab: () {},
                                            validate: () {},
                                            onSave: () {},
                                            passFun: () {},
                                            obscureText: false,
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 15,
                                        ),
                                        const Text(
                                          'رقم الطلب',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18),
                                        ),
                                      ],
                                    ),
                                    DefaultTable(
                                      columnData: columnData1,
                                      size: getProportionateScreenWidth(5),
                                      color: ColorManager.primary,
                                      rows: data1
                                          .map((data) => DataRow(cells: [
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
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(left: 200.0),
                                      child: Row(
                                        children: [
                                          Image.asset(
                                            ImageAssets.iconDropDown29,
                                            width: 100,
                                            height: 100,
                                          ),
                                          Image.asset(
                                            ImageAssets.iconDropDown28,
                                            width: 100,
                                            height: 100,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ]),
                      )
                    : Container(),
                const SizedBox(
                  height: 100,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
