import 'package:flutter/material.dart';
import 'package:flutter_map/set_map_page.dart';


import 'locationMenuPage.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('CougDirect'),
          centerTitle: true,
          // backgroundColor: Colors.red,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset('assets/wsuroar-1.jpg'),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => SetMapPage()));
              },
              style: ElevatedButton.styleFrom(
                // backgroundColor: Colors.red
              ),
              child: const Text('Check out the Map!'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => destinations()));
              },
              style: ElevatedButton.styleFrom(
                  // backgroundColor: Colors.red
                  ),
              child: const Text('Check Out Our Locations!'),
            ),
          ],
        ));
  }
}