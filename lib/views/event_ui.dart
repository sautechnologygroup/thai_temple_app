import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'dart:io';

class EventUI extends StatefulWidget {
  const EventUI({super.key});

  @override
  State<EventUI> createState() => _EventUIState();
}

class _EventUIState extends State<EventUI> with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();

    controller = TabController(length: 6, vsync: this);
    controller.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        appBar: AppBar(
          title: Text('อีเว้นในวัด'),
          actions: [
            IconButton(
                onPressed: () => Navigator.of(context)
                    .push(MaterialPageRoute(builder: (_) => Container())),
                icon: const Icon(Icons.search))
          ],
          backgroundColor: Color(0xf09c44),
          centerTitle: true,
          bottom: TabBar(
            controller: controller,
            isScrollable: true,
            tabs: [
              Tab(
                text: 'ภาคกลาง',
              ),
              Tab(
                text: 'ภาคกเหนือ',
              ),
              Tab(
                text: 'ภาคอีสาน',
              ),
              Tab(
                text: 'ภาคตะวันออก',
              ),
              Tab(
                text: 'ภาคใต้',
              ),
              Tab(
                text: 'ภาคตะวันตก',
              ),
            ],
          ),
        ),
        drawer: Drawer(
          backgroundColor: Color.fromARGB(255, 223, 235, 250),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              UserAccountsDrawerHeader(
                accountName: Text(
                  'SIAM เมืองยิ้ม',
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
                accountEmail: Text(
                  'Welcome To Thailand',
                  style: TextStyle(
                    color: Colors.yellow,
                  ),
                ),
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(
                          'https://cdn.discordapp.com/attachments/960199913713586276/975690032692199434/flag.jpg'),
                      fit: BoxFit.cover),
                ),
                currentAccountPicture: Image.network(
                  'https://cdn.discordapp.com/attachments/960199913713586276/975681914218364928/thaimap.png',
                ),
                otherAccountsPictures: [
                  Image.network(
                    'https://cdn.discordapp.com/attachments/960199913713586276/975681685091930132/saulogo.png',
                  ),
                ],
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 15.0,
                ),
                child: Text(
                  'Siam เมืองยิ้ม (let GO )',
                  style: TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15.0,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.pink,
                    ),
                    Flexible(
                      child: ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          controller.animateTo(0);
                        },
                        title: Text(
                          'ภาคกลาง',
                          style: TextStyle(
                            color: Colors.grey[850],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '22 จังหวัด',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.blue,
                    ),
                    Flexible(
                      child: ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          controller.animateTo(1);
                        },
                        title: Text(
                          'ภาคเหนือ',
                          style: TextStyle(
                            color: Colors.grey[850],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '9 จังหวัด',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.orange,
                    ),
                    Flexible(
                      child: ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          controller.animateTo(2);
                        },
                        title: Text(
                          'ภาคอีสาน',
                          style: TextStyle(
                            color: Colors.grey[850],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '20 จังหวัด',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.blue,
                    ),
                    Flexible(
                      child: ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          controller.animateTo(3);
                        },
                        title: Text(
                          'ภาคตะวันออก',
                          style: TextStyle(
                            color: Colors.grey[850],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '7 จังหวัด',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.white,
                    ),
                    Flexible(
                      child: ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          controller.animateTo(4);
                        },
                        title: Text(
                          'ภาคใต้',
                          style: TextStyle(
                            color: Colors.grey[850],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '14 จังหวัด',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20.0,
                  right: 20.0,
                ),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidHeart,
                      color: Colors.brown,
                    ),
                    Flexible(
                      child: ListTile(
                        onTap: () {
                          Navigator.pop(context);
                          controller.animateTo(5);
                        },
                        title: Text(
                          'ภาคตะวันตก',
                          style: TextStyle(
                            color: Colors.grey[850],
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Text(
                      '5 จังหวัด',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Region2UI(),
              //       ),
              //     );
              //   },
              //   trailing: Icon(
              //     FontAwesomeIcons.solidHeart,
              //     color: Colors.blue,
              //   ),
              //   title: Text(
              //     'ภาคเหนือ',
              //     style: TextStyle(
              //       color: Colors.grey[850],
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Region3UI(),
              //       ),
              //     );
              //   },
              //   trailing: Icon(
              //     FontAwesomeIcons.solidHeart,
              //     color: Colors.orange,
              //   ),
              //   title: Text(
              //     'ภาคอีสาน',
              //     style: TextStyle(
              //       color: Colors.grey[850],
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Region4UI(),
              //       ),
              //     );
              //   },
              //   trailing: Icon(
              //     FontAwesomeIcons.solidHeart,
              //     color: Colors.blue,
              //   ),
              //   title: Text(
              //     'ภาคตะวันออก',
              //     style: TextStyle(
              //       color: Colors.grey[850],
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Region5UI(),
              //       ),
              //     );
              //   },
              //   trailing: Icon(
              //     FontAwesomeIcons.solidHeart,
              //     color: Colors.black,
              //   ),
              //   title: Text(
              //     'ภาคใต้',
              //     style: TextStyle(
              //       color: Colors.grey[850],
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              // ListTile(
              //   onTap: () {
              //     Navigator.pop(context);
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Region6UI(),
              //       ),
              //     );
              //   },
              //   trailing: Icon(
              //     FontAwesomeIcons.solidHeart,
              //     color: Colors.brown,
              //   ),
              //   title: Text(
              //     'ภาคตะวันตก',
              //     style: TextStyle(
              //       color: Colors.grey[850],
              //       fontWeight: FontWeight.bold,
              //     ),
              //   ),
              // ),
              //------------------โค๊ดที่กดปุ่มได้-------------------------//
              Divider(),
              ListTile(
                onTap: () {
                  exit(0);
                },
                title: Text(
                  'ออกจากแอปพลิเคชั่น',
                  style: TextStyle(
                    color: Colors.grey[850],
                    fontWeight: FontWeight.bold,
                    fontSize: 15.0,
                  ),
                ),
                trailing: Icon(
                  FontAwesomeIcons.cloudscale,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
