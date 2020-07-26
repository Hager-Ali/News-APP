import 'package:flutter/material.dart';
import 'package:news_app/details_page.dart';
import 'package:news_app/networking.dart';
import 'package:news_app/news_cards.dart';

import 'category_card.dart';
import 'constants.dart';

enum Categories {
  general,
  business,
  entertainment,
  health,
  science,
  sports,
  technology,
}

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  Color generalCardColor = kActiveColor;
  Color businessCardColor = kInactiveColor;
  Color entertainmentCardColor = kInactiveColor;
  Color healthCardColor = kInactiveColor;
  Color scienceCardColor = kInactiveColor;
  Color sportsCardColor = kInactiveColor;
  Color technologyCardColor = kInactiveColor;

  Categories selectedCategory = Categories.general;
  Stream stream = Stream.fromFuture(
    NetworkHelper(
            'https://newsapi.org/v2/top-headlines?country=de&category=general&apiKey=$apiKey')
        .getData(),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'News APP',
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(left: 15.0, top: 15.0, bottom: 5.0),
              child: Text(
                'Categories',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF072B39),
                ),
              ),
            ),
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CategoryCard(
                      onPress: () {
                        setState(() {
                          selectedCategory = Categories.general;
                          stream = Stream.fromFuture(
                            NetworkHelper(
                                    'https://newsapi.org/v2/top-headlines?country=de&category=general&apiKey=$apiKey')
                                .getData(),
                          );
                        });
                      },
                      categoryColor: selectedCategory == Categories.general
                          ? kActiveColor
                          : kInactiveColor,
                      categoryName: 'general',
                      categoryTextColor: selectedCategory == Categories.general
                          ? kInactiveColor
                          : kActiveColor,
                    ),
                    CategoryCard(
                      onPress: () {
                        setState(() {
                          selectedCategory = Categories.business;
                          stream = Stream.fromFuture(
                            NetworkHelper(
                                    'https://newsapi.org/v2/top-headlines?country=de&category=business&apiKey=$apiKey')
                                .getData(),
                          );
                        });
                      },
                      categoryColor: selectedCategory == Categories.business
                          ? kActiveColor
                          : kInactiveColor,
                      categoryName: 'business',
                      categoryTextColor: selectedCategory == Categories.business
                          ? kInactiveColor
                          : kActiveColor,
                    ),
                    CategoryCard(
                      onPress: () {
                        setState(() {
                          selectedCategory = Categories.entertainment;
                          stream = Stream.fromFuture(
                            NetworkHelper(
                                    'https://newsapi.org/v2/top-headlines?country=de&category=entertainment&apiKey=$apiKey')
                                .getData(),
                          );
                        });
                      },
                      categoryColor:
                          selectedCategory == Categories.entertainment
                              ? kActiveColor
                              : kInactiveColor,
                      categoryName: 'entertainment',
                      categoryTextColor:
                          selectedCategory == Categories.entertainment
                              ? kInactiveColor
                              : kActiveColor,
                    ),
                    CategoryCard(
                      onPress: () {
                        setState(() {
                          selectedCategory = Categories.health;
                          stream = Stream.fromFuture(
                            NetworkHelper(
                                    'https://newsapi.org/v2/top-headlines?country=de&category=health&apiKey=$apiKey')
                                .getData(),
                          );
                        });
                      },
                      categoryColor: selectedCategory == Categories.health
                          ? kActiveColor
                          : kInactiveColor,
                      categoryName: 'health',
                      categoryTextColor: selectedCategory == Categories.health
                          ? kInactiveColor
                          : kActiveColor,
                    ),
                    CategoryCard(
                      onPress: () {
                        setState(() {
                          selectedCategory = Categories.science;
                          stream = Stream.fromFuture(
                            NetworkHelper(
                                    'https://newsapi.org/v2/top-headlines?country=de&category=science&apiKey=$apiKey')
                                .getData(),
                          );
                        });
                      },
                      categoryColor: selectedCategory == Categories.science
                          ? kActiveColor
                          : kInactiveColor,
                      categoryName: 'science',
                      categoryTextColor: selectedCategory == Categories.science
                          ? kInactiveColor
                          : kActiveColor,
                    ),
                    CategoryCard(
                      onPress: () {
                        setState(() {
                          selectedCategory = Categories.sports;
                          stream = Stream.fromFuture(
                            NetworkHelper(
                                    'https://newsapi.org/v2/top-headlines?country=de&category=sports&apiKey=$apiKey')
                                .getData(),
                          );
                        });
                      },
                      categoryColor: selectedCategory == Categories.sports
                          ? kActiveColor
                          : kInactiveColor,
                      categoryName: 'sports',
                      categoryTextColor: selectedCategory == Categories.sports
                          ? kInactiveColor
                          : kActiveColor,
                    ),
                    CategoryCard(
                      onPress: () {
                        setState(() {
                          selectedCategory = Categories.technology;
                          stream = Stream.fromFuture(
                            NetworkHelper(
                                    'https://newsapi.org/v2/top-headlines?country=de&category=technology&apiKey=$apiKey')
                                .getData(),
                          );
                        });
                      },
                      categoryColor: selectedCategory == Categories.technology
                          ? kActiveColor
                          : kInactiveColor,
                      categoryName: 'technology',
                      categoryTextColor:
                          selectedCategory == Categories.technology
                              ? kInactiveColor
                              : kActiveColor,
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(left: 15.0, bottom: 5.0),
              child: Text(
                'News',
                style: TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF072B39),
                ),
              ),
            ),
            StreamBuilder(
              stream: stream,
              builder: (context, snapshot) {
                List<Widget> list = [];
                if (snapshot == null) {
                  return Container(
                    child: CircularProgressIndicator(),
                  );
                } else {
                  for (var article in snapshot.data["articles"]) {
                    var title = article['title'].toString();
                    var image = article['urlToImage'].toString();
                    var publishedTime = article["publishedAt"].toString();
                    var description = article["description"].toString();
                    var content = article["content"].toString();

                    list.add(Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: NewsCards(
                        articleImage: image,
                        articleTitle: title,
                        publishedTime: publishedTime,
                        onPress: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) {
                              return NewsDetailsScreen(
                                descriptions: description,
                                title: title,
                                imgUrl: image,
                                content: content,
                                publishedAt: publishedTime,
                              );
                            }),
                          );
                        },
                      ),
                    ));
                  }
                  return Column(
                    children: list,
                  );
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
