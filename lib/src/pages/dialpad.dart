import 'package:flutter/material.dart';

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
    return Column(
      children: [
        Text(
          _phoneNumber,
          style: TextStyle(
            fontSize: 24.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton('1'),
            _buildNumberButton('2'),
            _buildNumberButton('3'),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton('4'),
            _buildNumberButton('5'),
            _buildNumberButton('6'),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildNumberButton('7'),
            _buildNumberButton('8'),
            _buildNumberButton('9'),
          ],
        ),
        SizedBox(height: 16.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _buildDeleteButton(),
            _buildNumberButton('0'),
            _buildDialButton(),
          ],
        ),
      ],
    );
  }

  Widget _buildNumberButton(String label) {
    return SizedBox(
      width: 64.0,
      height: 64.0,
      child: ElevatedButton(
        child: Text(label),
        onPressed: () {
          _onNumberPressed(label);
        },
      ),
    );
  }

  Widget _buildDeleteButton() {
    return SizedBox(
      width: 64.0,
      height: 64.0,
      child: ElevatedButton(
        child: Icon(Icons.backspace),
        onPressed: () {
          _onDeletePressed();
        },
      ),
    );
  }

  Widget _buildDialButton() {
    return SizedBox(
      width: 64.0,
      height: 64.0,
      child: ElevatedButton(
        child: Icon(Icons.phone),
        onPressed: () {
          // Your code here to initiate the call
        },
      ),
    );
  }
}
