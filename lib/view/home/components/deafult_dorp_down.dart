import 'package:flutter/material.dart';

class DefaultDropDown extends StatelessWidget {
  DefaultDropDown(
      {Key? key,
      required this.item,
      required this.title,
      required this.imageUrl})
      : super(key: key);

  List<String> item;
  String title;
  String imageUrl;

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        trailing: Image.asset(imageUrl),
        title: Center(
          child: Text(
            title,
            style: const TextStyle(fontSize: 20.0,color: Colors.white),
          ),
        ),
        leading: Image.asset("assets/images/15.png"),
        children: [
          for (var i in item)
            ListTile(
              title: Text(i,style:TextStyle(fontSize: 20,color: Colors.white),),
            ),
        ]);
  }
}
