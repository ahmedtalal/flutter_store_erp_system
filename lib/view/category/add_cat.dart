import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/drop_down.dart';
import 'package:flutter/material.dart';

class AddCat extends StatefulWidget {
  const AddCat({Key? key}) : super(key: key);

  @override
  State<AddCat> createState() => _AddCatState();
}

class _AddCatState extends State<AddCat> {
  DateTime now = DateTime.now();
  String? chose1;
  String? chose2;
  String? chose3;

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              DefaultContainer(title: 'اضافة صنف'),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: getProportionateScreenWidth(60),
                    height: 80,
                    padding: const EdgeInsets.only(top: 35),
                    child: dropDown(
                      const ['كيلو', 'متر', "قطعه", "لوح"],
                      selectTalab: chose1,
                      onchanged: () => (val) {
                        setState(() {
                          chose1 = val;
                        });
                      },
                      label: 'وحده القياس',
                      foColor: Colors.white,
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                  Container(
                    width: getProportionateScreenWidth(70),
                    height: 80,
                    padding: const EdgeInsets.only(top: 35),
                    child: dropDown(
                      const ['مواد خام', 'منتج تحت التشغيل', "منتج تام"],
                      selectTalab: chose2,
                      onchanged: () => (val) {
                        setState(() {
                          chose2 = val;
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
                        'الاسم',
                        style: getSemiBoldStyle(color: ColorManager.black,fontSize: getProportionateScreenWidth(5)),
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
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(
                        'الحد الادني للمخزون',
                        style: getSemiBoldStyle(color: ColorManager.black,fontSize: getProportionateScreenWidth(5)),
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
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Text(
                        'الرصيد الافتتاحي',
                        style: getSemiBoldStyle(color: ColorManager.black,fontSize: getProportionateScreenWidth(5)),
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
                  const SizedBox(
                    width: 50,
                  ),
                  Column(
                    children: [
                      Text(
                        'السعر',
                        style: getSemiBoldStyle(color: ColorManager.black,fontSize: getProportionateScreenWidth(5)),
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
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 200,
                    height: 80,
                    padding: const EdgeInsets.only(top: 35),
                    child: dropDown(
                      const ['مفروشات', 'منتجات شاطئ', "اثاث", "ديكور"],
                      selectTalab: chose3,
                      onchanged: () => (val) {
                        setState(() {
                          chose3 = val;
                        });
                      },
                      label: 'فرع الانتاج',
                      foColor: Colors.white,
                      bgColor: ColorManager.primary,
                      dpColor: ColorManager.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 50,
                  ),
                ],
              ),
              const SizedBox(
                height: 100,
              ),
              Botton(
                color: ColorManager.white, title: 'اضافه', onTap: () {}, bgColor: ColorManager.black,),
            ],
          ),
        ),
      ),
    ));
  }
}
