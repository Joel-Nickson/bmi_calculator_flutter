import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

class ReusableCard extends StatelessWidget {
  final Color colour;
  final Widget? cardChild;
  final onPress;
  // final functionVal;
  ReusableCard({
    required this.colour,
    this.cardChild,
    this.onPress,
    // this.functionVal
  });

  @override
  Widget build(BuildContext context) {
    // Widget reusableCard(Color colour,Widget? cardChild){
    return GestureDetector(
      // onTap: onPress(functionVal),
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}
