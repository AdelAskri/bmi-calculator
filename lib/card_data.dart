import 'package:flutter/material.dart';
class CardData extends StatelessWidget {
  CardData(this.mIcon, this.mText);

  final Icon mIcon;
  final String mText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        mIcon,
        SizedBox(
          height: 10,
        ),
        Text(mText)
      ],
    );
  }
}