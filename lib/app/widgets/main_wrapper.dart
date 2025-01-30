import 'package:flutter/material.dart';
import 'package:platza_store/app/gen/assets.gen.dart';
import 'package:platza_store/app/widgets/app_drawer.dart';
import 'package:platza_store/app/modules/cart/screen/cart_view.dart';
import 'package:platza_store/app/modules/home/screen/home_view.dart';
import 'package:platza_store/app/modules/search/search_view.dart';
import 'package:platza_store/app/modules/settings/settings_view.dart';

class MainWrapper extends StatefulWidget {
  const MainWrapper({super.key});

  @override
  State<MainWrapper> createState() => _MainWrapperState();
}

class _MainWrapperState extends State<MainWrapper> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeView(),
    SearchView(),
    CartView(),
    SettingsView(),
  ];
  Widget getSelectedIcon(int index, int positionIndex, SvgGenImage icon) {
    return icon.svg(
      colorFilter: ColorFilter.mode(
        index == positionIndex
            ? const Color(0xffFF7A00)
            : const Color(0xff0D0D0E),
        BlendMode.srcIn,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: AppDrawer(),
      body: SafeArea(child: _screens[_currentIndex]),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: true,
        showUnselectedLabels: true,
        unselectedItemColor: const Color(0xff0D0D0E),
        selectedItemColor: const Color(0xffFF7A00),
        selectedLabelStyle:
            const TextStyle(fontSize: 12, color: Color(0xffFF7A00)),
        unselectedLabelStyle:
            const TextStyle(fontSize: 12, color: Color(0xff0D0D0E)),
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: getSelectedIcon(_currentIndex, 0, Assets.icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: getSelectedIcon(_currentIndex, 1, Assets.icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: getSelectedIcon(_currentIndex, 2, Assets.icons.bag),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: getSelectedIcon(_currentIndex, 3, Assets.icons.setting),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
