import 'package:flutter/material.dart';

class NewsCards extends StatefulWidget {
  NewsCards({this.newsData});
  final newsData;

  @override
  _NewsCardsState createState() => _NewsCardsState();
}

class _NewsCardsState extends State<NewsCards> {
  String articleTitle;
  String publishedTime;
  String articleImage;

  @override
  void initState() {
    super.initState();
    updateUI(widget.newsData);
  }

  void updateUI(dynamic newsData) {
    articleTitle = newsData['articles'][0]['title'];
    publishedTime = newsData['articles'][0]['publishedAt'];
    articleImage = newsData['articles'][0]['urlToImage'];

    print(publishedTime);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Image.network(
              'https://p.bigstockphoto.com/GeFvQkBbSLaMdpKXF1Zv_bigstock-Aerial-View-Of-Blue-Lakes-And--227291596.jpg',
            ),
          ),
          Expanded(
            child: Text('data'),
          ),
          Expanded(
            child: Text('published time'),
          ),
        ],
      ),
    );
  }
}
