import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("账号"),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Center(
              child: Column(
                children: <Widget>[
                  Text(
                      'GitHub:\nhttps://github.com/cloudwebrtc/dart-sip-ua.git')
                ],
              ),
            ),
          ),
        ));
  }
}
