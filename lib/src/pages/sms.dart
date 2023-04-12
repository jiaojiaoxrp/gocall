import 'package:flutter/material.dart';


class SMSPage extends StatefulWidget {
  const SMSPage({super.key});

  @override
  State<SMSPage> createState() => _SMSPageState();
}



class _SMSPageState extends State<SMSPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("短信"),
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
