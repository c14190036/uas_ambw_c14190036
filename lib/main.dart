import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'Home.dart';
import 'like.dart';
import 'detail.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    MaterialApp(
      title: "UAS AMBW",
      home: MyApp(),
      debugShowCheckedModeBanner: true,
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int temp = 0;
  final _hal = [Home(), like(), detail()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("UAS AMBW"),
        centerTitle: true,
      ),
      body: Scaffold(
        body: _hal[temp],
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Like'),
            BottomNavigationBarItem(icon: Icon(Icons.details), label: 'Detail'),
          ],
          currentIndex: temp,
          onTap: (index) {
            setState(() {
              temp = index;
            });
          },
        ),
      ),
    );
  }
}
