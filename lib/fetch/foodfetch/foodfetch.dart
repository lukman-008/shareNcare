import 'package:flutter/material.dart';
import 'package:flutter_application_1/fetch/foodfetch/foodremote_data.dart';
import 'package:flutter_application_1/fetch/foodfetch/foomodel.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';

class foodfetch extends StatefulWidget {
  const foodfetch({super.key});

  @override
  State<foodfetch> createState() => _foodfetchState();
}

class _foodfetchState extends State<foodfetch> {
  Future<void> _handlerefresh() async {
    return await Future.delayed(Duration(milliseconds: 500));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("FOOD SUPPLIES"),
        flexibleSpace: Container(
          decoration: BoxDecoration(
            boxShadow: [BoxShadow(blurRadius: 20, color: Colors.black)],
            gradient: LinearGradient(
                colors: [Colors.blue, Color.fromARGB(255, 3, 54, 96)]),
          ),
        ),
      ),
      body: LiquidPullToRefresh(
        onRefresh: _handlerefresh,
        color: Colors.blue,
        height: 200,
        animSpeedFactor: 5,
        backgroundColor: Color.fromARGB(255, 237, 255, 255),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.only(left: 15.0, right: 15, top: 20),
            child: Column(
              children: [
                StreamBuilder<List<UserModel>>(
                    stream: FirestoreHelper.read(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (snapshot.hasError) {
                        return Center(
                          child: Text("some error occured"),
                        );
                      }
                      if (snapshot.hasData) {
                        final userdata = snapshot.data;

                        return Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ListView.builder(
                                itemCount: userdata!.length,
                                itemBuilder: (context, index) {
                                  final singleUser = userdata[index];
                                  return Container(
                                    decoration: BoxDecoration(
                                      boxShadow: [
                                        BoxShadow(
                                            blurRadius: 6,
                                            color:
                                                Color.fromARGB(255, 0, 0, 0)),
                                      ],
                                      gradient: LinearGradient(
                                        colors: [
                                          Color.fromARGB(255, 255, 245, 250),
                                          Color.fromARGB(255, 255, 245, 250),
                                        ],
                                        begin: Alignment.topCenter,
                                        end: Alignment.bottomCenter,
                                      ),
                                    ),
                                    child: FittedBox(
                                      child: Column(
                                        children: [
                                          DataTable(
                                            dataRowColor: MaterialStateProperty
                                                .resolveWith<Color?>(
                                                    (Set<MaterialState>
                                                        states) {
                                              if (states.contains(
                                                  MaterialState.selected))
                                                return Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                    .withOpacity(0.08);
                                              return Color.fromRGBO(
                                                  228,
                                                  228,
                                                  228,
                                                  0.722); // Use the default value.
                                            }),
                                            headingRowColor:
                                                MaterialStateProperty
                                                    .resolveWith<Color?>(
                                                        (Set<MaterialState>
                                                            states) {
                                              if (states.contains(
                                                  MaterialState.selected))
                                                return Theme.of(context)
                                                    .colorScheme
                                                    .primary
                                                    .withOpacity(0.08);
                                              return Color.fromARGB(
                                                  255,
                                                  201,
                                                  220,
                                                  254); // Use the default value.
                                            }),
                                            dataRowHeight: 180,
                                            headingRowHeight: 100,
                                            border: TableBorder.all(width: 2),
                                            columns: <DataColumn>[
                                              DataColumn(
                                                label: Text(
                                                  'Name',
                                                  style: TextStyle(
                                                      fontSize: 30,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                              DataColumn(
                                                label: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${singleUser.name}" +
                                                            "                                                                ",
                                                        style: TextStyle(
                                                            fontSize: 30,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ]),
                                                numeric: true,
                                              ),
                                            ],
                                            rows: <DataRow>[
                                              DataRow(
                                                cells: <DataCell>[
                                                  DataCell(Text(
                                                    "Contact",
                                                    style: TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataCell(Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${singleUser.contact}",
                                                        style: TextStyle(
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )),
                                                ],
                                              ),
                                              DataRow(
                                                cells: <DataCell>[
                                                  DataCell(Text(
                                                    "Email",
                                                    style: TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataCell(Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${singleUser.email}",
                                                        style: TextStyle(
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )),
                                                ],
                                              ),
                                              DataRow(
                                                cells: <DataCell>[
                                                  DataCell(Text(
                                                    "Address",
                                                    style: TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataCell(Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "${singleUser.address}",
                                                        style: TextStyle(
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )),
                                                ],
                                              ),
                                              DataRow(
                                                cells: <DataCell>[
                                                  DataCell(Text(
                                                    "Description",
                                                    style: TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataCell(Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        "\n${singleUser.descr}\n ",
                                                        style: TextStyle(
                                                            fontSize: 26,
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ],
                                                  )),
                                                ],
                                              ),
                                              DataRow(
                                                cells: <DataCell>[
                                                  DataCell(Text(
                                                    "Quantity",
                                                    style: TextStyle(
                                                        fontSize: 26,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  )),
                                                  DataCell(Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 850),
                                                    child: Text(
                                                      "${singleUser.total}",
                                                      style: TextStyle(
                                                          fontSize: 26,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  )),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 40,
                                            child: Container(
                                              height: 30,
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  );
                                }),
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
