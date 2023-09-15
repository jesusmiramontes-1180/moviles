import 'package:extra1/pagina_2.dart';
import 'package:extra1/pagina_3.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var page_2_text_controller = TextEditingController();

  var page_2_text = '';
  var page_3_text = '';
  @override
  Widget build(BuildContext context) {
    void _showTextInput() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Ingrese datos'),
              content: TextField(
                maxLength: 10,
                controller: page_2_text_controller,
                decoration: InputDecoration(label: Text('Ingrese palabra')),
              ),
              actions: [
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancelar'),
                ),
                MaterialButton(
                  onPressed: () async {
                    page_2_text = await Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Pagina2(
                          text_rec: page_2_text_controller.text,
                        ),
                      ),
                    );
                    Navigator.of(context).pop();
                    setState(() {});
                  },
                  child: Text('Aceptar'),
                )
              ],
            );
          });
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Tarea 1'),
        ),
        body: Center(
          child: Column(
            children: [
              Text(
                'Bienvenidos',
                style: TextStyle(
                  fontSize: 48,
                  fontFamily: 'Pacifico',
                  color: Color.fromARGB(255, 123, 123, 123),
                ),
              ),
              Image.asset('assets/images/dart.png'),
              SizedBox(
                height: 50,
              ),
              Text(
                'Seleccione la accion a realizar:',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      _showTextInput();
                      setState(() {});
                    },
                    child: Text('Pagina 2'),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      page_3_text = await Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => Pagina3(),
                        ),
                      );
                      setState(() {});
                    },
                    child: Text('Pagina 3'),
                  ),
                ],
              ),
              SizedBox(
                height: 50,
              ),
              Text('Pg. 2 => $page_2_text'),
              SizedBox(
                height: 60,
              ),
              Text('Pg. 3 => $page_3_text'),
            ],
          ),
        ));
  }
}
