import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color _colorButton1 = Colors.black;
  Color _colorButton2 = Colors.black;
  Color _colorButton3 = Colors.black;
  Color _colorButton4 = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mc Flutter'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          height: 160,
          alignment: Alignment.center,
          color: Color.fromRGBO(0, 0, 0, 0.612),
          child: Padding(
            padding: const EdgeInsets.all(2),
            child: Container(
              padding: EdgeInsets.all(12),
              color: Color.fromRGBO(255, 255, 255, 1),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.account_circle_rounded,
                      size: 50,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Flutter McFlutter',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 24)),
                        Text('Experienced App Developer')
                      ],
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 6),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [Text('123 Main Street'), Text('(415) 555-0198')],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                        color: _colorButton1,
                        onPressed: () {
                          if (_colorButton1 == Colors.black) {
                            setState(() {
                              _colorButton1 = Colors.indigo;
                            });
                          } else {
                            setState(() {
                              _colorButton1 = Colors.black;
                            });
                          }

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text('Humano Presionado')));
                        },
                        icon: Icon(Icons.accessibility_new_outlined)),
                    IconButton(
                        iconSize: 30,
                        color: _colorButton2,
                        onPressed: () {
                          if (_colorButton2 == Colors.black) {
                            setState(() {
                              _colorButton2 = Colors.indigo;
                            });
                          } else {
                            setState(() {
                              _colorButton2 = Colors.black;
                            });
                          }

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text('Reloj Presionado')));
                        },
                        icon: Icon(Icons.timer)),
                    IconButton(
                        color: _colorButton3,
                        onPressed: () {
                          if (_colorButton3 == Colors.black) {
                            setState(() {
                              _colorButton3 = Colors.indigo;
                            });
                          } else {
                            setState(() {
                              _colorButton3 = Colors.black;
                            });
                          }
                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text('Android Presionado')));
                        },
                        icon: Icon(Icons.phone_android_rounded)),
                    IconButton(
                        color: _colorButton4,
                        onPressed: () {
                          if (_colorButton4 == Colors.black) {
                            setState(() {
                              _colorButton4 = Colors.indigo;
                            });
                          } else {
                            setState(() {
                              _colorButton4 = Colors.black;
                            });
                          }

                          ScaffoldMessenger.of(context)
                            ..hideCurrentSnackBar()
                            ..showSnackBar(
                                SnackBar(content: Text('IPhone Presionado')));
                        },
                        icon: Icon(Icons.phone_iphone_sharp)),
                  ],
                )
              ]),
            ),
          ),
        ),
      ),
    );
  }
}
