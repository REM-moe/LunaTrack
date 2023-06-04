// ignore: file_names
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class MyInfo extends StatelessWidget {
  MyInfo({super.key});
  List infos = [
    '1) Green leafy vegetables like spinach, kale,broccoli,cabbage are rich in magnesium and calcium which help relieve period pain',
    '2) Lack of water in the body might also cause dehydration and headaches during this time. Eating watermelons and cucumbers ensures that your body stays hydrated.',
    '3) Fish is rich in iron,protien,omega-3 fatty acids etc..Eating them helps reduce period pain .Eating an omega-3 rich diet has also been proven to better moods.',
    "4) Turmeric: Turmeric is a great healing anti inflammatory spice.It reduces cramps and other menstrual symptoms.",
    "5) Yogurt: Yogurt is a food rich in probiotics and has been proven to nourish the body and protect your vagina from contracting infections that you may be prone to during your menstrual cycle.",
    "6) Quinoa: Quinoa like various other whole grain is a great source of protein for vegans. It is also rich in various nutrients and fibre that might better digestion,which is often compromised during periods.",
    "7) Eggs: Eggs are another popular superfood. They are rich in various nutrients that help reduce  cramps.",
    "8) Lentils: Lentils are another great source of protein and iron, especially for vegetarians and vegans. They are also filling and might help you avoid unhealthy snacks you might be craving.",
    "9) Dark chocolate: Dark chocolate is also a super food.Dark chocolate is rich in iron and Magnesium. Both of these nutrients reduce period pain.Dark chocolate also helps to elevate your mood.",
    "10) Ginger: Ginger has various health benefits and is considered a superfood.Gunger may also help you feel better if you experience nausea during your periods.",
  ];
  List<AssetImage> images = [
    const AssetImage("assets/images/greenfood.jpg"),
    const AssetImage("assets/images/water.jpg"),
    const AssetImage("assets/images/fish.jpg"),
    const AssetImage("assets/images/turmeric.jpg"),
    const AssetImage("assets/images/yog.jpg"),
    const AssetImage("assets/images/Qui.jpg"),
    const AssetImage("assets/images/egg.jpg"),
    const AssetImage("assets/images/lentil1.jpg"),
    const AssetImage("assets/images/darkchoco.jpg"),
    const AssetImage("assets/images/ginger.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Health",
          style: TextStyle(
              color: Colors.amberAccent,
              fontFamily: 'Pacific',
              fontSize: 32,
              shadows: [
                Shadow(
                  color: Colors.black,
                  offset: Offset(1, 1),
                )
              ]),
        ),
        backgroundColor: const Color.fromARGB(255, 167, 159, 255),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(1),
        color: const Color.fromARGB(255, 167, 159, 255),
        child: SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, int index) => Container(
                  height: 100,
                  width: 270,
                  margin: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.fitWidth,
                      // ignore: prefer_interpolation_to_compose_strings
                      image: images[index],
                    ),
                    boxShadow: const [
                      BoxShadow(
                        blurRadius: 10,
                        offset: Offset(1, 1),
                        color: Color.fromARGB(255, 21, 0, 26),
                        spreadRadius: 2,
                      ),
                    ],
                  ),
                  child: const Center(
                    child: Text(""),
                  ),
                ),
              ),
            ),
            Flexible(
              child: Container(
                margin: EdgeInsets.all(2),
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: ListView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) => ListTile(
                    title: Container(
                      padding: EdgeInsets.all(3),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: Color.fromARGB(255, 187, 0, 255),
                          width: 2.0,
                        ),
                        boxShadow: const [
                          BoxShadow(
                            blurRadius: 20,
                            offset: Offset(0, 0),
                            color: Color.fromARGB(132, 227, 117, 255),
                            spreadRadius: 2,
                          ),
                        ],
                      ),
                      child: Text(
                        infos[index],
                        style: const TextStyle(
                          fontFamily: "SF-Pro-Text-Bold",
                          color: Color.fromARGB(255, 0, 13, 42),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Flexible(
              child: CustomPaint(
                size: const Size(500, 100),
                painter: Curvedpainter(),
              ),
            )
          ]),
        ),
      ),
    );
  }
}

//painter
class Curvedpainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint()
      ..color = Colors.teal
      ..strokeWidth = 1;

    var path = Path();

    path.moveTo(0, size.height * 0.7);
    path.quadraticBezierTo(size.width * 0.25, size.height * 0.7,
        size.width * 0.5, size.height * 0.8);
    path.quadraticBezierTo(size.width * 0.75, size.height * 0.9,
        size.width * 1.0, size.height * 0.8);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
