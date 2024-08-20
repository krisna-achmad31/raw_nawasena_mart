
import 'package:flutter/material.dart';
import 'package:nawasena/constant.dart';


class BasicButton extends StatelessWidget {
  final String? label;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? borderColor;
  final double? horizontal;
  final double? vertical;
  final Widget? child;
  final Color? textColor;

  BasicButton({this.label, this.onPressed, this.backgroundColor, this.foregroundColor, this.horizontal, this.vertical, this.child, this.borderColor, this.textColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: child == null
          ? Text(
        label!,
        style: TextStyle(fontSize: 14, fontFamily: 'Exo', fontWeight: FontWeight.w700, color: textColor != null ? textColor! : Colors.black),
      )
          : child!,
      style: ButtonStyle(
        splashFactory: InkRipple.splashFactory,
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: vertical != null ? vertical! : 16, horizontal: horizontal != null ? horizontal! : 40)),
        backgroundColor: MaterialStateProperty.all<Color>(backgroundColor != null ? backgroundColor! : secondaryColor),
        foregroundColor: MaterialStateProperty.all<Color>(foregroundColor != null ? foregroundColor! : Colors.white),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.0), side: BorderSide(color: borderColor != null ? borderColor! : Colors.black, width: 1.0)),
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  final Widget? child;
  final Function? onPressed;
  final Color? backgroundColor;
  final Color? foregroundColor;

  CustomButton({this.child, this.onPressed, this.backgroundColor, this.foregroundColor});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => onPressed,
      child: child!,
      style: ButtonStyle(
          padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.symmetric(vertical: 18, horizontal: 20)),
          backgroundColor: MaterialStateProperty.all<Color>(backgroundColor != null ? backgroundColor! : Color(0xFFBE9F56)),
          foregroundColor: MaterialStateProperty.all<Color>(foregroundColor != null ? foregroundColor! : Colors.white),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5.0),
          ))),
    );
  }
}

class HeaderButton extends StatelessWidget {
  final String? imagePath;
  final Color? color;
  final VoidCallback? onPressed;

  HeaderButton({this.onPressed, this.imagePath, this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      child: InkWell(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Image.asset(
            "assets/ic_back.png",
            height: 10,
            color: color != null ? color : Colors.white,
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}