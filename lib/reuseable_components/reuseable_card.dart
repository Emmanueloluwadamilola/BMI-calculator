import 'package:flutter/material.dart';

class ReuseableCard extends StatelessWidget {
  const ReuseableCard(
      {Key? key, this.cardChild, required this.colour, this.onPress})
      : super(key: key);
  final Color colour;
  final Widget? cardChild;
  final onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: colour,
        ),
      ),
    );
  }
}
