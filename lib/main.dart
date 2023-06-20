import 'package:flutter/material.dart';
import 'package:simplemath/CarpmaPage.dart';
import 'package:simplemath/CikarmaPage.dart';
import 'package:simplemath/ToplamaPage.dart';
import 'package:simplemath/BolmePage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SIMPLEMATH',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SIMPLEMATH'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ToplamaPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 150),
                    backgroundColor: Colors.pink,
                  ),
                  child: Text(
                    '+',
                    style: TextStyle(fontSize: 100),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CikarmaPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 150),
                    backgroundColor: Colors.deepOrange,
                  ),
                  child: Text(
                    '-',
                    style: TextStyle(fontSize: 100),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CarpmaPage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 150),
                    backgroundColor: Colors.teal,
                  ),
                  child: Text(
                    'x',
                    style: TextStyle(fontSize: 100),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => BolmePage()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    fixedSize: Size(150, 150),
                    backgroundColor: Colors.purpleAccent,
                  ),
                  child: Text(
                    '÷',
                    style: TextStyle(fontSize: 100),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
