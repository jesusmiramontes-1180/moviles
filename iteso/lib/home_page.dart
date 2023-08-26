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

  var _likes = 0;
  Color _likeColor = Colors.black;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('App'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Image.network(
              'https://cruce.iteso.mx/wp-content/uploads/sites/123/2018/04/Portada-2-e1525031912445.jpg'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 40),
            child: Row(children: [
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'El ITESO, Universidad Jesuita de Guadalajara',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'San Pedro Tlaquepaque, Jalisco',
                      style: TextStyle(fontWeight: FontWeight.w200),
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      setState(() {
                        _likes += 1;
                        _likeColor = Colors.blueAccent.shade700;
                      });
                    },
                    icon: Icon(
                      Icons.thumb_up,
                      color: _likeColor,
                    ),
                  )
                ],
              ),
              Text('$_likes'),
            ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                      color: _colorButton1,
                      iconSize: 48,
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
                          ..showSnackBar(SnackBar(
                              content: Text(
                                  'El correo del ITESO para tramites es dse@iteso.mx')));
                      },
                      icon: Icon(Icons.message)),
                  Text('Correo')
                ],
              ),
              Column(
                children: [
                  IconButton(
                      color: _colorButton2,
                      iconSize: 48,
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
                          ..showSnackBar(SnackBar(
                              content: Text(
                                  'El telefono del ITESO es 33 3669 3434')));
                      },
                      icon: Icon(Icons.phone)),
                  Text('Llamada')
                ],
              ),
              Column(
                children: [
                  IconButton(
                      color: _colorButton3,
                      iconSize: 48,
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
                          ..showSnackBar(SnackBar(
                              content: Text(
                                  'Se encuentra ubicado en Periférico Sur 8585')));
                      },
                      icon: Icon(Icons.directions)),
                  Text('Ruta')
                ],
              ),
            ],
          ),
          SizedBox(
            height: 64,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Text(
              '''El ITESO, Universidad Jesuita de Guadalajara (Instituto Tecnológico y de Estudios Superiores de Occidente) es una universidad privada ubicada en la Zona Metropolitana de Guadalajara, Jalisco, México, fundada en el año 1957. La institución forma parte del Sistema Universitario Jesuita (SUJ) que integra a ocho universidades en México. La universidad es nombrada como la Universidad Jesuita de Guadalajara.​ ''',
              textAlign: TextAlign.justify,
            ),
          )
        ]),
      ),
    );
  }
}
