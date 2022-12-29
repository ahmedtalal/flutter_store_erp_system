import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';

import '../../../resources/color_manger.dart';
import '../../../resources/style_manager.dart';


class DefaultTable extends StatelessWidget {
  DefaultTable({Key? key, required this.columnData, required this.rows,this.icon,this.color,this.size});

  List<String> columnData;
  List<DataRow> rows;
  Widget? icon ;
  double? size=56;
  Color? color=ColorManager.second;

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columnSpacing: size,
        headingRowHeight: 80,
        border: const TableBorder(
            top: BorderSide(color: Colors.black, width: 1.5),
            right: BorderSide(color: Colors.black, width: 1.5),
            bottom: BorderSide(color: Colors.black, width: 1.5),
            left: BorderSide(color: Colors.black, width: 1.5),
            horizontalInside: BorderSide(color: Colors.black, width: 1.5),
            verticalInside: BorderSide(color: Colors.black, width: 1.5)),
        headingRowColor: MaterialStateProperty.all(color),
        columns: List.generate(
            columnData.length,
                (index) => DataColumn(
                label: Flexible(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(columnData[index],
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          textAlign: TextAlign.center,
                          style: getSemiBoldStyle(color: Colors.white,fontSize: getProportionateScreenWidth(5))),
                      icon ??Container(),
                    ],
                  ),
                ),
                tooltip: '')),
        rows: rows);
  }
}
