import 'package:flutter/material.dart';

class BigButton extends StatelessWidget {
  final String name;
  final Function onTap;
  final Color color;
  final Key key;
  BigButton({this.name , this.onTap,this.color,this.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      key: key,
      onTap: onTap,
      child: Container(
        height: 50,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(name , style: TextStyle(color: Colors.white , fontWeight: FontWeight.bold,fontSize: 16),),
        ),
      ),
    );
  }
}