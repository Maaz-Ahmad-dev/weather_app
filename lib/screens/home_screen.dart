import 'package:dep_task_two/constants/app_colors.dart';
import 'package:dep_task_two/screens/forecast_screen.dart';
import 'package:dep_task_two/screens/search_screen.dart';
import 'package:dep_task_two/screens/weather_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final _destinations = const [
    NavigationDestination(
        icon: Icon(
          Icons.home_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.home,
          color: Colors.white,
        ),
        label: ''),
    NavigationDestination(
        icon: Icon(
          Icons.search_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.search,
          color: Colors.white,
        ),
        label: ''),
    NavigationDestination(
        icon: Icon(
          Icons.wb_sunny_outlined,
          color: Colors.white,
        ),
        selectedIcon: Icon(
          Icons.wb_sunny,
          color: Colors.white,
        ),
        label: ''),
  ];
  final _screens = [
    const WeatherScreen(),
    const SearchScreen(),
    const ForecastScreen(),
    const Center(child: Text("Setting Screen")),
  ];

  @override
  void initState() {
    super.initState();
    // NotificationService.periodicNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
            backgroundColor: AppColors.secondaryBlack),
        child: NavigationBar(
          destinations: _destinations,
          labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
          selectedIndex: _currentIndex,
          indicatorColor: Colors.transparent,
          onDestinationSelected: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}
