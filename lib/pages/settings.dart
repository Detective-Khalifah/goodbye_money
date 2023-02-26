import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:goodbye_money/types/widgets.dart';
import 'package:goodbye_money/pages/categories.dart';

class Item {
  final String label;
  final bool isDestructive;

  const Item(this.label, this.isDestructive);
}

const items = [
  Item('Categories', false),
  Item('Erase all data', true),
];

class Settings extends WidgetWithTitle {
  const Settings({Key? key}) : super(key: key, title: "Expenses");

  void handleEraseData() {}

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      // padding: const EdgeInsets.all(16),
      height: 147,
      // double.infinity,
      width: double.infinity,
      transformAlignment: Alignment.center,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 28, 28, 30),
          borderRadius: BorderRadius.circular(16),
        ),
        child: CupertinoFormSection.insetGrouped(
          children: List.generate(
            items.length,
            (index) => GestureDetector(
              onTap: () {
                switch (index) {
                  case 0:
                    Navigator.push(
                        context,
                        CupertinoPageRoute(
                            builder: (context) => const Categories()));
                    break;
                }
              },
              child: DecoratedBox(
                decoration: BoxDecoration(),
                child: CupertinoFormRow(
                  prefix: Text(
                    items[index].label,
                    style: TextStyle(
                      color:
                      items[index].isDestructive ? Colors.red : Colors.white,
                    ),
                  ),
                  helper: null,
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: items[index].isDestructive
                      ? Container()
                      : const Icon(Icons.keyboard_arrow_right_sharp),
                ),
              )
            ),
          ),
        ),
      ),
    );
  }
}

// ListView(
// children: <Widget>[
// ListTile(
// title: Text("Categories"),
// trailing: Icon(Icons.keyboard_arrow_right_sharp),
// onTap: () {
// Navigator.push(context, MaterialPageRoute(
// builder: (context) => Categories(),
// ));
// }
// ),
// ListTile(
// title: Text(
// "Erase all data",
// style: TextStyle(color: Colors.red),
// ),
// trailing: Icon(Icons.keyboard_arrow_right_sharp),
// onTap: handleEraseData,
// ),
// ],
// ),
