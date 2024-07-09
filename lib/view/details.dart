import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  final dynamic item;

  const Details({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(item['image']),
              Text(
                item['title'],
                style: TextStyle(fontSize: 24),
              ),
              Text('Price: ${item['price']} Rs'),
              Text('Rating: ${item['rating']['rate']}'),
              Text('Description: ${item['description']}'),
            ],
          ),
        ),
      ),
    );
  }
}
