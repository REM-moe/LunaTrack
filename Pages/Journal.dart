import 'package:flutter/material.dart';
import 'Models/JournalModel.dart';

class MyJournal extends StatelessWidget {
  final List<String> list = ["one", "two", "three"];
  final List<GetAllJournals> journals = [
    GetAllJournals(
        date: DateTime.now(),
        description: "hi",
        journalId: 1,
        title: "1",
        username: "h"),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView.builder(
        itemBuilder: (BuildContext context, int index) =>
            buildjournals(context, index),
      ),
    );
  }

  Widget buildjournals(BuildContext context, int index) {
    return Container(
      child: Card(
        child: Column(
          children: <Widget>[
            Container(
              height: 1000,
              color: const Color.fromARGB(255, 0, 170, 255),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 91, 49, 188),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(200),
                  ),
                ),
                child: GridView.count(
                  shrinkWrap: true,
                  crossAxisCount: 1,
                  crossAxisSpacing: 20.0,
                  mainAxisSpacing: 70.0,
                  children: [
                    itemDashboard(
                        'UnderWork',
                        Icons.calendar_month,
                        const Color.fromARGB(255, 91, 49, 188),
                        'assets/images/art.jpg'),
                    itemDashboard(
                        'UnderWork',
                        Icons.calendar_month,
                        const Color.fromARGB(255, 91, 49, 188),
                        'assets/images/art.jpg'),
                    itemDashboard(
                        'UnderWork',
                        Icons.calendar_month,
                        const Color.fromARGB(255, 91, 49, 188),
                        'assets/images/art.jpg'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

itemDashboard(
        String title, IconData icondata, Color background, String imagepath) =>
    AbsorbPointer(
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
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
