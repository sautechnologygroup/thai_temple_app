import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_temple_app/utils/app_color.dart';
import 'package:thai_temple_app/services/call_temple_api.dart';
import 'package:thai_temple_app/models/temple.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  State<HomeUI> createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  late Future<List<Temple>> futureTemple;

  @override
  void initState() {
    super.initState();
    _getAllTemple();
  }

  void _getAllTemple() {
    setState(() {
      futureTemple = CallTempleApi.getAllTemple();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.background,
      body: FutureBuilder<List<Temple>>(
        future: futureTemple,
        builder:
            (BuildContext buildContext, AsyncSnapshot<List<Temple>> snapshot) {
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
            return Container(
              height: MediaQuery.of(context).size.height,
              color: AppColor.background,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: MediaQuery.of(context).size.height * 0.05,
                      ),
                      child: ListView.builder(
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Padding(
                            padding: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width * 0.05,
                              right: MediaQuery.of(context).size.width * 0.05,
                              bottom: MediaQuery.of(context).size.height * 0.02,
                            ),
                            child: Container(
                              height: MediaQuery.of(context).size.height * 0.2,
                              decoration: BoxDecoration(
                                color: AppColor.primary,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(20),
                                          bottomLeft: Radius.circular(20),
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            snapshot.data![index].image,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: 2,
                                    child: Padding(
                                      padding: EdgeInsets.only(
                                        left:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                        right:
                                            MediaQuery.of(context).size.width *
                                                0.05,
                                      ),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            snapshot.data![index].name,
                                            style: GoogleFonts.kanit(
                                              textStyle: TextStyle(
                                                color: AppColor.primary_accent,
                                                fontSize: 20,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            snapshot.data![index].address,
                                            style: GoogleFonts.kanit(
                                              textStyle: TextStyle(
                                                color: AppColor.primary_accent,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.01,
                                          ),
                                          Text(
                                            snapshot.data![index].province,
                                            style: GoogleFonts.kanit(
                                              textStyle: TextStyle(
                                                color: AppColor.primary_accent,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}












// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:thai_temple_app/models/introduction.dart';
// import 'package:thai_temple_app/services/api_service.dart';
// import 'package:thai_temple_app/utils/app_color.dart';

// class HomeUI extends StatefulWidget {
//   const HomeUI({Key? key}) : super(key: key);

//   @override
//   _HomeUIState createState() => _HomeUIState();
// }

// class _HomeUIState extends State<HomeUI> {
//   List<Introduction> introductionList = [];

//   @override
//   void initState() {
//     super.initState();
//     fetchData();
//   }

//   Future<void> fetchData() async {
//     try {
//       introductionList = await ApiService.fetchIntroductions();
//       setState(() {});
//     } catch (e) {
//       // Handle error
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "วัดไทย",
//           style: GoogleFonts.kanit(),
//         ),
//         centerTitle: true,
//         backgroundColor: AppColor.primary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Search',
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//             ),
//             Container(
//               height: 200.0,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: introductionList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final introduction = introductionList[index];
//                   return Container(
//                     width: 160.0,
//                     child: Card(
//                       child: Image.network(
//                         introduction.templeImage,
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: introductionList.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   final introduction = introductionList[index];
//                   return ListTile(
//                     leading: Icon(Icons.info),
//                     title: Text(introduction.templeName),
//                     onTap: () {
//                       // Navigate to Detail page
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: AppColor.background,
//         selectedItemColor: AppColor.primary,
//         unselectedItemColor: Colors.grey,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.place),
//             label: 'Temple',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.event),
//             label: 'Event',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorite',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'User',
//           ),
//         ],
//       ),
//     );
//   }
// }











// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:thai_temple_app/utils/app_color.dart';

// class HomeUI extends StatefulWidget {
//   const HomeUI({Key? key}) : super(key: key);

//   @override
//   _HomeUIState createState() => _HomeUIState();
// }

// class _HomeUIState extends State<HomeUI> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text(
//           "วัดไทย",
//           style: GoogleFonts.kanit(),
//         ),
//         centerTitle: true,
//         backgroundColor: AppColor.primary,
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: <Widget>[
//             Padding(
//               padding: EdgeInsets.all(10.0),
//               child: TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Search',
//                   prefixIcon: Icon(Icons.search),
//                 ),
//               ),
//             ),
//             Container(
//               height: 200.0,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: 10,
//                 itemBuilder: (BuildContext context, int index) {
//                   return Container(
//                     width: 160.0,
//                     child: Card(
//                       child: Image.network(
//                         'https://thaitemple.sautechnology.com/images/introduction/img1_1.jpg', // Replace with your image URL
//                         fit: BoxFit.cover,
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//             Expanded(
//               child: ListView.builder(
//                 itemCount: 10, // Replace with your item count
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     leading: Icon(Icons.info),
//                     title: Text(
//                         'Temple Information'), // Replace with your temple information
//                     onTap: () {
//                       // Navigate to Detail page
//                     },
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: AppColor.background,
//         selectedItemColor: AppColor.primary,
//         unselectedItemColor: Colors.grey,
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.place),
//             label: 'Temple',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.event),
//             label: 'Event',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.favorite),
//             label: 'Favorite',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.person),
//             label: 'User',
//           ),
//         ],
//       ),
//     );
//   }
// }
