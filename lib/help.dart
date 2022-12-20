import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:math';

import 'package:expandable/expandable.dart';

class help extends StatefulWidget {
  const help({Key? key}) : super(key: key);

  @override
  State<help> createState() => _helpState();
}

class _helpState extends State<help> {
  static final data1 =
      'follow the steps : login > go to meeting section > write your channel name > join as auidence';
  static final data2 =
      'Yes ,admin  can schedule meetings as well as institutes can join broadcast as audience.';
  static final data3 =
      'No,there is a seperate segment to join a meeting which is scheduled.';
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Container(
          child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              toolbarHeight: 50,
              title: const Text(
                "HELP DESK",
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              flexibleSpace: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 8,
                        color: Color.fromARGB(255, 172, 172, 172)),
                  ],
                  gradient: LinearGradient(
                      colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
                ),
              ),
            ),
            body: ListView(
              children: [
                buildCard(
                  'How to fill form for doanting foods/Clothes/Books? ',
                ),
                buildCard1(
                  'Where to See Fellow Organization and NGOs ? ',
                ),
                buildCard3(
                  'Can i join meeting to the app itself or use third party app ? ',
                ),
              ],
            ),
            backgroundColor: Color.fromARGB(255, 250, 248, 244),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(1),
              gradient: const LinearGradient(colors: [
                Color.fromARGB(255, 236, 179, 221),
                Color.fromARGB(255, 159, 152, 202)
              ])),
        ),
      ),
    );
  }

  Widget buildCard(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 236, 179, 221),
                  Color.fromARGB(255, 159, 152, 202)
                ])),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                expandIcon: Icons.arrow_downward,
                collapseIcon: Icons.arrow_upward,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              collapsed: Text(
                data1,
                style: TextStyle(
                  fontSize: 18,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                List.generate(1, (_) => data1).join('\n\n'),
                style: TextStyle(fontSize: 18),
              ),
              builder: (_, collapsed, expanded) => Padding(
                padding: const EdgeInsets.all(10).copyWith(top: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildCard1(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 236, 179, 221),
                  Color.fromARGB(255, 159, 152, 202)
                ])),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                expandIcon: Icons.arrow_downward,
                collapseIcon: Icons.arrow_upward,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              collapsed: Text(
                data2,
                style: TextStyle(
                  fontSize: 18,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                List.generate(1, (_) => data2).join('\n\n'),
                style: TextStyle(fontSize: 18),
              ),
              builder: (_, collapsed, expanded) => Padding(
                padding: const EdgeInsets.all(10).copyWith(top: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                ),
              ),
            ),
          ),
        ),
      );

  Widget buildCard3(String title) => Padding(
        padding: EdgeInsets.all(10),
        child: Card(
          shadowColor: Colors.black,
          elevation: 10,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(1),
                gradient: const LinearGradient(colors: [
                  Color.fromARGB(255, 236, 179, 221),
                  Color.fromARGB(255, 159, 152, 202)
                ])),
            child: ExpandablePanel(
              theme: ExpandableThemeData(
                expandIcon: Icons.arrow_downward,
                collapseIcon: Icons.arrow_upward,
                tapBodyToCollapse: true,
                tapBodyToExpand: true,
              ),
              header: Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  title,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              collapsed: Text(
                data3,
                style: TextStyle(
                  fontSize: 18,
                ),
                softWrap: true,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              expanded: Text(
                List.generate(1, (_) => data3).join('\n\n'),
                style: TextStyle(fontSize: 18),
              ),
              builder: (_, collapsed, expanded) => Padding(
                padding: const EdgeInsets.all(10).copyWith(top: 0),
                child: Expandable(
                  collapsed: collapsed,
                  expanded: expanded,
                ),
              ),
            ),
          ),
        ),
      );
}
