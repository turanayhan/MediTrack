import 'package:flutter/material.dart' hide NavigationBar;
import 'package:flutter/services.dart';
import 'package:hap_takip/features/add/view/add_medicine.dart';
import 'package:hap_takip/features/dashboard/widgets/custom_navigation_bar.dart';
import 'package:hap_takip/features/history/view/history.dart';
import 'package:hap_takip/features/home/view/home_page.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);


  @override
  State<Dashboard> createState() => _DashboardState();
}





class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;


  void initState() {
    super.initState();


  }



  static final List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    AddMedicine(),
    PillHistory(),
    const Text('Schedule Page'),
    const Text('Settings Page'),
  ];

  final List<Map<String, dynamic>> menuItems = [
    {'icon': Icons.home, 'label': 'Home'},
    {'icon': Icons.add, 'label': 'Add'},
    {'icon': Icons.history, 'label': 'History'},
    {'icon': Icons.calendar_today, 'label': 'Schedule'},
    {'icon': Icons.settings, 'label': 'Settings'},
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;


    });
  }






  @override
  Widget build(BuildContext context) {




    return Scaffold(
      backgroundColor: Color(0xFFF3F8FE),
      body: SafeArea(
        child: Column(

          children: [
            Expanded(
              child: Center(
                child: _widgetOptions[_selectedIndex],
              ),
            ),
            CustomNavigationBar(
              selectedIndex: _selectedIndex,
              onItemTapped: _onItemTapped,
              menuItems: menuItems,
            ),
          ],
        ),
      ),
    );

  }
}
