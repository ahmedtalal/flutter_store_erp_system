import 'package:erb_system/view/auth/component/text_fom_feild.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool isVisible = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/1.png',
              height: 200,
            ),
            SizedBox(
              width: 380,
              child: DefaultInputForm(
                  hint: 'Username',
                  label: 'Username',
                  onTab: () {},
                  validate: () {},
                  passFun: () {},
                  onSave: () {},
                  obscureText: false),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              width: 380,
              child: DefaultInputForm(
                  hint: 'Password',
                  label: 'Password',
                  onTab: () {},
                  validate: () {},
                  onSave: () {},
                  passFun: () {
                    setState(() {
                      isVisible = !isVisible;
                    });
                    print(isVisible);
                  },
                  iconData: Icons.remove_red_eye,
                  obscureText: isVisible),
            ),
            const SizedBox(
              height: 25,
            ),
            MaterialButton(
              onPressed: () {},
              color: Colors.black,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              child: const Padding(
                padding: EdgeInsets.all(12.0),
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'poppins',
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
