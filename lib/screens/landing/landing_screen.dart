

import 'package:flutter/material.dart';
import 'package:nawasena/components/text.dart';
import 'package:nawasena/screens/landing/provider/landing_provider.dart';
import 'package:provider/provider.dart';

import '../../constant.dart';

class LandingScreen extends StatelessWidget {

  static const String routeName = '/landingScreen';

  const LandingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: LandingProvider(context),
      child: Scaffold(
        body: Stack(
          children: [
            SizedBox(width: double.infinity, height: double.infinity, child: Image.asset('assets/bg_landing.png', fit: BoxFit.fill,)),
            Column(
              children: [
                const SizedBox(
                  height: 64,
                ),
                Center(
                  child: Image.asset('assets/gif_success.gif', gaplessPlayback: true,),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextRegular(
                  label: 'Your request has been sent successfully.',
                  color: secondaryColor,
                  size: 22,
                  textAlign: TextAlign.center,
                ),
              ],
            )

          ],
        ),
      ),
    );
  }
}
