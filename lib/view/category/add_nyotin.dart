import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:erb_system/view/home/components/botton.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:flutter/material.dart';

class AddNyotin extends StatefulWidget {
  const AddNyotin({Key? key}) : super(key: key);

  @override
  State<AddNyotin> createState() => _AddNyotinState();
}

class _AddNyotinState extends State<AddNyotin> {
  DateTime now = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              DefaultContainer(title: 'اضافه وحده قياس'),
              const SizedBox(
                height: 60,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Text(
                        'اسم الوحده',
                        style: getSemiBoldStyle(color: ColorManager.black),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: 200,
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
      ),
    ));
  }
}
