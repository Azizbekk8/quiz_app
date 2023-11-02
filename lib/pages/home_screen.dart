import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:quiz_app/data/local_data/question_answer.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

enum Jooptor {
  richrig,
  falsch,
  belgisiz,
}

class _HomeScreenState extends State<HomeScreen> {
  bool buttubu = false;

  List<Icon> icons = [];
  Icon tuuraIcon = Icon(
    Icons.check,
    color: Colors.green,
    size: 40,
  );

  Icon KataIcon = Icon(
    Icons.cancel,
    color: Colors.red,
    size: 40,
  );

  void JooptuTap(Jooptor userdinJoobu) {
    final bizdinJoop = question.getAnswer();
    if (bizdinJoop == userdinJoobu) {
      icons.add(tuuraIcon);
    } else {
      icons.add(KataIcon);
    }

    if (question.getQuestion() == '') {
      buttubu = true;
      question.kairaBashta();
    }
    question.skip();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: [Color(0xff029AA5), Color(0xffBF2D61)],
      )),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.lightBlue,
          title: Center(
            child: Text(
              'Homework 7',
              style: TextStyle(fontSize: 23, color: Colors.white),
            ),
          ),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (buttubu == true)
              InkWell(
                onTap: () {
                  buttubu = false;
                  question.kairaBashta();
                  setState(() {});
                  question.getQuestion();
                  icons = [];
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(25),
                          color: Colors.lightBlueAccent),
                      width: 180,
                      height: 50,
                      child: Center(
                        child: Text(
                          'Kaira Bashta',
                          style: TextStyle(fontSize: 23, color: Colors.white),
                        ),
                      )),
                ),
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  question.getQuestion().toString(),
                  style: TextStyle(
                      fontSize: 27.0,
                      fontWeight: FontWeight.w500,
                      color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: InkWell(
                onTap: () {
                  setState(() {});
                  JooptuTap(Jooptor.richrig);
                },
                child: Container(
                  width: 170,
                  height: 50,
                  decoration: BoxDecoration(
                      color: Color(0xff0A89BB),
                      borderRadius: BorderRadius.circular(35)),
                  child: Center(
                    child: Text(
                      "richtig",
                      style: TextStyle(fontSize: 35, color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            InkWell(
              onTap: () {
                setState(() {});
                JooptuTap(Jooptor.falsch);
              },
              child: Container(
                width: 170,
                height: 50,
                decoration: BoxDecoration(
                    color: Color(0xff760055),
                    borderRadius: BorderRadius.circular(35)),
                child: Center(
                  child: const Text(
                    'falsch',
                    style: TextStyle(fontSize: 35, color: Colors.white),
                  ),
                ),
              ),
            ),
            Row(children: icons)
          ],
        ),
      ),
    );
  }
}
