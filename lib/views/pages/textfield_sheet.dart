/*
 *Technical Programming III Assignment
 * S Nkosi
 * The Text Field Page
 */

import 'package:flutter/material.dart';
import 'package:flutter_units_app/models/Units_JsonFile.dart';
import 'package:flutter_units_app/views/pages/main_sheet.dart';
import 'package:provider/provider.dart';

class SecondSheet extends StatefulWidget {
  const SecondSheet({Key? key}) : super(key: key);

  @override
  State<SecondSheet> createState() => _SecondSheetState();
}

class _SecondSheetState extends State<SecondSheet> {
  TextEditingController textNumber = TextEditingController();

  @override
  void initState() {
    super.initState();
    textNumber = TextEditingController();
  }

  @override
  void dispose() {
    textNumber.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text("Select Unit No"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: TextField(
                  controller: textNumber,
                  cursorColor: Colors.black,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: 'Enter a unit number of your notes',
                    hintStyle: TextStyle(color: Colors.grey),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      borderSide: BorderSide(color: Colors.black),
                      
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: () {
                  //The Provider
                  Provider.of<TheJsonFile>(context, listen: false).pointnumber =
                      int.parse(textNumber.text);
                  
                  //The Navigator
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const FirstSheet(),
                    ),
                  );
                },
                child: const Text('go to selected units'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
