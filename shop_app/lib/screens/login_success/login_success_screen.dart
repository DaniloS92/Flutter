import 'package:flutter/material.dart';
import 'package:shop_app/screens/login_success/components/body.dart';

class LogginSuccessScreen extends StatelessWidget {
  static String ruteName = "/login_success";
  const LogginSuccessScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: SizedBox(),
        title: Text("Login Success"),
      ),
      body: Body(),
    );
  }
}
