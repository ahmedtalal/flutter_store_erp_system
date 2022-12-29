import 'package:erb_system/controller/controller.dart';
import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/size_config.dart';
import 'package:erb_system/view/home/components/appBar.dart';
import 'package:erb_system/view/home/components/default_botton.dart';
import 'package:erb_system/view/home/components/default_container.dart';
import 'package:erb_system/view/home/components/default_table.dart';
import 'package:erb_system/view/home/drop_down_par.dart';
import 'package:erb_system/view/store/store_dtails.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Stock extends StatelessWidget {
  Stock({Key? key}) : super(key: key);
  List data = [
    {
      "first_name": "مخزن مواد خام",
      "last_name": "500جنيه",
    },
    {
      "first_name": "مخزن مواد خام",
      "last_name": "500جنيه",
    },
    {
      "first_name": "مخزن مواد خام",
      "last_name": "500جنيه",
    },
    {
      "first_name": "مخزن مواد خام",
      "last_name": "500جنيه",
    },
    {
      "first_name": "مخزن مواد خام",
      "last_name": "500جنيه",
    },
  ];

  List<String> columnData = [
    "الرصيد",
    "المخزن",
  ];

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    var pro = Provider.of<Controller>(context);
    return SafeArea(
        child: Scaffold(
      body: Row(
        children: [
          Expanded(
              flex: 5,
              child: Stack(
                children: [  SizedBox(
                width: double.infinity,
                height: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 80,
                    ),
                    Padding(
                      padding: MediaQuery.of(context).size.width <= 500
                          ? const EdgeInsets.only(top: 180)
                          : const EdgeInsets.only(top: 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            data.length,
                                (index) => Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(bottom: 10),
                                  child: DefaultBotton(
                                    top: MediaQuery.of(context).size.width <= 500
                                        ? getProportionateScreenWidth(8)
                                        : getProportionateScreenWidth(2),
                                    right: getProportionateScreenWidth(5),
                                    title: 'تفاصيل',
                                    color: ColorManager.white,
                                    onTap: () {
                                      pro.changePage(StoreDetails());
                                    },
                                  ),
                                ),
                              ],
                            )),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        DefaultContainer(title: 'المخازن'),
                        const SizedBox(
                          height: 80,
                        ),
                        DefaultTable(
                          columnData: columnData,
                          size: getProportionateScreenWidth(10),
                          color: ColorManager.second,
                          rows: data
                              .map((data) => DataRow(cells: [

                            DataCell(Text(
                              data['last_name'],
                            )),
                            DataCell(Text(
                              data['first_name'],
                            )),
                          ]))
                              .toList(),
                        ),
                      ],
                    ),
                  ],
                ),
              ), DefaultAppBar()],
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
      )


    ));
  }
}
