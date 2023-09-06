import 'package:flutter/material.dart';

class ItemActividad extends StatelessWidget {
  final int day;
  final Map<String, String> place;

  ItemActividad({super.key, i, t, required this.day, required this.place});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 120,
            width: 120,
            color: Colors.purple,
            child: Image(
              image: AssetImage('${place['image']}'),
              fit: BoxFit.cover,
            ),
          ),
          Text("Day $day", style: TextStyle(fontSize: 11)),
          Text("${place['place']}"),
        ],
      ),
    );
  }
}
