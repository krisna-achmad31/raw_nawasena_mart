
import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String? menuName;
  final Color? menuColor;
  final double? textSize;
  final bool menuButtonHidden;
  final bool menuButtonDividerHidden;
  final VoidCallback? onPressed;

  const MenuItem({this.menuName, this.onPressed, this.menuColor, required this.menuButtonHidden, required this.menuButtonDividerHidden, this.textSize});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(menuName!, style: TextStyle(color: menuColor != null ? menuColor : Colors.black, fontSize: textSize != null ? textSize : 14, fontFamily: 'Ambit')),
                Visibility(
                  visible: !menuButtonHidden,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: Image.asset('assets/ic_next.png', color: Colors.black, width: 16, height: 16,),
                  ),
                ),
              ],
            ),
          ),
        ),
        Visibility(
          visible: !menuButtonDividerHidden,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Divider(thickness: 1),
          ),
        )
      ],
    );
  }
}