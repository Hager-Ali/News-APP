import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  CategoryCard(
      {this.onPress,
      this.categoryColor,
      this.categoryName,
      this.categoryTextColor});

  final Function onPress;
  final Color categoryColor;
  final String categoryName;
  final Color categoryTextColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.33,
        height: MediaQuery.of(context).size.height * 0.06,
        margin: EdgeInsets.all(10.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          color: categoryColor,
          borderRadius: BorderRadius.circular(50.0),
          border: Border.all(
            color: Color(0xFF58B7BF),
          ),
        ),
        child: Text(
          categoryName,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: categoryTextColor,
            fontSize: 17.0,
          ),
        ),
      ),
    );
  }
}
