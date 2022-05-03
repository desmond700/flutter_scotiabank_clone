import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_scotiabank_clone/helpers/helpers.dart';
import 'package:flutter_scotiabank_clone/pages/home/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  static const id = "login_page";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late TextEditingController cardNumberController;
  late TextEditingController passwordController;

  @override
  void initState() {
    cardNumberController = TextEditingController();
    passwordController = TextEditingController();

    super.initState();
  }

  @override
  void dispose() {
    cardNumberController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarColor: Helpers.appColor,
        statusBarBrightness: Brightness.light
      ),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(top: 50.0, left: 30.0, right: 30.0, bottom: 105),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 50,
                child: Row(
                  children: const [
                    Text(
                      "Scotiabank",
                      style: TextStyle(
                        color: Helpers.appColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      _buildLoginTextField(
                          controller: cardNumberController,
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: Colors.black,
                          ),
                          hintText: "Card number",
                          suffixIcon: const Icon(CupertinoIcons.chevron_down,
                              color: Colors.black, size: 20.0)),
                      const SizedBox(height: 18),
                      _buildLoginTextField(
                        controller: passwordController,
                        prefixIcon: const Icon(
                          Icons.lock_outline,
                          color: Colors.black,
                        ),
                        hintText: "Password",
                      ),
                      const SizedBox(height: 25),
                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "Forgot your username or password?",
                          style: TextStyle(
                              color: Helpers.appColor,
                              fontSize: 15.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      const SizedBox(height: 53),
                      TextButton(
                        onPressed: () => Navigator.of(context).pushNamed(HomePage.id),
                        style: TextButton.styleFrom(
                          backgroundColor:Helpers.appColor,
                          padding: const EdgeInsets.symmetric(vertical: 17),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)
                          )
                        ),
                        child: const Center(
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white, 
                              fontSize: 17
                            ),
                          ),
                        )
                      )
                    ],
                  ),
                ),
              )
            ]
          ),
        ),
      ),
    );
  }

  TextField _buildLoginTextField(
      {
        required TextEditingController controller,
        required Widget prefixIcon,
        required String hintText,
        Widget? suffixIcon
      }
    ) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.visiblePassword,
      cursorColor: Colors.purple,
      // cursorHeight: 27,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Colors.grey, 
          fontSize: 16.0
        ),
        border: const UnderlineInputBorder(),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, 
            width: 1
          )
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.purple, 
            width: 2
          )
        ),
        suffixIcon: suffixIcon
      )
    );
  }
}
