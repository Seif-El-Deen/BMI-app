import 'dart:math';

import 'package:bmi_app/result.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isMale = true;
  double heightValue = 180;
  double result = 0;
  int weight = 69;
  int age = 21;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Body Mass Index'),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    genderButton(context, 'Male'),
                    const SizedBox(
                      width: 15,
                    ),
                    genderButton(context, 'Female'),
                  ],
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.blueGrey,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Height',
                        style: Theme.of(context).textTheme.headline2,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            '${heightValue.toStringAsFixed(1)}',
                            style: Theme.of(context).textTheme.headline1,
                          ),
                          Text(
                            ' cm',
                            style: Theme.of(context).textTheme.bodyText1,
                          )
                        ],
                      ),
                      Slider(
                          value: heightValue,
                          min: 80,
                          max: 250,
                          onChanged: (value) {
                            setState(() {
                              heightValue = value;
                            });
                          })
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    weightAndAgeButton(context, 'Weight'),
                    const SizedBox(
                      width: 15,
                    ),
                    weightAndAgeButton(context, 'Age'),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.teal,
              width: double.infinity,
              height: MediaQuery.of(context).size.height / 14,
              child: TextButton(
                onPressed: () {
                  result = weight / pow(heightValue / 100, 2);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (BuildContext context) =>
                          Result(result: result, isMale: isMale, age: age),
                    ),
                  );
                },
                child: Text(
                  'Calculate',
                  style: Theme.of(context)
                      .textTheme
                      .headline2!
                      .copyWith(color: Colors.white),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Expanded weightAndAgeButton(BuildContext context, String type) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.blueGrey, borderRadius: BorderRadius.circular(25)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              type,
              style: Theme.of(context).textTheme.headline2,
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              type == 'Age' ? '$age' : '$weight',
              style: Theme.of(context).textTheme.headline1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  heroTag: type == 'Age' ? 'age--' : 'weight--',
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age-- : weight--;
                    });
                  },
                  child: const Icon(
                    Icons.remove,
                  ),
                  mini: true,
                ),
                SizedBox(
                  width: 25,
                ),
                FloatingActionButton(
                  heroTag: type == 'Age' ? 'age++' : 'weight++',
                  onPressed: () {
                    setState(() {
                      type == 'Age' ? age++ : weight++;
                    });
                  },
                  child: Icon(
                    Icons.add,
                  ),
                  mini: true,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Expanded genderButton(BuildContext context, String type) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            isMale = type == 'Male';
          });
        },
        child: Container(
          decoration: BoxDecoration(
              color: (isMale && type == 'Male') ||
                      (isMale != true && type == 'Female')
                  ? Colors.teal
                  : Colors.blueGrey,
              borderRadius: BorderRadius.circular(25)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                type == 'Male' ? Icons.male : Icons.female,
                size: 90,
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                type == 'Male' ? 'Male' : 'Female',
                style: Theme.of(context).textTheme.headline2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
