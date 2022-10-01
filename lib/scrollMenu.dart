// ignore_for_file: deprecated_member_use, file_names, must_be_immutable, prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:newsapp/main.dart';

class Scroll extends StatelessWidget {
// List list = [
  //   "Science",
  //   "Technology",
  //   "Education",
  //   "Science",
  //   "Technology",
  //   "Education"
  // ];
  var child;
  Scroll({Key? key, this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 0, 2, 0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 55, 55, 55),
          borderRadius: BorderRadius.circular(360),
        ),
        height: 35,
        width: MediaQuery.of(context).size.width * 0.4,
        alignment: Alignment.center,
        child: ListTile(
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                child,
              ),
            ],
          ),
          textColor: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(360)),
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: ((context) => HomePage(childs: child))));
          },
        ),
      ),
    );
  }
}
