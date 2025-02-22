import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, // Remove the debug banner
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0; // To track the selected tab

  // List of widgets for each page in BottomNavigationBar
  static const List<Widget> _widgetOptions = <Widget>[
    Center(child: Text('Home Page', style: TextStyle(fontSize: 30))),
    Center(child: Text('Search Page', style: TextStyle(fontSize: 30))),
    Center(child: Text('Settings Page', style: TextStyle(fontSize: 30))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index; // Update the selected index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        backgroundColor: Colors.grey[100], // Very light grey background
        child: ListView(
          padding: EdgeInsets.zero, // Remove default padding
          children: [
            // Drawer Header with Gradient
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.amber.shade400, // Lighter amber
                    Colors.pink.shade700, // Darker amber
                  ],
                ),
              ),
              child: const UserAccountsDrawerHeader(
                decoration: BoxDecoration(
                  color:
                      Colors
                          .transparent, // Make the header background transparent
                ),
                accountName: Text(
                  "My Contacts",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 18, // Slightly larger text
                  ),
                ),
                accountEmail: null, // No email, as it's not a user
                currentAccountPicture: CircleAvatar(
                  backgroundColor: Colors.white,
                  child: Icon(
                    Icons.people_alt_rounded,
                    size: 40,
                    color: Colors.amber,
                  ),
                ),
              ),
            ),

            // Devices Section
            ListTile(
              leading: Icon(
                Icons.phone_android,
                color: Colors.amber[700],
              ), // Device icon
              title: const Text("Device 1", style: TextStyle(fontSize: 15)),
              trailing: const Text(
                "1",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(
                Icons.phone_iphone,
                color: Colors.amber[700],
              ), // Device icon
              title: const Text("Device 2", style: TextStyle(fontSize: 15)),
              trailing: const Text(
                "2",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
              onTap: () {},
            ),
            const SizedBox(height: 10), // Add some space
            const Divider(),
            ListTile(
              leading: Icon(Icons.settings, color: Colors.amber[700]),
              title: const Text("Settings", style: TextStyle(fontSize: 15)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.help, color: Colors.amber[700]),
              title: const Text("Help", style: TextStyle(fontSize: 15)),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.info, color: Colors.amber[700]),
              title: const Text("About", style: TextStyle(fontSize: 15)),
            ),
          ],
        ),
      ),
      appBar: AppBar(
        title: const Text('AdvanceUI'),
        backgroundColor: Colors.amber,
      ),
      body: _widgetOptions.elementAt(_selectedIndex), // Display selected page
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex, // Update the selected index
        onTap: _onItemTapped, // Handle tap
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
