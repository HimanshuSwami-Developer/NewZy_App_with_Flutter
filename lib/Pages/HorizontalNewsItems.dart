// ignore_for_file: file_names, must_be_immutable, prefer_typing_uninitialized_variables, unrelated_type_equality_checks, prefer_if_null_operators

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:newsapp/zeesItem.dart';

class NewsAccess extends StatefulWidget {
  var child;
  NewsAccess({Key? key, this.child}) : super(key: key);

  @override
  State<NewsAccess> createState() => _NewsAccessState();
}

class _NewsAccessState extends State<NewsAccess> {
  static var child;

  var data;
  ScrollController scrollController = ScrollController();
  var articles, total;

  var source;
  bool loading = true;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
    setState(() {
      if (widget.child == null) {
        child = 'General';
      } else {
        child = widget.child;
      }
    });
    var res = await http.get(Uri.parse(
        "https://newsapi.org/v2/top-headlines?country=us&category=$child&apiKey=80cbc6dde90041c2926106a6576c41e9&page=1&pageSize=100"));
    // print(res.body);

    data = jsonDecode(res.body);
    articles = data['articles'];
    // source = articles['source'];

    total = data['totalResults'];
    // print(articles.length);

    // ignore: avoid_print
    print(total);
    setState(() {
      loading = false;
      // total;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.82,
      color: const Color.fromARGB(255, 33, 33, 33),
      child: ListView.builder(
          controller: scrollController,
          itemCount: total,
          scrollDirection: Axis.vertical,
          itemBuilder: ((context, index) {
            // print(articles[index]['title'] as String);
            return SizedBox(
              height: 400,
              child: loading == true
                  ? const Center(
                      child: SizedBox(
                          width: 60,
                          height: 60,
                          child: CircularProgressIndicator()))
                  : NewsItem(
                      urls: articles[index]['url'],
                      loading: loading,
                      source: articles[index]['source']['name'] == null
                          ? articles[index]['source']['name'] = "N/A"
                          : articles[index]['source']['name'],
                      image: articles[index]['urlToImage'] == null
                          ? articles[index]['urlToImage'] = "N/A"
                          : articles[index]['urlToImage'],
                      title: articles[index]['title'] == null
                          ? articles[index]['title'] = 'N/A'
                          : articles[index]['title'],
                      description: articles[index]['description'] == null
                          ? articles[index]['description'] = 'N/A'
                          : articles[index]['description'],
                      date: articles[index]['publishedAt'] == null
                          ? articles[index]['publishedAt'] = "N/A"
                          : articles[index]['publishedAt'],
                      author: articles[index]['author'] == null
                          ? articles[index]['author'] = "N/A"
                          : articles[index]['author']),
            );
          })),
    );
  }
}
