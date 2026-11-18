// EX 1 – The selectable button (handout page: EX 1). Start code from the handout.

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom buttons"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10,
            children: [
              SelectedButton(),
              SelectedButton(),
              SelectedButton(),
              SelectedButton(),
            ],
          ),
        ),
      ),
    ));

class SelectedButton extends StatefulWidget {
  const SelectedButton({
    super.key,
  });

  @override
  State<SelectedButton> createState() => _SelectedButtonState();
}

class _SelectedButtonState extends State<SelectedButton> {
  bool isSelected = false;

  void _handleSelectButton(){
    setState(() {
      isSelected = !isSelected;
    });
  }

  String get buttonText => isSelected ? "Selected" : "Not Selected";

  Color get backgroundColor => isSelected ? Colors.blue[500]! : Colors.blue[50]!;
  Color get textColor => isSelected ? Colors.white : Colors.black;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: 400,
          height: 100,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: backgroundColor,
              foregroundColor: textColor
            ),
              onPressed: _handleSelectButton,
              child: Center(
                child: Text(buttonText),
              )),
        );
  }
}
