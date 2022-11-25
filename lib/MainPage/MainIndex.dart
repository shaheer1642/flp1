import 'package:flp1/Widgets/BrandName.dart';
import 'package:flp1/Widgets/TextButton1.dart';
import 'package:flp1/Widgets/TextField1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flp1/Widgets/ElevatedButton1.dart';

class MainIndex extends StatefulWidget {
  const MainIndex({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _MainIndexState createState() => _MainIndexState();
}

class _MainIndexState extends State<MainIndex> {
  final taskInputController = TextEditingController();

  List workers = [
    {"type": 'electrician', "icon": Icons.lightbulb},
    {"type": 'plumber', "icon": Icons.water_drop},
    {"type": 'gardner', "icon": Icons.yard},
    {"type": 'housekeeper', "icon": Icons.iron},
    {"type": 'cook', "icon": Icons.cookie},
  ];

  void taskInputOnChange(text) {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80, // Set this height
        backgroundColor: Colors.white,
        title: const BrandName(),
        actions: <Widget>[
          ButtonBar(
            children: [
              TextButton1(
                  text: 'Registeration',
                  fontSize: 20,
                  onPressed: () => {print('Registeration clicked')}),
              ElevatedButton1(
                text: 'Login',
                fontSize: 20,
                onPressed: () => {print('Login clicked')},
              )
            ],
          )
        ],
      ),
      body: Center(
          child: Container(
              padding: EdgeInsets.all(20),
              child: Container(
                  padding: EdgeInsets.all(50),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 4,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: TextField1(
                                hintText: 'Enter your task',
                                controller: taskInputController,
                                onChanged: taskInputOnChange,
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              flex: 2,
                              child: ElevatedButton1(
                                text: 'GET PRICE',
                                fontSize: 20,
                                onPressed: () => {print('GET PRICE clicked')},
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: workers.length,
                          itemBuilder: (ctx, int) {
                            return Container(
                              width: 125,
                              height: 50,
                              margin: EdgeInsets.all(10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(125)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.5),
                                    spreadRadius: 3,
                                    blurRadius: 7,
                                    offset: Offset(
                                        0, 3), // changes position of shadow
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    workers[int]["icon"],
                                    color: Colors.pink,
                                    size: 50,
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Text('${workers[int]["type"]}')
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      Expanded(flex: 1, child: Container()),
                    ],
                  )))),
    );
  }
}
