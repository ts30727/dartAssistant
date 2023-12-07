import 'package:dart_assistant/Pages/AroundTheWorld.dart';
import 'package:dart_assistant/Pages/Dashboard.dart';
import 'package:dart_assistant/Pages/ThreeHundred.dart';
import 'package:flutter/material.dart';
import 'package:dart_assistant/dataModels/NavPage.dart';

import 'Pages/Pig.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dart Assistant',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(
          title: 'A utility to aid in keeping score for various dart games.'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Widget _currentPage = const Dashboard();

  void navToPage(NavPage page) {
    setState(() {
      _currentPage = switch(page) {
        NavPage.dashboard => const Dashboard(),
        NavPage.threeHundred => const ThreeHundred(),
        NavPage.pig => const Pig(),
        NavPage.aroundTheWorld => const AroundTheWorld(),
      };
    });
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text('Dart Assistant'),
        ),
        drawer: Drawer(
            child: ListView(children: [
          const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurpleAccent,
              ),
              child: (Text(
                "Navigation",
                style: TextStyle(
                    // color: CupertinoColors.systemBackground,
                    fontSize: 30),
              ))),
          ListTile(
            leading: const Icon(Icons.dashboard_outlined),
            title: const Text("Dashboard"),
            // selectedColor: CustomColors.ioRed,
            onTap: () {
              navToPage(NavPage.dashboard);
            },
          ),
          ListTile(
            leading: const Icon(Icons.add_circle_outline),
            title: const Text("300"),
            onTap: () {
              navToPage(NavPage.threeHundred);
            },
          ),
          ListTile(
            leading: const Icon(Icons.copy),
            title: const Text("Pig"),
            onTap: () {
              navToPage(NavPage.pig);
            },
          ),
          ListTile(
            leading: const Icon(Icons.language),
            title: const Text("Around the world"),
            onTap: () {
              navToPage(NavPage.aroundTheWorld);
            },
          ),
        ])),
        body: _currentPage,
    );
  }
}
