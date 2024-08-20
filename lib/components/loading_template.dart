
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constant.dart';

class LoadingTemplate extends StatelessWidget {
  const LoadingTemplate({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          const SizedBox(
            width: 120,
            height: 120,
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
          SizedBox(width: 64, height: 64, child: Image.asset('assets/icon_nawasenas.png'))
        ],
      ),
    );
  }
}
