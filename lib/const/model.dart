class Matches {
  final String team1;
  final String team2;
  final int scoreteam1;
  final int scoreteam2;
  final String icon1;
  final String icon2;
  final DateTime date;

  Matches({
    required this.icon1,
    required this.icon2,
    required this.team1,
    required this.team2,
    required this.scoreteam1,
    required this.scoreteam2,
    required this.date,
  });
}

class News {
  final String image;
  final String title;
  final String discription;
  final String date;

  News(
      {required this.image,
      required this.title,
      required this.discription,
      required this.date});
}
