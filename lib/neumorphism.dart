import 'package:flutter/material.dart';

class Neumorphism extends StatefulWidget {
  const Neumorphism({super.key});

  @override
  State<Neumorphism> createState() => _NeumorphismState();
}

class _NeumorphismState extends State<Neumorphism> {
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkMode?Colors.grey[850] : Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: darkMode? Colors.grey[850] : Colors.grey[300],
                borderRadius: BorderRadius.all(Radius.circular(50)),
                boxShadow: [
                  BoxShadow(
                    color: darkMode? Colors.grey[900]! : Colors.grey[500]!,
                    offset: Offset(5, 5),
                    blurRadius: 15,
                    spreadRadius: 1
                  ),
                  BoxShadow(
                      color: darkMode? Colors.grey[800]! : Colors.white,
                      offset: Offset(-4, -4),
                      blurRadius: 15,
                      spreadRadius: 1
                  )
                ]
              ),
              child: Icon(Icons.android_outlined, size: 80,color: darkMode ? Colors.white : Colors.black,),

            ),
            Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                      onPressed: (){
                        setState(() {
                          darkMode = true;
                        });
                      },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.black
                    ),
                    child: Text('Dark', style: TextStyle(color: Colors.white),),
                  ),
                  TextButton(
                    onPressed: (){
                      setState(() {
                        darkMode = false;
                      });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.white
                    ),
                    child: Text('Light', style: TextStyle(color: Colors.black),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
