import 'package:erb_system/resources/assets_manager.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';

class ConfirmIndus extends StatefulWidget {
  const ConfirmIndus({Key? key}) : super(key: key);

  @override
  State<ConfirmIndus> createState() => _ConfirmIndusState();
}

class _ConfirmIndusState extends State<ConfirmIndus> {
  String? chose1;
  String? chose2;
  int? selectedIndex;

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
                  DefaultContainer(title: 'تأكيد امر التصنيع'),
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
                            'اجمالي التكلفه',
                            style: getSemiBoldStyle(color: ColorManager.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width:getProportionateScreenWidth(50),
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
                      SizedBox(
                        width: getProportionateScreenWidth(20),
                      ),
                      Column(
                        children: [
                          Text(
                            'الكميه',
                            style: getSemiBoldStyle(color: ColorManager.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width:getProportionateScreenWidth(50),
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
                            'اسم المنتج',
                            style: getSemiBoldStyle(color: ColorManager.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width:getProportionateScreenWidth(50),
                            height: 60,
                            child: DefaultInputForm(
                              hint: '',
                              label: '',
                              onTab: () {},
                              validate: () {},
                              onSave: () {},
                              passFun: () {},
                              perFix: const Icon(Icons.search),
                              color: Colors.grey,
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
                          const ['منتج تحت التشغيل', 'منتج تام'],
                          selectTalab: chose1,
                          onchanged: () => (val) {
                            setState(() {
                              chose1 = val;
                            });
                          },
                          label: 'نوع المنتج',
                          foColor: Colors.white,
                          bgColor: ColorManager.primary,
                          dpColor: ColorManager.primary,
                        ),
                      ),
                       SizedBox(width: getProportionateScreenWidth(1),),
                    ],
                  ),
                  const SizedBox(
                    height: 90,
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
                            'التاريخ',
                            style: getSemiBoldStyle(color: ColorManager.black),
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
                      Column(
                        children: [
                          Text(
                            'اضافه خاصه للعميل',
                            style: getSemiBoldStyle(color: ColorManager.black),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            width:getProportionateScreenWidth(50),
                            height: 60,
                            child: DefaultInputForm(
                              hint: '',
                              label: '',
                              onTab: () {},
                              validate: () {},
                              onSave: () {},
                              passFun: () {},
                              perFix: const Icon(Icons.search),
                              color: Colors.grey,
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
                          const ['تم التصنيع', 'في التصنيع'],
                          selectTalab: chose2,
                          onchanged: () => (val) {
                            setState(() {
                              chose2 = val;
                            });
                          },
                          label: 'حاله التصنيع',
                          foColor: Colors.white,
                          bgColor: ColorManager.primary,
                          dpColor: ColorManager.primary,
                        ),
                      ),
                      SizedBox(width: getProportionateScreenWidth(1),),
                    ],
                  ),
                  const SizedBox(height: 20,),
                ],
              ),
            ),
          ),
        ));
  }
}
