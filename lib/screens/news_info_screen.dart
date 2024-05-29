import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:football_app/const/app_colors.dart';
import 'package:football_app/const/app_styles.dart';
import 'package:football_app/const/model.dart';

class NewsInfo extends StatefulWidget {
  News news;
  NewsInfo({super.key, required this.news});

  @override
  State<NewsInfo> createState() => _NewsInfoState();
}

class _NewsInfoState extends State<NewsInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.chevron_left, color: Colors.white, size: 30),
              ),
              Text(
                'Home',
                style: mainstyle.copyWith(color: Colors.white, fontSize: 19),
              ),
              SizedBox(width: 30),
            ],
          ),
          SizedBox(height: 15),
          Image.asset(
            widget.news.image,
            width: double.infinity,
            height: 214,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: opacity),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'By',
                          style: mainstyle.copyWith(color: grey, fontSize: 15),
                        ),
                        Text(
                          ' Desmond Kane',
                          style:
                              mainstyle.copyWith(color: primary, fontSize: 15),
                        )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10), color: opacity),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '${widget.news.date}',
                          style: mainstyle.copyWith(
                              color: grey,
                              fontSize: 15,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              '${widget.news.title}',
              style: mainstyle.copyWith(fontSize: 23),
            ),
          ),
          Expanded(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListView(
              children: [
                Text(
                  '${widget.news.discription}',
                  style: mainstyle.copyWith(fontSize: 17),
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}
