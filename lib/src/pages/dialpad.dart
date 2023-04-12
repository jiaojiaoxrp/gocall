import 'package:flutter/material.dart';
import 'package:flutter_dialpad/flutter_dialpad.dart';

class DialPadPage extends StatefulWidget {
  const DialPadPage({super.key});

  @override
  State<DialPadPage> createState() => _DialPadPageState();
}

class _DialPadPageState extends State<DialPadPage> {
  String _phoneNumber = '';

  void _onNumberPressed(String value) {
    setState(() {
      _phoneNumber = _phoneNumber + value;
    });
  }

  void _onDeletePressed() {
    setState(() {
      _phoneNumber = _phoneNumber.substring(0, _phoneNumber.length - 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
            child: DialPad(
                enableDtmf: true,
                //outputMask: "(000) 000-0000",
                hideSubtitle: false,
                backspaceButtonIconColor: Colors.red,
                buttonTextColor: Colors.white,
                dialOutputTextColor: Colors.white,
                keyPressed: (value) {
                  print('$value was pressed');
                },
                makeCall: (number) {
                  print(number);
                })),
      ),
    );
  }
}
