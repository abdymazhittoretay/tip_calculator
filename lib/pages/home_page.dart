// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:tip_calculator/components/bill_calculator.dart';
import 'package:tip_calculator/components/split_calculator.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController _billController = TextEditingController();
  final TextEditingController _tipController = TextEditingController();

  dynamic billValue = "";
  dynamic tipValue = "";
  double totalValue = 0.0;

  @override
  Widget build(BuildContext context) {
    var primaryColor = Theme.of(context).primaryColor;
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: Text(
          'Tip Calculator',
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text(
              'BILL CALCULATOR',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          BillCalculator(
            billController: _billController,
            tipController: _tipController,
            billValue: billValue,
            tipValue: tipValue,
            totalValue: totalValue,
            saveBIll: saveBIll,
            saveTip: saveTip,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 32.0),
            child: Text(
              'SPLIT CALCULATOR',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          SplitCalculator()
        ],
      ),
    );
  }

  // Functions:
  void calculateTotal() {
    totalValue = billValue + (billValue * (tipValue / 100));
    billValue = _billController.text;
    tipValue = _tipController.text;
  }

  void saveBIll() {
    setState(() {
      billValue = _billController.text;
      if (double.tryParse(billValue) != null &&
          double.tryParse(tipValue) != null) {
        billValue = double.parse(billValue);
        tipValue = double.parse(tipValue);
        calculateTotal();
      }
    });
  }

  void saveTip() {
    setState(() {
      tipValue = _tipController.text;
      if (double.tryParse(tipValue) != null &&
          double.tryParse(tipValue) != null) {
        billValue = double.parse(billValue);
        tipValue = double.parse(tipValue);
        calculateTotal();
      }
    });
  }
}
