// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BillCalculator extends StatefulWidget {
  const BillCalculator({super.key});

  @override
  State<BillCalculator> createState() => _BillCalculatorState();
}

class _BillCalculatorState extends State<BillCalculator> {
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _tipController = TextEditingController();

  dynamic billValue = "";
  dynamic tipValue = "";

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
          billTotal(),
          Divider(
            height: 30,
            color: Colors.grey,
          ),
          tipPercent(),
          Divider(
            height: 30,
            color: Colors.grey,
          ),
          total()
        ],
      ),
    );
  }

  Widget billTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Bill Total:'),
        SizedBox(
          width: 80,
          height: 30,
          child: TextField(
            controller: _billController,
            cursorHeight: 15,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
            onSubmitted: (value) {
              setState(() {
                billValue = _billController.text;
              });
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        )
      ],
    );
  }

  Widget tipPercent() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tip %:'),
        SizedBox(
          width: 80,
          height: 30,
          child: TextField(
            controller: _tipController,
            cursorHeight: 15,
            textAlign: TextAlign.center,
            decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                border: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey)),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey))),
            onSubmitted: (value) {
              setState(() {
                tipValue = _tipController.text;
              });
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        )
      ],
    );
  }

  Widget total() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Total:'),
        Text(
          "$billValue $tipValue",
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
