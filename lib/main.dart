// Copyright 2021 Alexandress. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

final TextEditingController eurosInput = TextEditingController();
final TextEditingController yenInput = TextEditingController();
const double conversionRate = 0.0075;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Alex\'s Currency Converter',
      theme:
          ThemeData(brightness: Brightness.dark, primaryColor: Colors.blueGrey),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Yen (¥) / Euros (€) converter'),
        ),
        body: Column(
          children: [
            TextField(
              controller: eurosInput,
              keyboardType: TextInputType.number,
              onChanged: (euros) {
                if (euros != "") {
                  double eurosAsNumber = double.parse(euros);
                  double yen = eurosAsNumber / conversionRate;
                  yenInput.text = yen.toString();
                } 
                else
                {
                  yenInput.text = "";
                }
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a value in Euros (€)'),
            ),
            TextField(
              controller: yenInput,
              keyboardType: TextInputType.number,
              onChanged: (yen) {
                if (yen != "") {
                  double yenAsNumber = double.parse(yen);
                  double euros = yenAsNumber * conversionRate;
                  eurosInput.text = euros.toString();
                }
                else
                {
                  eurosInput.text = "";
                }
              },
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Enter a value in Yen (¥)'),
            ),
          ],
        ),
      ),
    );
  }
}
