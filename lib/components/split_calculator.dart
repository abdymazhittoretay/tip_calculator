// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SplitCalculator extends StatefulWidget {
  const SplitCalculator({super.key});

  @override
  State<SplitCalculator> createState() => _SplitCalculatorState();
}

class _SplitCalculatorState extends State<SplitCalculator> {
  double _currentSliderValue = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(8.0)),
      margin: EdgeInsets.all(16.0),
      padding: EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Split: ${_currentSliderValue.round()}",
          ),
          SizedBox(
            height: 12.0,
          ),
          Slider(
            thumbColor: Colors.blue,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey[30],
            label: _currentSliderValue.round().toString(),
            max: 10,
            divisions: 10,
            value: _currentSliderValue,
            onChanged: (value) {
              setState(() {
                _currentSliderValue = value;
              });
            },
          ),
        ],
      ),
    );
  }
}
