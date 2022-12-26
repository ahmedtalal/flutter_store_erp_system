import 'package:erb_system/resources/color_manger.dart';
import 'package:flutter/material.dart';

import '../../../resources/assets_manager.dart';

class HomeTap extends StatelessWidget {
  HomeTap({Key? key}) : super(key: key);

  List<String> title = [
    'الطلبات',
    'المصروفات',
    'المشتريات',
    'الاشعارات',
    'تقرير المخزون',
    'حساب المندوبين \nوشركات الشحن',
  ];
  List<String> image = [
    ImageAssets.iconDropDown16,
    ImageAssets.iconDropDown17,
    ImageAssets.iconDropDown7,
    ImageAssets.iconDropDown18,
    ImageAssets.iconDropDown3,
    ImageAssets.iconDropDown6,
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 90),
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Text(
                'الصفحه الرئيسه',
                style: TextStyle(fontSize: 25, color: Colors.white),
              ),
            ),
            SizedBox(height: 30,),
            SizedBox(
              width: 660,
              height: 880,
              child: GridView.count(
                childAspectRatio: 1.3,
                crossAxisCount: 3,
                crossAxisSpacing: 50,
                mainAxisSpacing: 50,
                padding: const EdgeInsets.all(10.0),
                children: List.generate(
                    title.length,
                    (index) => Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: ColorManager.primary,
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                title[index],
                                style: const TextStyle(
                                    fontSize: 18, color: Colors.white),
                              ),
                              Image.asset(
                                image[index],
                                width: 80,
                                height: 80,
                              )
                            ],
                          ),
                        )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
