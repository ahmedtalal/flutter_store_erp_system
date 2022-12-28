import 'package:erb_system/resources/color_manger.dart';
import 'package:erb_system/resources/style_manager.dart';
import 'package:erb_system/size_config.dart';
import 'package:flutter/material.dart';

class DefaultTable extends StatelessWidget {
  DefaultTable({Key? key, required this.columnData,required this.rows,this.size,this.color});

  List<String> columnData;
  List<DataRow> rows;
  double? size=56.0;
  Color? color=ColorManager.second;


  @override
  Widget build(BuildContext context) {
    return DataTable(
      columnSpacing: size,
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
              label: Center(
                child: Text(columnData[index],
                    textAlign: TextAlign.center,
                    style: getSemiBoldStyle(color: ColorManager.white,fontSize: getProportionateScreenWidth(4))),
              ),
              tooltip: '')),
      rows:rows
    );
  }
}
