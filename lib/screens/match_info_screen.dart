import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/const/app_colors.dart';
import 'package:football_app/const/app_styles.dart';
import 'package:football_app/const/model.dart';
import 'package:intl/intl.dart';

class InfoMatchWidget extends StatefulWidget {
  Matches match;
  final List<Matches> pastMatches;

  InfoMatchWidget({super.key, required this.match, required this.pastMatches});

  @override
  State<InfoMatchWidget> createState() => _InfoMatchWidgetState();
}

class _InfoMatchWidgetState extends State<InfoMatchWidget> {
  @override
  Widget build(BuildContext context) {
    bool isPastMatch = widget.match.date.isBefore(DateTime.now());
    List<Matches> recentPastMatches = widget.pastMatches
        .where((m) => m.date.isBefore(DateTime.now()) && m != widget.match)
        .toList()
        .reversed
        .take(4)
        .toList();

    return Scaffold(
      body: ListView(
        children: [
          Container(
            child: Stack(
              children: [
                Image.asset('assets/Images/background.png'),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  child: Column(
                    children: [
                      SizedBox(height: 50),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                            child: Icon(Icons.chevron_left,
                                color: Colors.white, size: 30),
                          ),
                          Text(
                            isPastMatch ? 'Match Result' : 'Upcoming match',
                            style: mainstyle.copyWith(
                                color: Colors.white, fontSize: 19),
                          ),
                          SizedBox(width: 30),
                        ],
                      ),
                      SizedBox(height: 50),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                SvgPicture.asset(widget.match.icon1,
                                    width: 64, height: 64),
                                SizedBox(height: 5),
                                Text(
                                  '${widget.match.team1}',
                                  style: mainstyle.copyWith(fontSize: 17),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  isPastMatch
                                      ? '${widget.match.scoreteam1} - ${widget.match.scoreteam2}'
                                      : 'VS',
                                  style: mainstyle.copyWith(fontSize: 32),
                                  textAlign: TextAlign.center,
                                ),
                                SizedBox(height: 5),
                                Text(
                                  isPastMatch
                                      ? 'FT'
                                      : '${DateFormat.E().format(widget.match.date)}, ${widget.match.date.month}/${widget.match.date.day}',
                                  style: mainstyle.copyWith(
                                      fontSize: 15,
                                      color: grey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: [
                                SvgPicture.asset(widget.match.icon2,
                                    width: 64, height: 64),
                                SizedBox(height: 5),
                                Text(
                                  '${widget.match.team2}',
                                  style: mainstyle.copyWith(fontSize: 17),
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 25),
                      if (isPastMatch) ...[
                        Center(
                          child: Text('Statistic', style: mainstyle),
                        ),
                        SizedBox(height: 10),
                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: opacity),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16, vertical: 10),
                            child: Column(
                              children: [
                                buildRow(54, 'Possetion %', 46),
                                SizedBox(height: 15),
                                buildRow(5, 'Shots On Target', 4),
                                SizedBox(height: 15),
                                buildRow(14, 'Shots', 10),
                                SizedBox(height: 15),
                                buildRow(11, 'Fouls', 10),
                                SizedBox(height: 15),
                                buildRow(6, 'Corners', 5),
                                SizedBox(height: 15),
                                buildRow(12, 'Free kicks', 11),
                                SizedBox(height: 15),
                                buildRow(6, 'Corner Kicks', 5),
                                SizedBox(height: 15),
                                buildRow(0, 'Offsides', 2),
                                SizedBox(height: 15),
                                buildRow(2, 'Yellow Cards', 2),
                                SizedBox(height: 15),
                                buildRow(0, 'Red Cards', 0),
                                SizedBox(height: 15),
                              ],
                            ),
                          ),
                        )
                      ],
                      if (!isPastMatch) ...[
                        Center(
                          child: Text('Past Games', style: mainstyle),
                        ),
                        SizedBox(height: 10),
                        ListView.builder(
                          shrinkWrap: true,
                          itemCount: recentPastMatches.length,
                          itemBuilder: (context, index) {
                            final pastMatch = recentPastMatches[index];
                            return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => InfoMatchWidget(
                                      match: pastMatch,
                                      pastMatches: widget.pastMatches,
                                    ),
                                  ),
                                );
                              },
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.all(16),
                                margin: EdgeInsets.only(bottom: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  color: Color(0xff1C1C1E),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Text(
                                          'UEFA Champions League | Final',
                                          style: TextStyle(
                                              color: grey,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        Spacer(),
                                        Text(
                                          'FT',
                                          style: TextStyle(
                                              color: primary,
                                              fontSize: 13,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      width: double.infinity,
                                      height: 1,
                                      color: Colors.grey,
                                    ),
                                    SizedBox(height: 10),
                                    Row(
                                      children: [
                                        SvgPicture.asset(pastMatch.icon1),
                                        SizedBox(width: 5),
                                        Expanded(
                                          child: Text(
                                            pastMatch.team1,
                                            style: mainstyle.copyWith(
                                                color: Colors.white,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            '${pastMatch.scoreteam1}:${pastMatch.scoreteam2}',
                                            style: mainstyle.copyWith(
                                                fontSize: 21),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Expanded(
                                          child: Text(
                                            pastMatch.team2,
                                            style: mainstyle.copyWith(
                                                color: Colors.white,
                                                fontSize: 15),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        SvgPicture.asset(pastMatch.icon2),
                                      ],
                                    ),
                                    SizedBox(height: 5),
                                    Center(
                                      child: Text(
                                        '${DateFormat.E().format(pastMatch.date)}, ${pastMatch.date.month}/${pastMatch.date.day}',
                                        style: mainstyle.copyWith(
                                            fontWeight: FontWeight.w400,
                                            color: grey,
                                            fontSize: 13),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRow(int score1, String name, int score2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          '${score1.toStringAsFixed(0)}',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        ),
        Text(
          '${name}',
          style: TextStyle(color: grey, fontSize: 15),
        ),
        Text(
          '${score2.toStringAsFixed(0)}',
          style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.w600, color: Colors.white),
        ),
      ],
    );
  }
}
