import 'package:erb_system/resources/value_manager.dart';
import 'package:flutter/material.dart';

import '../../../color.dart';
import '../../../resources/color_manger.dart';

class DefaultInputForm extends StatelessWidget {
  DefaultInputForm(
      {Key? key,
      required this.hint,
      required this.label,
      required this.onTab,
      required this.validate,
      required this.onSave,
      required this.passFun,
      required this.obscureText,
      this.iconData,
      this.perFix,
      this.color})
      : super(key: key);
  String hint;
  String label;
  Function() onTab;
  Function() validate;
  Function() onSave;
  Function() passFun;
  bool obscureText;
  IconData? iconData;
  Color? color = ColorManager.primary;
  Widget? perFix;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText,
      validator: validate(),
      onSaved: onSave(),
      decoration: InputDecoration(
        hintStyle: const TextStyle(fontSize: 14),
        contentPadding: const EdgeInsets.symmetric(vertical: 5, horizontal: 30),
        label: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.symmetric(horizontal: 9),
            child: Text(
              label,
              textAlign: TextAlign.center,
              style: const TextStyle(color: Colors.white),
            )),
        suffixIcon: IconButton(
          icon: Icon(
            iconData,
            color: ColorManager.white,
          ),
          onPressed: () => passFun(),
        ),
        prefixIcon: perFix,
        filled: true,
        fillColor: color,
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
            borderSide: const BorderSide(color: Colors.black, width: 1.2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s15),
            borderSide: const BorderSide(color: Colors.black, width: 1.2)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppSize.s15),
          borderSide: const BorderSide(color: Colors.black, width: 1.2),
        ),
      ),
    );
  }
}
