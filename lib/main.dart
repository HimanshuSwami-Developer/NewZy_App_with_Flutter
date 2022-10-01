// ignore_for_file: must_be_immutable, prefer_typing_uninitialized_variables, import_of_legacy_library_into_null_safe

import 'package:flutter/material.dart';
import 'package:newsapp/Pages/HorizontalNewsItems.dart';
import 'package:newsapp/Pages/verticalScrollAccess.dart';
import 'package:newsapp/colors.dart';
import 'package:splashscreen/splashscreen.dart';

void main() {
  runApp(
    MaterialApp(
      title: "NewZy",
      debugShowCheckedModeBanner: false,
      home: const Splash(),
      theme: ThemeData(appBarTheme: const AppBarTheme(color: colorBlack)),
    ),
  );
}

class HomePage extends StatefulWidget {
  var childs;
  HomePage({Key? mykey, this.childs}) : super(key: mykey);

  @override
  State<HomePage> createState() => _HomePageState();
}

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 4,
      image: Image.asset("images/Logoicon.png"),
      photoSize: 100,
      navigateAfterSeconds: HomePage(),
      title: const Text(
        'NewZy',
        style: TextStyle(color: Colors.white),
        textScaleFactor: 2,
      ),
      backgroundColor: const Color.fromARGB(255, 33, 33, 33),
      loaderColor: Colors.white70,
      loadingText: const Text(
        "Made By Himanshu",
        style: TextStyle(color: Colors.white70),
      ),
    );
  }
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color.fromARGB(255, 30, 30, 30),
        title: const Text("NewZy"),
       
      ),
      body: Container(
        color: const Color.fromARGB(255, 33, 33, 33),
        child: Column(
          children: [
            // Container(height: 40, width: 125, child: Scroll()),
            const SizedBox(
              height: 5,
            ),

            ScrollAccess(),
            const Divider(
              color: Colors.grey,
            ),
            const SizedBox(
              height: 5,
            ),
            NewsAccess(child: widget.childs)
          ],
        ),
      ),
    );
  }
}
