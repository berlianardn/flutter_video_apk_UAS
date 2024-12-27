import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:device_preview/device_preview.dart';
import 'package:todo_apk/providers/video_provider.dart'; // VideoProvider
import 'package:todo_apk/providers/auth_provider.dart'; // AuthProvider
import 'package:todo_apk/pages/welcome.dart'; // Splash Screen
import 'package:todo_apk/pages/video_player.dart'; // Video page
import 'package:todo_apk/pages/login.dart'; // Login page

void main() {
  runApp(
    DevicePreview(
      enabled: true, // Enable for device testing
      builder: (context) => MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => VideoProvider()),
          ChangeNotifierProvider(create: (_) => LoginProvider()),
        ],
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      useInheritedMediaQuery: true, // Supports DevicePreview
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      home: const WelcomePage(), // Start from SplashScreen
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedPageIndex = 0;

  final List<Widget> _pages = [
    const WelcomePage(), // Main Page
    const VideoPlayerPage(videoUrl: '', videoTitle: '', videoCategory: '',), // Video Page
  ];

  final List<String> _pageTitles = [
    'Beranda',
    'Video',
  ];

  void _navigateToPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
    Navigator.of(context).pop();
  }

  Future<void> _logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();

    Navigator.of(context).pushReplacement(
      MaterialPageRoute(builder: (context) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pageTitles[_selectedPageIndex]),
      ),
      body: _pages[_selectedPageIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Center(
                child: Text(
                  'Menu Navigasi',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Beranda'),
              onTap: () => _navigateToPage(0),
              selected: _selectedPageIndex == 0,
            ),
            ListTile(
              leading: const Icon(Icons.video_library),
              title: const Text('Video'),
              onTap: () => _navigateToPage(1),
              selected: _selectedPageIndex == 1,
            ),
            const Divider(),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Keluar'),
              onTap: _logout,
            ),
          ],
        ),
      ),
    );
  }
}
