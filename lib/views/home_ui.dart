import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:thai_temple_app/utils/app_color.dart';
import 'package:thai_temple_app/models/temple.dart';
import 'package:thai_temple_app/services/call_temple_api.dart';
import 'package:geolocator/geolocator.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeUI extends StatefulWidget {
  const HomeUI({Key? key}) : super(key: key);

  @override
  _HomeUIState createState() => _HomeUIState();
}

class _HomeUIState extends State<HomeUI> {
  late Future<List<Temple>> _templesFuture;

  @override
  void initState() {
    super.initState();
    _templesFuture = _fetchTemples();
  }

  Future<List<Temple>> _fetchTemples() async {
    var locationPermission = await Geolocator.checkPermission();

    if (locationPermission == LocationPermission.denied ||
        locationPermission == LocationPermission.deniedForever) {
      locationPermission = await Geolocator.requestPermission();

      if (locationPermission != LocationPermission.whileInUse &&
          locationPermission != LocationPermission.always) {
        throw Exception('Location permission denied.');
      }
    }

    final userPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    return CallTempleApi.getAllTemple(userPosition);
  }

  Widget _buildLoadingIndicator() {
    return Center(child: CircularProgressIndicator());
  }

  Widget _buildLocationPermissionDenied() {
    return Text(
      'Location permission denied. Please grant the permission to use this feature.',
    );
  }

  Widget _buildErrorWidget(dynamic error) {
    return Text('Error: $error');
  }

  Widget _buildTempleList(List<Temple> temples) {
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
                final temple = temples[index];

                return GestureDetector(
                  onTap: () {
                    // Navigate to Detail Page with the selected temple
                  },
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(
                              MediaQuery.of(context).size.width * 0.06),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(
                                10.0), // Adjust the radius as desired
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://thaitemple.sautechnology.com/images/temple/${temple.templeMainImage}',
                              fit: BoxFit.fitWidth,
                              width: MediaQuery.of(context).size.width,
                              placeholder: (context, url) =>
                                  CircularProgressIndicator(),
                              errorWidget: (context, url, error) =>
                                  Icon(Icons.error),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: Icon(Icons.favorite),
                              onPressed: () {
                                // Handle like button press
                              },
                            ),
                            Flexible(
                              child: Container(
                                alignment: Alignment.center,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Text(
                                    temple.templeName,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    overflow: TextOverflow
                                        .ellipsis, // Truncate long names with an ellipsis
                                    maxLines: 2, // Limit to 2 lines
                                    textAlign: TextAlign
                                        .center, // Center the text within each line
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.menu_book_rounded),
                              onPressed: () {
                                // Handle share button press
                              },
                            ),
                          ],
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal:
                                MediaQuery.of(context).size.width * 0.05,
                            vertical: MediaQuery.of(context).size.width * 0.05,
                          ),
                          child: Text(
                            temple.templeDetail,
                            style: TextStyle(fontSize: 16.0),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBodyWidget(AsyncSnapshot<List<Temple>> snapshot) {
    if (snapshot.connectionState == ConnectionState.waiting) {
      return _buildLoadingIndicator();
    } else if (snapshot.hasError) {
      if (snapshot.error is Exception &&
          snapshot.error.toString().contains('Location permission denied.')) {
        return _buildLocationPermissionDenied();
      } else {
        return _buildErrorWidget(snapshot.error);
      }
    } else {
      final temples = snapshot.data!;
      return _buildTempleList(temples);
    }
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
          return _buildBodyWidget(snapshot);
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
