import 'package:flutter/material.dart';
import 'package:platza_store/core/gen/assets.gen.dart';
import 'package:platza_store/feature/cart/presentation/screen/cart_view.dart';
import 'package:platza_store/feature/home/presentation/screen/home_view.dart';
import 'package:platza_store/feature/search/presentation/screen/search_view.dart';
import 'package:platza_store/feature/settings/presentation/screen/settings_view.dart';

class RootNavigationbar extends StatefulWidget {
  const RootNavigationbar({super.key});

  @override
  State<RootNavigationbar> createState() => _RootNavigationbarState();
}

class _RootNavigationbarState extends State<RootNavigationbar> {
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
