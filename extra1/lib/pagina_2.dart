import 'dart:math';

import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  final String text_rec;

  const Pagina2({super.key, required this.text_rec});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  final random = Random();
  int number = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
      ),
      body: Center(
        child: Container(
          width: MediaQuery.sizeOf(context).width,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: <Color>[
                const Color.fromARGB(255, 87, 178, 252),
                Color.fromARGB(255, 177, 230, 255)
              ])),
          child: Padding(
            padding: const EdgeInsets.all(50.0),
            child: Column(
              children: [
                Text(
                  'Genere numero random',
                  style: TextStyle(
                      color: Colors.purple,
                      fontWeight: FontWeight.w900,
                      fontSize: 20),
                ),
                SizedBox(
                  height: 30,
                ),
                Text('$number',
                    style: TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.w900,
                        fontSize: 28,
                        fontStyle: FontStyle.italic)),
                MaterialButton(
                  color: Colors.white,
                  onPressed: () {
                    number = 100 + random.nextInt(999 - 100 + 1);
                    setState(() {});
                  },
                  child: Text(
                    'Generar',
                  ),
                ),
                MaterialButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.of(context)
                        .pop(widget.text_rec + number.toString());
                  },
                  child: Text('Guardar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
