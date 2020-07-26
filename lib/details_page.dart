import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsDetailsScreen extends StatefulWidget {
  NewsDetailsScreen(
      {this.descriptions,
      this.title,
      this.imgUrl,
      this.content,
      this.publishedAt});
  final String descriptions, title, imgUrl, content, publishedAt;

  @override
  _NewsDetailsScreenState createState() => _NewsDetailsScreenState();
}

class _NewsDetailsScreenState extends State<NewsDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: EdgeInsets.only(left: 40),
          child: Text(
            'News Details',
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network(widget.imgUrl),
            Padding(
              padding: EdgeInsets.all(5.0),
              child: Text(
                widget.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                widget.descriptions,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                widget.content,
                style: TextStyle(
                  fontSize: 15.0,
                ),
              ),
            ),
            Text(
              widget.publishedAt,
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
