import 'package:flutter/material.dart';

class CardViewWidget extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String description;
  final String status;
  final String species;

  const CardViewWidget({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.description,
    required this.status,
    required this.species,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      borderOnForeground: true,
      elevation: 10,
      shadowColor: Colors.black,
      shape: Border.all(color: Colors.black, width: 2),
      child: Column(
        children: [
          Flexible(child: Image.network(imageUrl)),
          Text(
            title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text(description, textAlign: TextAlign.center),
          Text('Status: $status', textAlign: TextAlign.center),
          Text('Species: $species', textAlign: TextAlign.center),
        ],
      ),
    );
  }
}
