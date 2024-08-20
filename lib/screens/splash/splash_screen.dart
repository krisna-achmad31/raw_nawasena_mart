

import 'package:flutter/material.dart';
import 'package:nawasena/screens/splash/provider/splash_provider.dart';
import 'package:provider/provider.dart';

import '../../components/text.dart';
import '../../constant.dart';

class Splash extends StatelessWidget {
  static const String routeName = '/splashScreen';

  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: SplashScreenProvider(context),
      child: Scaffold(
          body: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                child: Image.asset(
                  'assets/img_background.png',
                  fit: BoxFit.fill,
                ),
              ),
              Center(
                child: Column(children: [
                  Spacer(),
                  TextRegularLancelot(
                    label: 'NAWASENA',
                    size: 48,
                    color: Colors.white,
                  ),
                  Spacer(),
                  Image.asset('assets/img_bottom.png')
                ]),
              )
            ],
          )),
    );
  }
}