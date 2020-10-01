import 'package:flutter/material.dart';


class FilterButton extends StatelessWidget {
  final String title;
  final Function onPressed;
  FilterButton({
    @required this.title,
    @required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
      ),
      child: Material(
        elevation: 5.0,
        color: Colors.blue,
        borderRadius: BorderRadius.circular(25.0),
        child: MaterialButton(
          height: 40.0,
          onPressed: onPressed,
          child: Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
            ),
          ),
        ),
      ),
    );
  }
}