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
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text("Expenses $_selectedIndex"),
        ),
        body: const TabBarView(
          children: [
            Icon(Icons.directions_car),
            Icon(Icons.directions_transit),
            Icon(Icons.directions_bike),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.call), label: 'Calls'),
            BottomNavigationBarItem(icon: Icon(Icons.camera), label: 'Camera'),
            BottomNavigationBarItem(icon: Icon(Icons.chat), label: 'Chats'),
          ],
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}
