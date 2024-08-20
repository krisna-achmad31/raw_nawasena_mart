import 'package:flutter/material.dart';
import 'package:nawasena/constant.dart';

var bottomNavItem = <BottomNavigationBarItem>[
  BottomNavigationBarItem(
    icon: Image.asset(
      'assets/ic_home_off.png',
      width: 28,
      height: 28,
    ),
    activeIcon: Image.asset(
      'assets/ic_home_on.png',
      width: 28,
      height: 28,
      color: secondaryColor,
    ),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      'assets/ic_rent_off_nawasena.png',
      width: 28,
      height: 28,
    ),
    activeIcon: Image.asset(
      'assets/ic_rent_on_nawasena.png',
      width: 28,
      height: 28,
      color: secondaryColor,
    ),
    label: 'Rent',
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      'assets/ic_explore_off_nawasena.png',
      width: 28,
      height: 28,
    ),
    activeIcon: Image.asset(
      'assets/ic_explore_on_nawasena.png',
      width: 28,
      height: 28,
      color: secondaryColor,
    ),
    label: 'Explore',
  ),
  BottomNavigationBarItem(
    icon: Image.asset(
      'assets/ic_profile_off.png',
      width: 28,
      height: 28,
    ),
    activeIcon: Image.asset(
      'assets/ic_profile_on.png',
      width: 28,
      height: 28,
      color: secondaryColor,
    ),
    label: 'Info',
  ),
];
