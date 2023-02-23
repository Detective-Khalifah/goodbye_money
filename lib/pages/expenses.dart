import 'package:flutter/material.dart';

import 'package:goodbye_money/types/widgets.dart';

class Expenses extends WidgetWithTitle {
  const Expenses({Key? key}) : super(key: key, title: "Expenses");

  @override
  Widget build(BuildContext context) {
    return Text("Expenses!");
  }
}
