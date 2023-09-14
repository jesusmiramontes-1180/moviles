import 'package:flutter/material.dart';

class Pagina3 extends StatelessWidget {
  const Pagina3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 3'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          MaterialButton(
            color: Color.fromARGB(255, 212, 212, 212),
            onPressed: () {
              Navigator.of(context).pop('(づ ◕‿◕ )づ');
            },
            child: Text('(づ ◕‿◕ )づ'),
          ),
          MaterialButton(
            color: const Color.fromARGB(255, 0, 0, 0),
            onPressed: () {
              Navigator.of(context).pop('(◑‿◐)');
            },
            child: Text(
              '(◑‿◐)',
              style: TextStyle(color: Colors.white),
            ),
          ),
          MaterialButton(
            color: Color.fromARGB(255, 212, 212, 212),
            onPressed: () {
              Navigator.of(context).pop('(✪㉨✪)');
            },
            child: Text('(✪㉨✪)'),
          )
        ],
      ),
    );
  }
}
