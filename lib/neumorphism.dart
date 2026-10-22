import 'package:flutter/material.dart';

class Neumorphism extends StatefulWidget {
  const Neumorphism({super.key});

  @override
  State<Neumorphism> createState() => _NeumorphismState();
}

class _NeumorphismState extends State<Neumorphism> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.grey[500],
            borderRadius: BorderRadius.all(Radius.circular(50)),
            boxShadow: [
              BoxShadow(
                color: Colors.grey[500]!,
                offset: Offset(5, 5),
                blurRadius: 15,
                spreadRadius: 1
              ),
              BoxShadow(
                  color: Colors.white,
                  offset: Offset(-4, -4),
                  blurRadius: 15,
                  spreadRadius: 1
              )
            ]
          ),
          child: Icon(Icons.android_outlined, size: 80,),

        ),
      ),
    );
  }
}
