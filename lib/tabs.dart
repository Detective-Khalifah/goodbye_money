import 'package:flutter/material.dart';

class TabsController extends StatefulWidget {
  TabsController({Key? key}) : super(key: key);

  // const TabsController({ super.key });

  @override
  // _TabsControllerState createState() => _TabsControllerState();
  State<TabsController> createState() => _TabsControllerState();
}

class _TabsControllerState extends State<TabsController> {
  var _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Expenses $_selectedIndex"),
        ),
        body: Text(""),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.paid), label: 'Expenses'),
            BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add'),
            BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'Reports'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          // type: BottomNavigationBarType.shifting,
          // selectedItemColor: Colors.white,
          // unselectedItemColor: Colors.white,
        ),
      ),
    );
  }
}
