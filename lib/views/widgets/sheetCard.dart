/*
 *Technical Programming III Assignment
 * S Nkosi
 * The Main Card Sheet
 */

import 'package:flutter/material.dart';

class FirstSheetCard extends StatelessWidget {
  const FirstSheetCard({super.key, required this.map});
  final Map<String, dynamic> map;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Card(
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.network(
                map['image'],
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                map['unit'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                map['concepts'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                map['definition'],
                style: const TextStyle(
                  fontSize: 16,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
