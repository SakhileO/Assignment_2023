/*
 *Technical Programming III Assignment
 * S Nkosi
 * First Sheet
 */

import 'package:flutter/material.dart';
import 'package:flutter_units_app/models/Units_JsonFile.dart';
import 'package:flutter_units_app/views/pages/textfield_sheet.dart';
import 'package:flutter_units_app/views/widgets/sheetCard.dart';
import 'package:provider/provider.dart';

class FirstSheet extends StatefulWidget {
  const FirstSheet({super.key});

  @override
  State<FirstSheet> createState() => _FirstSheetState();
}

class _FirstSheetState extends State<FirstSheet> {
  @override
  Widget build(BuildContext context) {
    context.read<TheJsonFile>().fetchData;
    return Scaffold(
      persistentFooterButtons: [
        Center(
            child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SecondSheet(),
              ),
            );
          },
          child: const Text('Select One Unit'),
        ))
      ],
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Unit Reflections'),
        bottom: AppBar(
            backgroundColor: Colors.white,
            title: Text(
              'My TPG316C Units',
              style: TextStyle(
                  color: Colors.blueGrey[600],
                  fontStyle: FontStyle.italic,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            centerTitle: true),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Provider.of<TheJsonFile>(context, listen: false).fetchData;
        },
        child: Center(
          child: Consumer<TheJsonFile>(builder: (context, value, child) {
            if (value.map.isEmpty && !value.error) {
              return const CircularProgressIndicator();
            } else {
              if (value.error) {
                return Text(
                  'Error: ${value.erroMessage}',
                  textAlign: TextAlign.center,
                );
              } else {
                if (value.pointnumber == 1) {
                  return ListView.builder(
                    itemCount: 1,
                    itemBuilder: (context, index) {
                      return FirstSheetCard(
                        map: value.map['Specs'][0],
                      );
                    },
                  );
                } else {
                  if (value.pointnumber == 2) {
                    return ListView.builder(
                      itemCount: 1,
                      itemBuilder: (context, index) {
                        return FirstSheetCard(
                          map: value.map['Specs'][1],
                        );
                      },
                    );
                  } else {
                    if (value.pointnumber == 3) {
                      return ListView.builder(
                        itemCount: 1,
                        itemBuilder: (context, index) {
                          return FirstSheetCard(
                            map: value.map['Specs'][2],
                          );
                        },
                      );
                    } else {
                      if (value.pointnumber >= 5) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            SizedBox(height: 15),
                            Center(
                              child: Text(
                                "The unit number entered does not exist",
                                style: TextStyle(fontSize: 20),
                              ),
                            )
                          ],
                        );
                      } else {
                        return value.pointnumber == 4
                            ? ListView.builder(
                                itemCount: 1,
                                itemBuilder: (context, index) {
                                  return FirstSheetCard(
                                    map: value.map['Specs'][3],
                                  );
                                },
                              )
                            : ListView.builder(
                                itemCount: value.map['Specs'].length,
                                itemBuilder: (context, index) {
                                  return FirstSheetCard(
                                    map: value.map['Specs'][index],
                                  );
                                },
                              );
                      }
                    }
                  }
                }
              }
            }
          }),
        ),
      ),
    );
  }
}
