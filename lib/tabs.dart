import 'package:flutter/material.dart';

import 'package:goodbye_money/pages/add.dart';
import 'package:goodbye_money/pages/expenses.dart';
import 'package:goodbye_money/pages/reports.dart';
import 'package:goodbye_money/pages/settings.dart';
import 'package:goodbye_money/types/widgets.dart';

class TabsController extends StatefulWidget {
  TabsController({Key? key}) : super(key: key);

  // const TabsController({ super.key });

  @override
  // _TabsControllerState createState() => _TabsControllerState();
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  var _selectedIndex = 0;

  static const List<WidgetWithTitle> _pages = [
    Expenses(),
    Reports(),
    Add(),
    Settings(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text("${_pages[_selectedIndex].title}"),
        backgroundColor: Colors.black,
      ),
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        currentIndex: _selectedIndex,
        fixedColor: Colors.blue,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.paid),
            label: 'Expenses',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'Reports',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Add',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: _onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
