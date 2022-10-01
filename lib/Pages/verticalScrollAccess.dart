// ignore_for_file: file_names, must_be_immutable

import 'package:flutter/material.dart';
import 'package:newsapp/scrollMenu.dart';

class ScrollAccess extends StatelessWidget {
  ScrollAccess({Key? key}) : super(key: key);
  List list = [
    "General",
    "Science",
    "Technology",
    "Entertainment",
    "Sports",
    "Health",
    "Business"
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 35,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: list.length,
            itemBuilder: ((context, index) {
              return Scroll(child: list[index]);
            })));
  }
}
