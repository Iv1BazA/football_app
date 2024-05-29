import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:football_app/const/app_colors.dart';
import 'package:football_app/const/app_icons.dart';
import 'package:football_app/const/app_styles.dart';

class SettingsWidget extends StatelessWidget {
  const SettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        children: [
          SizedBox(height: 50),
          Center(child: Text('Settings', style: mainstyle)),
          SizedBox(height: 25),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: opacity),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    ask,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Ask of Question',
                    style: mainstyle.copyWith(fontSize: 15),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    color: grey,
                  )
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: opacity),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        privacy,
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Privacy Policy',
                        style: mainstyle.copyWith(fontSize: 15),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: grey,
                      )
                    ],
                  ),
                  SizedBox(height: 14),
                  Container(
                      width: double.infinity,
                      color: grey.withOpacity(0.2),
                      height: 1),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      SvgPicture.asset(
                        terms,
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Terms of Use',
                        style: mainstyle.copyWith(fontSize: 15),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: grey,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: opacity),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        share,
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Share app',
                        style: mainstyle.copyWith(fontSize: 15),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: grey,
                      )
                    ],
                  ),
                  SizedBox(height: 14),
                  Container(
                      width: double.infinity,
                      color: grey.withOpacity(0.2),
                      height: 1),
                  SizedBox(height: 14),
                  Row(
                    children: [
                      SvgPicture.asset(
                        rate,
                        width: 24,
                        height: 24,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Rate the app',
                        style: mainstyle.copyWith(fontSize: 15),
                      ),
                      Spacer(),
                      Icon(
                        Icons.chevron_right,
                        color: grey,
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 15),
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16), color: opacity),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                children: [
                  SvgPicture.asset(
                    info,
                    width: 24,
                    height: 24,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'About app',
                    style: mainstyle.copyWith(fontSize: 15),
                  ),
                  Spacer(),
                  Icon(
                    Icons.chevron_right,
                    color: grey,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
