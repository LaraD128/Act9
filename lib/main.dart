import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentButton = 0;
  List<String> buttonList01 = [
    "https://golflefleur.com/cdn/shop/files/WAVY-POLO-BRN-01.23_058copy.jpg?v=1701818102&width=1920",
    "https://golflefleur.com/cdn/shop/files/CHERUB-SS-SHIRT-PNK-01.jpg?v=1701742283&width=1920",
  ];
  List<String> buttonList02 = [
    "https://golflefleur.com/cdn/shop/files/CURSIVE-CROTCH-TROUSER-KHA-01.jpg?v=1711139614&width=1920",
    "https://golflefleur.com/cdn/shop/files/PLEATED-PANT-CREAM-01.jpg?v=1701817302&width=1920",
  ];
  List<String> buttonList03 = [
    "https://golflefleur.com/cdn/shop/files/USHANKA-ORG-01.jpg?v=1701817851&width=1920",
    "https://golflefleur.com/cdn/shop/files/BRONCO-HAT-GRN-01.jpg?v=1701741967&width=1920",
  ];
  List<String> mainList = [];

  @override
  void initState() {
    // TODO: implement initState
    mainList = buttonList01;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffffdee),
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height / 2,
                color: Color(0xff899a69),
              )
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SafeArea(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.menu,
                          color: Colors.white,
                        )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.search,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, top: 40.0, bottom: 30.0),
                child: Text(
                  "Ropa leFLEUR*",
                  style: TextStyle(
                    color: Color(0xffffffff),
                    fontSize: 48,
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mainList.length + 1,
                  itemBuilder: (context, index) {
                    if (index == 0) {
                      return RotatedBox(
                        quarterTurns: 3,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 20, left: 20, right: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 2;
                                    mainList = buttonList03;
                                  });
                                },
                                child: Text("Camisas",
                                    style: TextStyle(
                                      color: currentButton == 2
                                          ? Color(0xffccd917)
                                          : Color(0xff000000),
                                    )),
                              ),
                              SizedBox(
                                width: 100.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 1;
                                    mainList = buttonList02;
                                  });
                                },
                                child: Text("Pantalones",
                                    style: TextStyle(
                                      color: currentButton == 1
                                          ? Color(0xffccd917)
                                          : Color(0xff000000),
                                    )),
                              ),
                              SizedBox(
                                width: 100.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    currentButton = 0;
                                    mainList = buttonList01;
                                  });
                                },
                                child: Text(
                                  "Gorras",
                                  style: TextStyle(
                                    color: currentButton == 0
                                        ? Color(0xffccd917)
                                        : Color(0xff000000),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    } else {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(20.0),
                              width: 250,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(12.0),
                                  child: Image.network(
                                    mainList[index - 1],
                                    fit: BoxFit.cover,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text("El mejor estilo",
                                style: TextStyle(fontSize: 26)),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.only(left: 20, bottom: 26.0),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.location_on,
                                  color: Colors.amber,
                                ),
                                Text("Lo mas barato",
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey))
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                  },
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
