// ignore_for_file: deprecated_member_use, file_names, must_be_immutable, avoid_print

import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

class NewsItem extends StatelessWidget {
  NewsItem({
    Key? key,
    required this.title,
    required this.description,
    required this.date,
    required this.urls,
    required this.author,
    required this.image,
    required this.loading,
    required this.source,
  }) : super(key: key);
  String title, description, urls, source, image, author, date;
  bool loading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2, 5, 2, 5),
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.5,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              image == "N/A"
                  ? Container(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                          onPressed: () {},
                          color: Colors.red.shade800,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(360)),
                          child: Text(source),
                          textColor: Colors.white70,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.26,
                      width: MediaQuery.of(context).size.width * 1,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade200,
                      ))
                  : Container(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: FlatButton(
                          onPressed: () {},
                          color: Colors.red.shade800,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(360)),
                          child: Text(source),
                          textColor: Colors.white70,
                        ),
                      ),
                      height: MediaQuery.of(context).size.height * 0.24, //0.36
                      width: MediaQuery.of(context).size.width * 1, //1
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                        fit: BoxFit.cover,
                        colorFilter: const ColorFilter.mode(
                            Colors.black45, BlendMode.darken),
                        image: NetworkImage(image),
                      ))),
              ListTile(
                  title: Text(title),
                  subtitle: Text(description.length <= 88
                      ? description
                      : description.substring(0, 88) +
                          "....")), //.substring(0, 45) + "...."
              ListTile(
                title: Text("Published by : " +
                    (author.length <= 40
                        ? author
                        : author.substring(0, 20) + "....")),
                trailing: Text("Publish At: " +
                    (date.length <= 10 ? date : date.substring(0, 10))),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 12, 0),
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: RaisedButton.icon(
                    color: Colors.blue.shade800,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    onPressed: () async {
                      print(urls);
                      var url = urls;
                      if (await canLaunch(url)) {
                        await launch(url,
                            forceSafariVC: true,
                            enableJavaScript: true,
                            forceWebView: true);
                      }
                    },
                    label: const Text("More"),
                    textColor: Colors.white,
                    icon: const Icon(Icons.arrow_circle_right_outlined),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
