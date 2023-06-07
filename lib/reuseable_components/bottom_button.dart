import 'package:flutter/material.dart';

import '../constants.dart';

class BottomButton extends StatelessWidget {
  const BottomButton({
    Key? key,
    required this.buttonTitle,
    required this.ontap,
  }) : super(key: key);
  final String buttonTitle;
  final ontap;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        style:
            ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.red)),
        onPressed: ontap,
        child: Text(
          buttonTitle,
          style: const TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
              letterSpacing: 2.0),
        ),
      ),
      // color: ,
      margin: const EdgeInsets.only(top: 10.0),
      padding: const EdgeInsets.only(bottom: 10.0),
      //width: double.infinity,
      height: kBottomContainerHeight,
    );
  }
}
