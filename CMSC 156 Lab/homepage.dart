import 'package:flutter/material.dart';
import 'package:demo2/slider.dart';
import 'package:demo2/checkerboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lab Activity 3',
          style: TextStyle(
            color: Colors.white, 
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.purple, 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
           
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/checkerboard");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white
              ),
              child: const Text('Go to Checkerboard Screen'),
            ),
             ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, "/slider");
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple,
                foregroundColor: Colors.white
              ),
              child: const Text('Go to Slider Screen'),
            ),
          ],
        ),
      ),
    );
  }
}
