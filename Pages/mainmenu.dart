import 'package:app/pages/Dates.dart';
import 'package:app/pages/Info.dart';
// import 'package:app/pages/Journal.dart';
import 'package:flutter/material.dart';
// import 'package:percent_indicator/circular_percent_indicator.dart';

class MainMenu extends StatefulWidget {
  const MainMenu({super.key});

  @override
  State<MainMenu> createState() => _MainMenuState();
}

class _MainMenuState extends State<MainMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 91, 49, 188),
      body: ListView(
        padding: EdgeInsets.zero,
        children: [
          Container(
            height: 100,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 0, 170, 255),
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
            ),
            child: const SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  ListTile(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    title: Text(
                      "LunaTrack",
                      style: TextStyle(
                        fontSize: 30,
                        fontStyle: FontStyle.normal,
                        shadows: <Shadow>[
                          Shadow(
                            color: Color.fromARGB(223, 0, 1, 68),
                            blurRadius: 2.0,
                            offset: Offset(5.0, 1.0),
                          )
                        ],
                        fontFamily: 'Pacific',
                        color: Color.fromARGB(255, 255, 191, 0),
                      ),
                    ),
                    trailing: CircleAvatar(
                      radius: 70.0,
                      backgroundImage: AssetImage('assets/images/flower_1.png'),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            color: const Color.fromARGB(255, 0, 170, 255),
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 50),
              decoration: const BoxDecoration(
                color: Color.fromARGB(255, 91, 49, 188),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(200),
                ),
              ),
              child: Column(
                children: [
                  GridView.count(
                    shrinkWrap: true,
                    crossAxisCount: 1,
                    crossAxisSpacing: 0,
                    mainAxisSpacing: 10.0,
                    children: [
                      GestureDetector(
                        child: itemDashboard(
                            'Dates',
                            Icons.calendar_month,
                            const Color.fromARGB(255, 91, 49, 188),
                            'assets/images/art.jpg'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const MyDates(),
                            ),
                          );
                        },
                      ),
                      GestureDetector(
                        child: itemDashboard(
                            'Health',
                            Icons.healing,
                            const Color.fromARGB(255, 56, 4, 190),
                            'assets/images/diary.jpg'),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MyInfo(),
                            ),
                          );
                        },
                      ),
                      // GestureDetector(
                      //   child: itemDashboard(
                      //       'Journal',
                      //       Icons.book,
                      //       const Color.fromARGB(255, 91, 49, 188),
                      //       'assets/images/Info.jpg'),
                      //   onTap: () {
                      //     Navigator.push(
                      //       context,
                      //       MaterialPageRoute(
                      //         builder: (context) => MyJournal(),
                      //       ),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  itemDashboard(String title, IconData icondata, Color background,
          String imagepath) =>
      AbsorbPointer(
        child: Container(
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 224, 224, 224),
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(imagepath),
            ),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black,
            ),
            boxShadow: const [
              BoxShadow(
                blurRadius: 20,
                offset: Offset(0, 1),
                color: Color.fromARGB(255, 21, 0, 26),
                spreadRadius: 2,
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: background,
                  shape: BoxShape.circle,
                ),
                child: Icon(
                  icondata,
                  color: const Color.fromARGB(255, 255, 255, 255),
                ),
              ),
              const SizedBox(
                height: 9,
              ),
              Text(
                title,
                style: const TextStyle(
                  fontSize: 23,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Pacific',
                  color: Color.fromARGB(255, 255, 255, 255),
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 33.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
