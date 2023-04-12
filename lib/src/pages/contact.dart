import 'package:flutter/material.dart';


class ContactPage extends StatefulWidget {
  const ContactPage({super.key});

  @override
  State<ContactPage> createState() => _ContactPageState();
}



class _ContactPageState extends State<ContactPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("联系人"),
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
