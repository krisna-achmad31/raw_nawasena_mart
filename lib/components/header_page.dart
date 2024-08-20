
import 'package:flutter/material.dart';
import 'package:nawasena/components/text.dart';
import 'package:nawasena/constant.dart';

import 'button.dart';

class HeaderPage extends StatelessWidget {
  final String label;

  HeaderPage(this.label);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: AppBar().preferredSize.height,
      decoration: BoxDecoration(
          border: Border.all(width: 0, color: primaryColor),
          color: secondaryColor,
          borderRadius: BorderRadius.circular(8)
      ),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: HeaderButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: TextRegularExo(
              label: label,
              size: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}