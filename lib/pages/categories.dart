import 'package:flutter/material.dart';

import 'package:goodbye_money/types/widgets.dart';

class Categories extends WidgetWithTitle {
  const Categories({Key? key}) : super(key: key, title: "Add");

  @override
  Widget build(BuildContext context) {
    return Text("Categories!");
  }
}
