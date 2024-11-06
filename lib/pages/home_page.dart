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

  dynamic _billValue = "";
  dynamic _tipPercent = "";
  double _totalValue = 0.0;

  double _currentSliderValue = 1.0;
  String _splittedTip = "0.0";
  String _splittTotal = "0.0";

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
      body: SingleChildScrollView(
        child: Column(
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
              billValue: _billValue,
              tipPercent: _tipPercent,
              totalValue: _totalValue,
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
            SplitCalculator(
              currentSliderValue: _currentSliderValue,
              splittedBill: _splittTotal,
              splittedTotal: _splittedTip,
              onChanged: newValue,
            )
          ],
        ),
      ),
    );
  }

  // Functions:
  void calculateTotal() {
    _totalValue = _billValue + (_billValue * (_tipPercent / 100));
    _billValue = _billController.text;
    _tipPercent = _tipController.text;
  }

  void saveBIll() {
    setState(() {
      _billValue = _billController.text;
      if (double.tryParse(_billValue) != null &&
          double.tryParse(_tipPercent) != null) {
        _billValue = double.parse(_billValue);
        _tipPercent = double.parse(_tipPercent);
        calculateTotal();
        splitTotal();
        splitTip();
      }
    });
  }

  void saveTip() {
    setState(() {
      _tipPercent = _tipController.text;
      if (double.tryParse(_tipPercent) != null &&
          double.tryParse(_tipPercent) != null) {
        _billValue = double.parse(_billValue);
        _tipPercent = double.parse(_tipPercent);
        calculateTotal();
        splitTotal();
        splitTip();
      }
    });
  }

  void newValue(value) {
    setState(() {
      _currentSliderValue = value;
      if (double.tryParse(_tipPercent) != null &&
          double.tryParse(_tipPercent) != null) {
        splitTotal();
        splitTip();
      }
    });
  }

  void splitTotal() {
    _splittTotal = (_totalValue / _currentSliderValue).toStringAsFixed(2);
  }

  void splitTip() {
    _splittedTip = (double.parse(_billValue) *
            (double.parse(_tipPercent) / 100) /
            _currentSliderValue)
        .toStringAsFixed(2);
  }
}
