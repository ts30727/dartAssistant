import 'package:dart_assistant/DataModels/Multipliers.dart';
import 'package:flutter/material.dart';
import 'ToggleButton.dart';

class NumberGrid extends StatefulWidget {
  const NumberGrid({super.key, required this.onNumClick});

  final Function(int, Multipliers) onNumClick;

  @override
  State<NumberGrid> createState() => _NumberGrid();
}

class _NumberGrid extends State<NumberGrid> {
  Multipliers _multiplier = Multipliers.none;

  setMultiplier(Multipliers multiplier) {
    setState(() {
      _multiplier = multiplier;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Wrap(children: [
      Row(children: [
        ToggleButton(
            onPressed: () {
              if (_multiplier == Multipliers.double) {
                setMultiplier(Multipliers.none);
              } else {
                setMultiplier(Multipliers.double);
              }
            },
            title: "x2",
            selected: _multiplier == Multipliers.double),
        ToggleButton(
            onPressed: () {
              if (_multiplier == Multipliers.triple) {
                setMultiplier(Multipliers.none);
              } else {
                setMultiplier(Multipliers.triple);
              }
            },
            title: "x3",
            selected: _multiplier == Multipliers.triple),
      ]),
      SizedBox(
          height: 400,
          child: GridView.count(
            crossAxisCount: 5,
            children: List.generate(20, (index) {
              return TextButton(
                  onPressed: () {
                    widget.onNumClick(index + 1, _multiplier);
                  },
                  child: Text((index + 1).toString()));
            }),
          )),
    ]);
  }
}
