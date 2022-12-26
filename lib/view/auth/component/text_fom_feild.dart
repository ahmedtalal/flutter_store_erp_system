import 'package:flutter/material.dart';

import '../../../color.dart';
import '../../../resources/color_manger.dart';

class DefaultInputForm extends StatelessWidget {
  DefaultInputForm({
    Key? key,
    required this.hint,
    required this.label,
    required this.onTab,
    required this.validate,
    required this.onSave,
    required this.obscureText,
  }) : super(key: key);
  String hint;
  String label;
  Function() onTab;
  Function() validate;
  Function() onSave;
  bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validate(),
      onSaved: onSave(),
      keyboardType: TextInputType.visiblePassword,
      obscureText: obscureText,
      decoration: InputDecoration(
        label:  Center(
          child: Text(label,style: const TextStyle(
            fontFamily: 'poppins',
            fontSize: 15,
            color: Colors.white,
          ),),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black, width: 1.2)),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(25),
            borderSide: const BorderSide(color: Colors.black, width: 1.2)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
          borderSide: const BorderSide(color: Colors.black, width: 1.2),
        ),
        filled: true,
        fillColor: ColorManager.primary,
      ),
    );
  }
}
