
import 'package:flutter/material.dart';
import 'package:nawasena/components/text.dart';

import '../constant.dart';

class LandingPageTemplate extends StatefulWidget {
  static const String routeName = '/landingPageTemplate';

  const LandingPageTemplate({Key? key}) : super(key: key);

  @override
  State<LandingPageTemplate> createState() => _LandingPageTemplateState();
}

class _LandingPageTemplateState extends State<LandingPageTemplate> {

  void waitingScreen(BuildContext context) async {
    Future.delayed(const Duration(seconds: 3),(){
      Navigator.pop(context);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    waitingScreen(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
    );
  }
}
