import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:flutter/material.dart';

class AddSup extends StatefulWidget {
  const AddSup({Key? key}) : super(key: key);

  @override
  State<AddSup> createState() => _AddSupState();
}

class _AddSupState extends State<AddSup> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      'العنوان',
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
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      'فئه المورد',
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
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      'الاسم',
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
                    )
                  ],
                ),
                 SizedBox(
                  width: getProportionateScreenWidth(50),
                ),
              ],
            ),
            const SizedBox(
              height: 60,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Column(
                  children: [
                    Text(
                      'تقييم السعر',
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
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      'تقييم المورد',
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
                    )
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                Column(
                  children: [
                    Text(
                      'رقم الهاتف',
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
                    )
                  ],
                ),
                 SizedBox(
                  width: getProportionateScreenWidth(50),
                ),
              ],
            ),
            const SizedBox(
              height: 200,
            ),
            Botton(
              color: ColorManager.white, title: 'اضافه', onTap: () {}, bgColor: ColorManager.black,),
          ],
        ),
      ),
    ));
  }
}
