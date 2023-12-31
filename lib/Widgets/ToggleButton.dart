import 'package:flutter/material.dart';

class ToggleButton extends StatelessWidget {
  const ToggleButton(
      {super.key,
        required this.onPressed,
        required this.title,
        required this.selected});

  final Function() onPressed;
  final String title;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 8),
            child: ElevatedButton(
                onPressed: onPressed,
                style: ButtonStyle(
                    backgroundColor: selected
                        ? MaterialStateProperty.all(Colors.red)
                        : null),
                child: Text(title,
                    style: TextStyle(
                        color:
                        selected ? Colors.white : Colors.red)))));
  }
}
