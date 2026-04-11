import 'package:flutter/material.dart';
import 'package:flutter/src/material/icons.dart';
import 'package:flutter/src/widgets/spacer.dart';
import 'package:calendar_view/calendar_view.dart';
import 'package:calendar_day_view/calendar_day_view.dart';

void main() {
  runApp(const MyApp());
  CalendarControllerProvider(
    controller: EventController(),
    child: MaterialApp(
      // Your initialization for material app.
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      home: const MyHomePage(title: 'Study-App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Route<void> _createRoute(Widget child) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      final tween = Tween(begin: begin, end: end);
      final offsetAnimation = animation.drive(tween);

      return child;
    },
  );
}

class _MyHomePageState extends State<MyHomePage> {
  int Seite = 0;
  final categories = [EventCategory(id: "1", name: "Work")];

  final event = CalendarEventData(
    date: DateTime(2025, 12, 22),
    endDate: DateTime(2025, 12, 25),
    event: "Event 1",
    title: 'Zesty',
  );

  final now = DateTime.now();

  List<DayEvent<String>> eventos = [];

  bool? thing = false;

  bool? thing2 = false;
  late final pages = [
    Container(
      child: AnimatedSwitcher(
        duration: Duration(seconds: 1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            IntrinsicHeight(
              child: Stack(
                children: [
                  Container(
                    child: Stack(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 40),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Stack(
                              children: [
                                Container(
                                  child: Text(
                                    "Meldung",
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 10, left: 10),
                          child: Icon(Icons.warning_amber, color: Colors.white),
                        ),
                        Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(right: 10, top: 10),
                            child: Icon(Icons.cancel, color: Colors.white),
                          ),
                        ),
                        Align(
                          child: Padding(
                            padding: EdgeInsets.only(top: 15),
                            child: Container(
                              margin: EdgeInsets.only(left: 40, right: 40),
                              child: RichText(
                                softWrap: true,
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          'Die Einschreibung für mündliche Prüfungen hat begonnen und endet am \n ',
                                    ),
                                    TextSpan(text: ""),
                                    TextSpan(
                                      text: ' 21.01.2025',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(10),
                    height: 120,

                    decoration: BoxDecoration(
                      color: Color.fromRGBO(211, 47, 47, 1),
                      borderRadius: BorderRadius.all(Radius.circular(19)),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10, bottom: 10),
              child: Text(
                "Donnerstag, 12. Dezember",
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 290),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Icon(Icons.attach_file, color: Colors.white),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 174, 219, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Container(
                        child: Text(
                          "OPAL",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Icon(Icons.folder_outlined, color: Colors.white),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(239, 125, 0, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Selma",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Icon(
                              Icons.chat_bubble_outline,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(0, 172, 169, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      Container(
                        child: Text(
                          "Matrix",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        alignment: Alignment.center,
                        child: Stack(
                          children: [
                            Icon(Icons.mail_outline, color: Colors.white),
                          ],
                        ),
                        decoration: BoxDecoration(
                          color: Color.fromRGBO(224, 49, 138, 1),
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                        ),
                      ),
                      FittedBox(
                        child: Text(
                          "Mail",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Container(
              child: Container(
                width: double.infinity,
                height: 150,
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Color.fromRGBO(225, 227, 237, 1),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.topRight,
                          margin: EdgeInsets.only(top: 10, left: 10),
                          child: Icon(Icons.coffee),
                        ),
                        Expanded(
                          child: Container(
                            margin: EdgeInsets.only(top: 10, left: 10),
                            alignment: Alignment.topLeft,
                            child: Expanded(
                              child: Container(
                                child: Text(
                                  "Mensa",
                                  style: TextStyle(
                                    color: Color.fromRGBO(0, 37, 87, 1),
                                    fontSize: 17,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 10),
                          alignment: Alignment.topRight,
                          child: Icon(Icons.more_vert_sharp),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.centerLeft,
                          margin: EdgeInsets.only(left: 40, top: 10),
                          child: Column(
                            children: [
                              RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: 'Wann?',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Color.fromRGBO(0, 37, 87, 1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "  4 DS. \n",
                                      style: const TextStyle(
                                        color: Color.fromRGBO(0, 37, 87, 1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'Wo?',
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        height: 2,
                                        color: Color.fromRGBO(0, 37, 87, 1),
                                      ),
                                    ),
                                    TextSpan(
                                      text: "  Alte Mensa",
                                      style: const TextStyle(
                                        color: Color.fromRGBO(0, 37, 87, 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                width: 120,
                                height: 30,
                                margin: EdgeInsets.only(top: 10),
                                child: Align(
                                  alignment: Alignment.center,
                                  child: Text(
                                    "Zum Angebot",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(0, 37, 87, 1),
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Container(
                            width: 50,
                            alignment: Alignment.bottomRight,
                            child: Container(
                              width: 90,
                              height: 90,
                              margin: EdgeInsets.only(right: 40),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                                color: Colors.grey,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  ConstrainedBox(
                    constraints: BoxConstraints(minHeight: 280),
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 10,
                        bottom: 1,
                        left: 20,
                        right: 20,
                      ),

                      decoration: BoxDecoration(
                        color: Color.fromRGBO(225, 227, 237, 1),
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Stack(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 40,
                                          top: 10,
                                          bottom: 20,
                                        ),
                                        child: Text(
                                          "Heute",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Color.fromRGBO(0, 37, 87, 1),
                                          ),
                                        ),
                                      ),

                                      Container(
                                        margin: EdgeInsets.only(
                                          left: 8,
                                          top: 10,
                                        ),
                                        child: Stack(
                                          children: [
                                            Icon(Icons.calendar_month),
                                            Container(
                                              alignment: Alignment.topRight,
                                              child: Icon(
                                                Icons.more_vert_sharp,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  alignment: Alignment.topLeft,
                                ),
                              ),
                            ],
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 300),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    margin: EdgeInsets.only(
                                                      right: 6,
                                                    ),
                                                    child: Text(
                                                      "7:30",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                          225,
                                                          227,
                                                          237,
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                      left: 4,
                                                    ),
                                                    child: Icon(
                                                      Icons.book_rounded,
                                                      color: Color.fromRGBO(
                                                        225,
                                                        227,
                                                        237,
                                                        1,
                                                      ),
                                                      size: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                  7,
                                                  313,
                                                  71,
                                                  1,
                                                ),

                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),

                                              height: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 27,
                                        alignment: Alignment.bottomCenter,
                                        child: Text('EMI Ü'),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "APB E040",
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  height: 80,
                                  width: 80,
                                ),

                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    margin: EdgeInsets.only(
                                                      right: 6,
                                                    ),
                                                    child: Text(
                                                      "7:30",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                          225,
                                                          227,
                                                          237,
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                      left: 4,
                                                    ),
                                                    child: Icon(
                                                      Icons.book_rounded,
                                                      color: Color.fromRGBO(
                                                        225,
                                                        227,
                                                        237,
                                                        1,
                                                      ),
                                                      size: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                  7,
                                                  33,
                                                  71,
                                                  1,
                                                ),

                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),

                                              height: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 27,
                                        alignment: Alignment.bottomCenter,
                                        child: Text('EMI Ü'),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "APB E040",
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  height: 80,
                                  width: 80,
                                ),
                                Container(
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    margin: EdgeInsets.only(
                                                      right: 6,
                                                    ),
                                                    child: Text(
                                                      "7:30",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                          225,
                                                          227,
                                                          237,
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                      left: 4,
                                                    ),
                                                    child: Icon(
                                                      Icons.book_rounded,
                                                      color: Color.fromRGBO(
                                                        225,
                                                        227,
                                                        237,
                                                        1,
                                                      ),
                                                      size: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                  7,
                                                  33,
                                                  71,
                                                  1,
                                                ),

                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),

                                              height: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 27,
                                        alignment: Alignment.bottomCenter,
                                        child: Text('EMI Ü'),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "APB E040",
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  height: 80,
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(maxWidth: 300),

                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    margin: EdgeInsets.only(
                                                      right: 6,
                                                    ),
                                                    child: Text(
                                                      "7:30",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                          225,
                                                          227,
                                                          237,
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                      left: 4,
                                                    ),
                                                    child: Icon(
                                                      Icons.book_rounded,
                                                      color: Color.fromRGBO(
                                                        225,
                                                        227,
                                                        237,
                                                        1,
                                                      ),
                                                      size: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                  7,
                                                  33,
                                                  71,
                                                  1,
                                                ),

                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),

                                              height: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 27,
                                        alignment: Alignment.bottomCenter,
                                        child: Text('EMI Ü'),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "APB E040",
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  height: 80,
                                  width: 80,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    margin: EdgeInsets.only(
                                                      right: 6,
                                                    ),
                                                    child: Text(
                                                      "7:30",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                          225,
                                                          227,
                                                          237,
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                      left: 4,
                                                    ),
                                                    child: Icon(
                                                      Icons.book_rounded,
                                                      color: Color.fromRGBO(
                                                        225,
                                                        227,
                                                        237,
                                                        1,
                                                      ),
                                                      size: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                  7,
                                                  33,
                                                  71,
                                                  1,
                                                ),

                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),

                                              height: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 27,
                                        alignment: Alignment.bottomCenter,
                                        child: Text('EMI Ü'),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "APB E040",
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  height: 80,
                                  width: 80,
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20),
                                  child: Column(
                                    children: [
                                      Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              child: Stack(
                                                children: [
                                                  Container(
                                                    alignment:
                                                        Alignment.centerRight,
                                                    margin: EdgeInsets.only(
                                                      right: 6,
                                                    ),
                                                    child: Text(
                                                      "7:30",
                                                      style: TextStyle(
                                                        color: Color.fromRGBO(
                                                          225,
                                                          227,
                                                          237,
                                                          1,
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Container(
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    margin: EdgeInsets.only(
                                                      left: 4,
                                                    ),
                                                    child: Icon(
                                                      Icons.book_rounded,
                                                      color: Color.fromRGBO(
                                                        225,
                                                        227,
                                                        237,
                                                        1,
                                                      ),
                                                      size: 14,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              decoration: BoxDecoration(
                                                color: Color.fromRGBO(
                                                  7,
                                                  33,
                                                  71,
                                                  1,
                                                ),

                                                borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(10),
                                                  topRight: Radius.circular(10),
                                                ),
                                              ),

                                              height: 25,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        height: 27,
                                        alignment: Alignment.bottomCenter,
                                        child: Text('EMI Ü'),
                                      ),
                                      Expanded(
                                        child: Text(
                                          "APB E040",
                                          style: TextStyle(fontSize: 11),
                                        ),
                                      ),
                                    ],
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(10),
                                    ),
                                  ),
                                  height: 80,
                                  width: 80,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
    SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 20),
            alignment: Alignment.topCenter,
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.all(Radius.circular(15)),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Icon(
                Icons.music_note_outlined,
                color: Colors.white,
                size: 60,
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            child: Text(
              "Weil deine Musik deine Wahl ist!",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(
                      top: 20,
                      left: 30,
                      right: 30,
                      bottom: 50,
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Your Favorite Picks!",
                          textAlign: TextAlign.center,
                        ),
                        Row(
                          children: [
                            Container(
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(left: 10, bottom: 30),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(left: 10, bottom: 30),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(left: 10, bottom: 30),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(left: 10, bottom: 30),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(left: 10, bottom: 30),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(left: 10, bottom: 30),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              child: Container(
                                height: 100,
                                width: 100,
                                margin: EdgeInsets.only(left: 10, bottom: 30),
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(
                                    Radius.circular(15),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Column(
                                spacing: 10,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(
                                      left: 10,
                                      right: 10,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.grey,
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(14),
                                      ),
                                    ),
                                    height: 10,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    height: 1000,
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(225, 227, 237, 1),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
    MonthView(controller: EventController()..add(event)),
    Container(
      child: Column(
        children: [
          StatefulBuilder(
            key: ValueKey(thing),
            builder:
                (
                  BuildContext context,
                  void Function(void Function()) setState,
                ) {
                  return Column(
                    children: [
                      CheckboxListTile(
                        title: Text(
                          "Sich für die münldichen Prüfungen anmalden (DRINGEND!)",
                          style: TextStyle(
                            color: Color.fromRGBO(225, 227, 237, 1),
                            fontSize: 20,
                          ),
                        ),
                        value: thing,
                        onChanged: (newBool) {
                          setState(() {
                            thing = newBool;
                          });
                        },
                      ),
                      CheckboxListTile(
                        title: Text(
                          "Nachbereitungsaufgaben für Mathematik hochladen",
                          style: TextStyle(
                            color: Color.fromRGBO(225, 227, 237, 1),
                            fontSize: 20,
                          ),
                        ),
                        value: thing2,
                        onChanged: (newBool) {
                          setState(() {
                            thing2 = newBool;
                          });
                        },
                      ),
                    ],
                  );
                },
          ),
        ],
      ),
    ),
    Container(
      child: (Text("s", style: TextStyle(color: Colors.white))),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AnimatedSwitcher(
        duration: Duration(milliseconds: 300),
        child: KeyedSubtree(
          key: ValueKey<int>(Seite),
          child: SizedBox.expand(child: pages[Seite]),
        ),
      ),
      //credit https://www.youtube.com/watch?v=040PD__39Ok
      bottomNavigationBar: NavigationBar(
        height: 60,

        selectedIndex: Seite,
        backgroundColor: Color.fromRGBO(225, 227, 237, 1),
        indicatorColor: Color.fromRGBO(225, 227, 237, 1),

        onDestinationSelected: (Seite) {
          setState(() => this.Seite = Seite);
          _createRoute(pages[Seite]);
        },
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        destinations: [
          NavigationDestination(icon: Icon(Icons.sticky_note_2), label: "Dash"),
          NavigationDestination(icon: Icon(Icons.music_note), label: "Musik"),
          NavigationDestination(
            icon: Icon(Icons.calendar_month),
            label: "Stundenplan",
          ),
          NavigationDestination(icon: Icon(Icons.list), label: "Todo"),
        ],
      ),

      backgroundColor: Color.fromRGBO(7, 33, 71, 1),
      appBar: AppBar(
        leading: Icon(Icons.menu),
        actions: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                alignment: Alignment.centerLeft,
                child: Icon(Icons.account_circle_rounded),
              ),
            ],
          ),
        ],

        centerTitle: true,
        title: Text('Study-App', textAlign: TextAlign.center),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}
