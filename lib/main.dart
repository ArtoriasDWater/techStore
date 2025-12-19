import 'package:flutter/material.dart';
import 'screens/product_registration_screen.dart';
import 'screens/client_regitration_screen.dart';
import 'screens/order_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Ventas',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    ProductRegistrationScreen(),
    ClientRegitrationScreen(),
    OrderScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: IndexedStack(index: _selectedIndex, children: _widgetOptions),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedIndex,
          onTap: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.production_quantity_limits_sharp),
              label: 'Productos',
            ),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Cliente'),
            BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm),
              label: 'Orden',
            ),
          ],
        ),
      ),
    );
  }
}
