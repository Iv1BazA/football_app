import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/const/app_colors.dart';
import 'package:football_app/const/app_styles.dart';
import 'package:football_app/const/matches.dart';
import 'package:football_app/const/news.dart';
import 'package:football_app/screens/match_info_screen.dart';
import 'package:football_app/screens/news_info_screen.dart';

class MainScreenWidget extends StatefulWidget {
  final VoidCallback onSeemMore;
  const MainScreenWidget({super.key, required this.onSeemMore});

  @override
  State<MainScreenWidget> createState() => _MainScreenWidgetState();
}

class _MainScreenWidgetState extends State<MainScreenWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 50),
          Center(child: Text('Home', style: mainstyle)),
          SizedBox(height: 15),
          Row(
            children: [
              Text('Last news', style: mainstyle.copyWith(fontSize: 19)),
              Spacer(),
              GestureDetector(
                onTap: widget.onSeemMore,
                child: Text(
                  'See more',
                  style: mainstyle.copyWith(color: primary, fontSize: 15),
                ),
              )
            ],
          ),
          SizedBox(height: 15),
          Container(
            height: 150,
            child: ListView.separated(
              separatorBuilder: (context, index) => SizedBox(width: 10),
              scrollDirection: Axis.horizontal,
              itemCount: listMatches.length,
              itemBuilder: (context, index) {
                final match = listMatches[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => InfoMatchWidget(
                          match: match,
                          pastMatches: listMatches
                              .where((m) => m.date.isBefore(DateTime.now()))
                              .toList(),
                        ),
                      ),
                    );
                  },
                  child: Container(
                    width: 200,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: opacity),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Text(
                            'UEFA Champions League | Final',
                            style: mainstyle.copyWith(
                                color: grey,
                                fontSize: 11,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                        SizedBox(height: 2),
                        Container(
                            width: double.infinity, height: 1, color: grey),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              SvgPicture.asset(match.icon1),
                              SizedBox(width: 15),
                              Text('${match.team1}',
                                  style: mainstyle.copyWith(fontSize: 13)),
                              Spacer(),
                              Text('${match.scoreteam1}',
                                  style: mainstyle.copyWith(fontSize: 13))
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 5),
                          child: Row(
                            children: [
                              SvgPicture.asset(match.icon2),
                              SizedBox(width: 15),
                              Text('${match.team2}',
                                  style: mainstyle.copyWith(fontSize: 13)),
                              Spacer(),
                              Text('${match.scoreteam2}',
                                  style: mainstyle.copyWith(fontSize: 13))
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text('Trending Now', style: mainstyle.copyWith(fontSize: 19)),
              Spacer(),
              Text(
                'See more',
                style: mainstyle.copyWith(color: primary, fontSize: 15),
              )
            ],
          ),
          SizedBox(height: 15),
          Container(
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: listNews.length,
              itemBuilder: (context, index) {
                final newsItem = listNews[index];
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsInfo(
                            news: newsItem,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: 250,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            newsItem.image,
                            height: 140,
                            width: 250,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              newsItem.title,
                              style: mainstyle.copyWith(fontSize: 15),
                              maxLines: 3,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 5),
                            child: Text(
                              newsItem.date,
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 11),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 15),
          Row(
            children: [
              Text('Trending Now', style: mainstyle.copyWith(fontSize: 19)),
              Spacer(),
              Text(
                'See more',
                style: mainstyle.copyWith(color: primary, fontSize: 15),
              )
            ],
          ),
          SizedBox(height: 10),
          Container(
            height: 250,
            child: ListView.separated(
                itemBuilder: ((context, index) {
                  final newsItem = listNews[listNews.length - 1 - index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => NewsInfo(
                            news: newsItem,
                          ),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            newsItem.image,
                            height: 104,
                            width: 104,
                            fit: BoxFit.cover,
                          ),
                          SizedBox(width: 10),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text(
                                    '${newsItem.title}',
                                    style: mainstyle.copyWith(fontSize: 15),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text(
                                    '${newsItem.date}',
                                    style: TextStyle(color: grey, fontSize: 11),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }),
                separatorBuilder: (context, index) => SizedBox(height: 10),
                itemCount: listNews.length),
          )
        ],
      ),
    );
  }
}
