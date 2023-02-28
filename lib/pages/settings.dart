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

  void _showAlertDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
        context: context,
        builder: (BuildContext context) => CupertinoAlertDialog(
              title: const Text('Are you sure?'),
              content: const Text('This action cannot be undone'),
              actions: <CupertinoDialogAction>[
                CupertinoDialogAction(
                    isDefaultAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Cancel')),
                CupertinoDialogAction(
                    isDestructiveAction: true,
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Erase data')),
              ],
            ));
  }

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
                  case 1:
                    _showAlertDialog(context);
                    break;
                }
              },
              child: DecoratedBox(
                decoration: BoxDecoration(),
                child: CupertinoFormRow(
                  prefix: Text(
                    items[index].label,
                    style: TextStyle(
                      color: items[index].isDestructive
                          ? Colors.red
                          : Colors.white,
                    ),
                  ),
                  helper: null,
                  padding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
                  child: items[index].isDestructive
                      ? Container()
                      : const Icon(Icons.keyboard_arrow_right_sharp),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
