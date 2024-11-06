// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class SplitCalculator extends StatelessWidget {
  final double currentSliderValue;
  final String splittedTotal;
  final String splittedBill;
  final void Function(double)? onChanged;

  const SplitCalculator(
      {super.key,
      required this.currentSliderValue,
      required this.splittedBill,
      required this.splittedTotal,
      required this.onChanged});

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Split:",
              ),
              SizedBox(
                width: 80,
                child: Text(
                  "Value: ${currentSliderValue.round()}",
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey),
                ),
              )
            ],
          ),
          SizedBox(
            height: 24.0,
          ),
          Slider(
            thumbColor: Colors.blue,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey[30],
            label: currentSliderValue.round().toString(),
            min: 1,
            max: 20,
            divisions: 19,
            value: currentSliderValue,
            onChanged: onChanged,
          ),
          SizedBox(
            height: 12,
          ),
          Divider(
            height: 30,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Split Tip:"),
              SizedBox(
                  width: 80,
                  child: Text(
                    "\$$splittedTotal",
                    textAlign: TextAlign.center,
                  ))
            ],
          ),
          Divider(
            height: 30,
            color: Colors.grey,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Split Total:"),
              SizedBox(
                  width: 80,
                  child: Text(
                    "\$$splittedBill",
                    textAlign: TextAlign.center,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
