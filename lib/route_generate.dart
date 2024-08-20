
import 'package:flutter/material.dart';
import 'package:nawasena/components/landing_page.dart';
import 'package:nawasena/screens/cart/cart_screen.dart';
import 'package:nawasena/screens/detailItem/detail_item_screen.dart';
import 'package:nawasena/screens/detailRent/detail_rent_screen.dart';
import 'package:nawasena/screens/error_screen.dart';
import 'package:nawasena/screens/explore/explore_screen.dart';
import 'package:nawasena/screens/home/home_screen.dart';
import 'package:nawasena/screens/info/info_screen.dart';
import 'package:nawasena/screens/kirimLaporan/kirim_laporan.dart';
import 'package:nawasena/screens/landing/landing_screen.dart';
import 'package:nawasena/screens/laporan/laporan_screen.dart';
import 'package:nawasena/screens/login/login_screen.dart';
import 'package:nawasena/screens/mainPage/main_page_screen.dart';
import 'package:nawasena/screens/rent/rent_screen.dart';
import 'package:nawasena/screens/splash/splash_screen.dart';
import 'package:nawasena/screens/transfer/transfer_screen.dart';

class RouteGenerate {
  static Route<dynamic>? generateRoute(RouteSettings? settings) {
    final args = settings?.arguments;

    switch (settings?.name) {
      case Splash.routeName:
        return MaterialPageRoute(
          builder: (context) => const Splash(),
        );
      case LoginScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const LoginScreen(),
        );
      case MainPageScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const MainPageScreen(),
        );
      case HomeScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const HomeScreen(),
        );
      case ExploreScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const ExploreScreen(),
        );
      case RentScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const RentScreen(),
        );
      case InfoScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const InfoScreen(),
        );
      case DetailRentScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const DetailRentScreen(),
        );
      case TransferScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const TransferScreen(),
        );
      case LandingScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const LandingScreen(),
        );
      case CartScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const CartScreen(),
        );
      case DetailItemScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const DetailItemScreen(),
        );
      case LaporanScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const LaporanScreen(),
        );
      case KirimLaporanScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const KirimLaporanScreen(),
        );
      case LandingPageTemplate.routeName:
        return MaterialPageRoute(
          builder: (context) => const LandingPageTemplate(),
        );

      case ErrorScreen.routeName:
        return _errorPage();
      default:
        return null;
    }

  }

  static Route<dynamic> _errorPage() {
    return MaterialPageRoute(
      builder: (context) => const ErrorScreen(),
    );
  }
}