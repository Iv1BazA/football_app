import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:football_app/const/app_colors.dart';
import 'package:football_app/const/app_icons.dart';
import 'package:football_app/screens/main_screen.dart';
import 'package:football_app/screens/matches_screen.dart';
import 'package:football_app/screens/settings_screen.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  int _currentIndex = 0;
  void _onSeeMore() {
    setState(() {
      _currentIndex = 1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: IndexedStack(
        index: _currentIndex,
        children: [
          MainScreenWidget(
            onSeemMore: _onSeeMore,
          ),
          const MatchesWidget(),
          const SettingsWidget(),
        ],
      )),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 14,
        backgroundColor: Colors.black,
        selectedItemColor: primary,
        unselectedItemColor: Color(0xff8E8E93),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(homePassive),
            activeIcon: SvgPicture.asset(homeActive),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(matchesPassive),
            activeIcon: SvgPicture.asset(matchesActive),
            label: 'Matches',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(settingsPassive),
            activeIcon: SvgPicture.asset(settingsActive),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
