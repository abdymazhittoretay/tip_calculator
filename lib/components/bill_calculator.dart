// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

class BillCalculator extends StatelessWidget {
  const BillCalculator({super.key});

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
          width: 70,
          height: 30,
          child: TextField(
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
          width: 70,
          height: 30,
          child: TextField(
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
            width: 70,
            child: Text(
              "152",
              textAlign: TextAlign.center,
            ))
      ],
    );
  }
}
