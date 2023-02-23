import 'package:flutter/material.dart';

import 'package:goodbye_money/types/widgets.dart';

class Settings extends WidgetWithTitle {
  const Settings({Key? key}) : super(key: key, title: "Expenses");

  @override
  Widget build(BuildContext context) {
    return Text("Settings!");
  }
}
