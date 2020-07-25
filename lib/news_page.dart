import 'package:flutter/material.dart';
import 'category_card.dart';
import 'constants.dart';
import 'networking.dart';
import 'news_cards.dart';

const apiKey = '77f6896382d745f3aa8658560f91e92d';

enum Categories {
  All,
  Sport,
  Policy,
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Color allCardColor = kActiveColor;
  Color sportCardColor = kInactiveColor;
  Color policyCardColor = kInactiveColor;

  var newsData;

  Categories selectedCategory;

  void getNewsData() async {
    NetworkHelper networkHelper = NetworkHelper(
        'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=$apiKey');
    newsData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    getNewsData();
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'News APP',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            NewsCards(
              newsData: newsData,
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF072B39),
                ),
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: CategoryCard(
                      onPress: () {
                        setState(() {
                          selectedCategory = Categories.All;
                        });
                      },
                      categoryColor: selectedCategory == Categories.All
                          ? kActiveColor
                          : kInactiveColor,
                      categoryName: 'All',
                      categoryTextColor: selectedCategory == Categories.All
                          ? kInactiveColor
                          : kActiveColor,
                    ),
                  ),
                  Expanded(
                    child: CategoryCard(
                      onPress: () {
                        setState(() {
                          selectedCategory = Categories.Sport;
                        });
                      },
                      categoryColor: selectedCategory == Categories.Sport
                          ? kActiveColor
                          : kInactiveColor,
                      categoryName: 'Sport',
                      categoryTextColor: selectedCategory == Categories.Sport
                          ? kInactiveColor
                          : kActiveColor,
                    ),
                  ),
                  Expanded(
                    child: CategoryCard(
                      onPress: () {
                        setState(() {
                          selectedCategory = Categories.Policy;
                        });
                      },
                      categoryColor: selectedCategory == Categories.Policy
                          ? kActiveColor
                          : kInactiveColor,
                      categoryName: 'Policy',
                      categoryTextColor: selectedCategory == Categories.Policy
                          ? kInactiveColor
                          : kActiveColor,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 10.0, top: 10.0),
              child: Text(
                'News',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF072B39),
                ),
              ),
            ),
            Expanded(
              flex: 7,
              child: Column(
                children: <Widget>[
                  NewsCards(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
