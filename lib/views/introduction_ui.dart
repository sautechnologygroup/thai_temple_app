import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_temple_app/utils/app_color.dart';
import 'package:thai_temple_app/views/home_ui.dart';

import '../models/introduction.dart';
import '../services/call_introduction_api.dart';

class IntroductionUI extends StatefulWidget {
  const IntroductionUI({Key? key}) : super(key: key);

  @override
  State<IntroductionUI> createState() => _IntroductionUIState();
}

class _IntroductionUIState extends State<IntroductionUI> {
  late Future<List<Introduction>> futureIntroduction;

  @override
  void initState() {
    super.initState();
    _getAllIntroduction();
  }

  void _getAllIntroduction() {
    setState(() {
      futureIntroduction = CallIntroductionApi.getAllIntroduction();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: FutureBuilder<List<Introduction>>(
        future: futureIntroduction,
        builder: (BuildContext buildContext,
            AsyncSnapshot<List<Introduction>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: AppColor.primary_accent,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height -
                    MediaQuery.of(context).padding.top,
                child: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.width * 0.1,
                    ),
                    Expanded(
                      child: IntroductionScreen(
                        scrollPhysics: BouncingScrollPhysics(),
                        isTopSafeArea: true,
                        pages: snapshot.data!.map((intro) {
                          return _buildPageViewModel(
                            intro.introTempleName!,
                            intro.introTempleDetail!,
                            'https://thaitemple.sautechnology.com/images/introduction/${intro.introTempleImage}',
                          );
                        }).toList(),
                        showSkipButton: true,
                        onDone: () => _navigateToHome(),
                        onSkip: () => _navigateToHome(),
                        dotsFlex: 0,
                        nextFlex: 1,
                        skip: Text(
                          'Skip',
                          style: GoogleFonts.kanit(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: AppColor.font_color,
                          ),
                        ),
                        next: Icon(
                          Icons.arrow_forward,
                          color: AppColor.font_color,
                        ),
                        done: Text(
                          'Next',
                          style: GoogleFonts.kanit(
                            fontSize: MediaQuery.of(context).size.width * 0.04,
                            color: AppColor.font_color,
                          ),
                        ),
                        dotsDecorator: DotsDecorator(
                          size: Size(
                            MediaQuery.of(context).size.width * 0.025,
                            MediaQuery.of(context).size.width * 0.025,
                          ),
                          color: Colors.grey,
                          activeSize: Size(
                            MediaQuery.of(context).size.width * 0.055,
                            MediaQuery.of(context).size.width * 0.025,
                          ),
                          activeColor: AppColor.font_color,
                          activeShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(25.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }
        },
      ),
    );
  }

  void _navigateToHome() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => HomeUI(),
      ),
    );
  }

  PageViewModel _buildPageViewModel(
      String title, String body, String imageUrl) {
    return PageViewModel(
      titleWidget: Text(
        title,
        style: GoogleFonts.kanit(
          fontSize: MediaQuery.of(context).size.width * 0.06,
          fontWeight: FontWeight.bold,
        ),
      ),
      bodyWidget: Column(
        children: [
          Text(
            body,
            style: GoogleFonts.kanit(
              fontSize: MediaQuery.of(context).size.width * 0.04,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
      image: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.1,
          ),
          child: Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(
                MediaQuery.of(context).size.width * 0.05,
              ),
              image: DecorationImage(
                image: NetworkImage(imageUrl),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
