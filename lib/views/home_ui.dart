import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_temple_app/utils/app_color.dart';
import 'package:thai_temple_app/models/temple.dart';
import 'package:thai_temple_app/services/call_temple_api.dart';
import 'package:geolocator/geolocator.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  Future<List<Temple>>? _templesFuture;

  @override
  void initState() {
    super.initState();
    _templesFuture = _fetchTemples();
  }

  Future<List<Temple>> _fetchTemples() async {
    LocationPermission locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      // Location permission is denied. Request permission from the user.
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission != LocationPermission.whileInUse &&
          locationPermission != LocationPermission.always) {
        throw Exception('Location permission denied.');
      }
    }

    Position userPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return await CallTempleApi.getAllTemple(userPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "วัดไทย",
          style: GoogleFonts.kanit(),
        ),
        centerTitle: true,
        backgroundColor: AppColor.primary,
      ),
      body: FutureBuilder<List<Temple>>(
        future: _templesFuture,
        builder: (BuildContext context, AsyncSnapshot<List<Temple>> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            if (snapshot.error is Exception &&
                snapshot.error
                    .toString()
                    .contains('Location permission denied.')) {
              return Text(
                  'Location permission denied. Please grant the permission to use this feature.');
            } else {
              return Text('Error: ${snapshot.error}');
            }
          } else {
            List<Temple> temples = snapshot.data!;
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Search',
                        prefixIcon: Icon(Icons.search),
                      ),
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: temples.length,
                      itemBuilder: (BuildContext context, int index) {
                        Temple temple = temples[index];
                        return ListTile(
                          // leading: Icon(Icons.info),
                          title: Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  // Navigate to Detail Page with the selected temple
                                },
                                child: Card(
                                  child: Column(
                                    children: [
                                      Image.network(
                                        'https://thaitemple.sautechnology.com/images/temple/${temple.templeImage}',
                                        fit: BoxFit.cover,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          IconButton(
                                            icon: Icon(Icons.favorite),
                                            onPressed: () {
                                              // Handle like button press
                                            },
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.share),
                                            onPressed: () {
                                              // Handle share button press
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 8.0),
                              Text(
                                temple.templeName,
                                style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                temple.templeDetail,
                                style: TextStyle(fontSize: 16.0),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          }
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColor.background,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.place),
            label: 'Temple',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.event),
            label: 'Event',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
