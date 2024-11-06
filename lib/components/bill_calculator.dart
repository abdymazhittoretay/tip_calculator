// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BillCalculator extends StatelessWidget {
  final TextEditingController billController;
  final TextEditingController tipController;

  final dynamic billValue;
  final dynamic tipPercent;
  final double totalValue;
  final double tipValue;

  final VoidCallback saveBIll;
  final VoidCallback saveTip;

  const BillCalculator(
      {super.key,
      required this.billController,
      required this.tipController,
      required this.billValue,
      required this.tipPercent,
      required this.tipValue,
      required this.totalValue,
      required this.saveBIll,
      required this.saveTip});

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
          tipPercentWidget(),
          Divider(
            height: 30,
            color: Colors.grey,
          ),
          tipTotal(),
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
        Text('Bill Total \$:'),
        SizedBox(
          width: 80,
          height: 30,
          child: TextField(
            controller: billController,
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
            onChanged: (value) {
              saveBIll();
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        )
      ],
    );
  }

  Widget tipPercentWidget() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tip %:'),
        SizedBox(
          width: 80,
          height: 30,
          child: TextField(
            controller: tipController,
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
            onChanged: (value) {
              saveTip();
            },
            onTapOutside: (event) {
              FocusManager.instance.primaryFocus?.unfocus();
            },
          ),
        )
      ],
    );
  }

  Widget tipTotal() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Tip Total:'),
        SizedBox(
          width: 80,
          child: Text(
            double.tryParse(billValue) != null &&
                    double.tryParse(tipPercent) != null
                ? "\$${tipValue.toStringAsFixed(2)}"
                : "\$0.0",
            textAlign: TextAlign.center,
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
        SizedBox(
          width: 80,
          child: Text(
            double.tryParse(billValue) != null &&
                    double.tryParse(tipPercent) != null
                ? "\$${totalValue.toStringAsFixed(2)}"
                : "\$0.0",
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
