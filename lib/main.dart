import 'package:flutter/material.dart';
import 'package:flutter_scotiabank_clone/pages/bills/bills_page.dart';
import 'package:flutter_scotiabank_clone/pages/e-transfer/e_transfer_page.dart';
import 'package:flutter_scotiabank_clone/pages/home/home_page.dart';
import 'package:flutter_scotiabank_clone/pages/login/login_page.dart';
import 'package:flutter_scotiabank_clone/pages/transfer_between_accounts/transfer_between_accounts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.red,
          scaffoldBackgroundColor: Colors.white),
      routes: {
        LoginPage.id: (_) => const LoginPage(),
        HomePage.id: (_) => const HomePage(),
        // ETransferPage.id: (_) => const ETransferPage(),
      },
      initialRoute: LoginPage.id
    );
  }
}
