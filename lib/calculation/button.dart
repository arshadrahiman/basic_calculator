import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final String text;
  final VoidCallback onTap;
  const MyButton({Key? key, required this.text, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Card(
          shape: const CircleBorder(),
          color: isOperator(text) ? Colors.orange : Colors.white,
          child: Center(
              child: text == 'D'
                  ? const Icon(
                      Icons.backspace,
                      color: Colors.white,
                    )
                  : Text(text,
                      style: TextStyle(
                        color: isOperator(text) ? Colors.white : Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 36,
                      ))),
        ));
  }

  bool isOperator(String value) {
    if (value == 'C' ||
        value == 'D' ||
        value == '%' ||
        value == '÷' ||
        value == 'x' ||
        value == '-' ||
        value == '+' ||
        value == '=') {
      return true;
    } else {
      return false;
    }
  }
}
