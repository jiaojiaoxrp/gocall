import 'package:flutter/material.dart';


class CallPage extends StatefulWidget {
  const CallPage({super.key});

  @override
  State<CallPage> createState() => _CallPageState();
}



class _CallPageState extends State<CallPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("通话记录"),
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
