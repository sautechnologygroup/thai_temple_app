// import 'package:flutter/material.dart';
// import 'package:introduction_screen/introduction_screen.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:thai_temple_app/views/home_ui.dart';

// import '../models/introduction.dart';
// import '../services/call_introduction_api.dart';

// class IntroductionUI extends StatefulWidget {
//   const IntroductionUI({super.key});

//   @override
//   State<IntroductionUI> createState() => _IntroductionUIState();
// }

// class _IntroductionUIState extends State<IntroductionUI> {
//   Future<List<Introduction>>? futureIntroduction;

//   _getAllIntroduction() {
//     setState(() {
//       futureIntroduction = CallIntroductionApi.getAllIntroduction();
//     });
//   }

//   @override
//   void initState() {
//     // TODO: implement initState
//     _getAllIntroduction();
//     super.initState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: FutureBuilder(
//         future: futureIntroduction,
//         builder: (BuildContext buildContext, AsyncSnapshot snapshot) {
//           return Center(
//             child: CircularProgressIndicator(
//               color: Colors.green,
//             ),
//           );
//         },
//       ),
//       body: IntroductionScreen(
//         scrollPhysics: BouncingScrollPhysics(),
//         pages: [
//           PageViewModel(
//             titleWidget: Text(
//               "",
//               style: GoogleFonts.kanit(
//                 fontSize: MediaQuery.of(context).size.width * 0.06,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             bodyWidget: Text(
//               "View the latest Triber images. Triber car has 616 images of its interior, exterior and 360-degree views. Also, Renault Triber is available in 10 different colours.",
//               style: GoogleFonts.kanit(
//                 fontSize: MediaQuery.of(context).size.width * 0.04,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             image: Align(
//               alignment: Alignment.bottomCenter,
//               child: Image.network(
//                 'https://i.pinimg.com/736x/91/27/4c/91274c34cf68eefe90c722247a32a4f2.jpg',
//                 width: MediaQuery.of(context).size.width * 0.8,
//               ),
//             ),
//           ),
//           PageViewModel(
//             titleWidget: Text(
//               "Renuault Triber",
//               style: GoogleFonts.kanit(
//                 fontSize: MediaQuery.of(context).size.width * 0.06,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             bodyWidget: Text(
//               "View the latest Triber images. Triber car has 616 images of its interior, exterior and 360-degree views. Also, Renault Triber is available in 10 different colours.",
//               style: GoogleFonts.kanit(
//                 fontSize: MediaQuery.of(context).size.width * 0.04,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             image: Align(
//               alignment: Alignment.bottomCenter,
//               child: Image.network(
//                 'https://i.pinimg.com/736x/91/27/4c/91274c34cf68eefe90c722247a32a4f2.jpg',
//                 width: MediaQuery.of(context).size.width * 0.8,
//               ),
//             ),
//           ),
//           PageViewModel(
//             titleWidget: Text(
//               "Renuault Triber",
//               style: GoogleFonts.kanit(
//                 fontSize: MediaQuery.of(context).size.width * 0.06,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             bodyWidget: Text(
//               "View the latest Triber images. Triber car has 616 images of its interior, exterior and 360-degree views. Also, Renault Triber is available in 10 different colours.",
//               style: GoogleFonts.kanit(
//                 fontSize: MediaQuery.of(context).size.width * 0.04,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             image: Align(
//               alignment: Alignment.bottomCenter,
//               child: Image.network(
//                 'https://i.pinimg.com/736x/91/27/4c/91274c34cf68eefe90c722247a32a4f2.jpg',
//                 width: MediaQuery.of(context).size.width * 0.8,
//               ),
//             ),
//           ),
//           PageViewModel(
//             titleWidget: Text(
//               "Renuault Triber",
//               style: GoogleFonts.kanit(
//                 fontSize: MediaQuery.of(context).size.width * 0.06,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             bodyWidget: Text(
//               "View the latest Triber images. Triber car has 616 images of its interior, exterior and 360-degree views. Also, Renault Triber is available in 10 different colours.",
//               style: GoogleFonts.kanit(
//                 fontSize: MediaQuery.of(context).size.width * 0.04,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             image: Align(
//               alignment: Alignment.bottomCenter,
//               child: Image.network(
//                 'https://i.pinimg.com/736x/91/27/4c/91274c34cf68eefe90c722247a32a4f2.jpg',
//                 width: MediaQuery.of(context).size.width * 0.8,
//               ),
//             ),
//           ),
//           PageViewModel(
//             titleWidget: Text(
//               "Renuault Triber",
//               style: GoogleFonts.kanit(
//                 fontSize: MediaQuery.of(context).size.width * 0.06,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//             bodyWidget: Text(
//               "View the latest Triber images. Triber car has 616 images of its interior, exterior and 360-degree views. Also, Renault Triber is available in 10 different colours.",
//               style: GoogleFonts.kanit(
//                 fontSize: MediaQuery.of(context).size.width * 0.04,
//               ),
//               textAlign: TextAlign.center,
//             ),
//             image: Align(
//               alignment: Alignment.bottomCenter,
//               //widget for image border radius
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(20),
//                 child: Image.network(
//                   'https://i.pinimg.com/736x/91/27/4c/91274c34cf68eefe90c722247a32a4f2.jpg',
//                   width: MediaQuery.of(context).size.width * 0.8,
//                 ),
//               ),
//             ),
//           ),
//         ],
//         showSkipButton: true,
//         onDone: () => Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomeUI(),
//           ),
//         ),
//         onSkip: () => Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => HomeUI(),
//           ),
//         ),
//         nextFlex: 0,
//         skip: Text(
//           'Skip',
//           style: GoogleFonts.kanit(
//             fontSize: MediaQuery.of(context).size.width * 0.04,
//             color: Colors.deepOrange,
//           ),
//         ),
//         next: Icon(
//           Icons.arrow_forward,
//           color: Colors.deepOrange,
//         ),
//         done: Text(
//           'Getting Stated',
//           style: GoogleFonts.kanit(
//             fontSize: MediaQuery.of(context).size.width * 0.04,
//             color: Colors.deepOrange,
//           ),
//         ),
//         dotsDecorator: DotsDecorator(
//           size: Size(
//             MediaQuery.of(context).size.width * 0.025,
//             MediaQuery.of(context).size.width * 0.025,
//           ),
//           color: Colors.grey,
//           activeSize: Size(
//             MediaQuery.of(context).size.width * 0.055,
//             MediaQuery.of(context).size.width * 0.025,
//           ),
//           activeColor: Colors.deepOrange,
//           activeShape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.all(
//               Radius.circular(25.0),
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:google_fonts/google_fonts.dart';
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
      body: FutureBuilder<List<Introduction>>(
        future: futureIntroduction,
        builder: (BuildContext buildContext,
            AsyncSnapshot<List<Introduction>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('Error: ${snapshot.error}'),
            );
          } else {
            return Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.width * 0.1,
                ),
                Expanded(
                  child: IntroductionScreen(
                    scrollPhysics: BouncingScrollPhysics(),
                    isTopSafeArea: true,
                    pages: [
                      _buildPageViewModel(
                        snapshot.data![0].introTempleName!,
                        snapshot.data![0].introTempleDetail!,
                        'https://www.sau.ac.th/th/pdf/1.jpg',
                      ),
                      _buildPageViewModel(
                        snapshot.data![1].introTempleName!,
                        snapshot.data![1].introTempleDetail!,
                        'https://www.sau.ac.th/th/sau2561.png',
                      ),
                    ],
                    showSkipButton: true,
                    onDone: () => _navigateToHome(),
                    onSkip: () => _navigateToHome(),
                    nextFlex: 0,
                    skip: Text(
                      'Skip',
                      style: GoogleFonts.kanit(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.deepOrange,
                      ),
                    ),
                    next: Icon(
                      Icons.arrow_forward,
                      color: Colors.deepOrange,
                    ),
                    done: Text(
                      'Getting Started',
                      style: GoogleFonts.kanit(
                        fontSize: MediaQuery.of(context).size.width * 0.04,
                        color: Colors.deepOrange,
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
                      activeColor: Colors.deepOrange,
                      activeShape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(25.0),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
