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
    {"type": 'Electrician', "icon": Icons.lightbulb},
    {"type": 'Plumber', "icon": Icons.water_drop},
    {"type": 'Gardner', "icon": Icons.yard},
    {"type": 'Housekeeper', "icon": Icons.iron},
    {"type": 'Cook', "icon": Icons.cookie},
    {"type": 'More', "icon": Icons.arrow_right}
  ];
  int selectedWorkerIndex = 0;

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
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(flex: 1, child: Container()),
                      Expanded(
                        flex: 2,
                        child: Row(
                          children: [
                            Expanded(
                              flex: 10,
                              child: TextField1(
                                hintText: 'Enter your location',
                                controller: taskInputController,
                                onChanged: taskInputOnChange,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text('Select Task',style: TextStyle(color: Colors.pink,fontSize: 30),),
                      Expanded(
                          flex: 2,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: workers.length,
                            itemBuilder: (ctx, index) {
                              return Align(
                                alignment: Alignment.center,
                                child: Container(
                                    width: 150,
                                    height: 150,
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                        color: selectedWorkerIndex == index
                                            ? Colors.pink
                                            : Colors.white,
                                        width: 5,
                                      ),
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(150)),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 3,
                                          blurRadius: 7,
                                          offset: Offset(0,
                                              3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: InkWell(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(150)),
                                      onTap: (() {
                                        setState(() {
                                          selectedWorkerIndex = index;
                                        });
                                        print(
                                            'inkwell pressed $selectedWorkerIndex');
                                      }),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          Icon(
                                            workers[index]["icon"],
                                            color: Colors.pink,
                                            size: 50,
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          Text('${workers[index]["type"]}')
                                        ],
                                      ),
                                    )),
                              );
                            },
                          )),
                      Expanded(flex: 1, child: Container()),
                      Container(
                        width: 100,
                        child: 
                      ElevatedButton1(
                                text: 'Go',
                                fontSize: 20,
                                onPressed: () => {print('GET PRICE clicked')},
                              ),
                      )
                    ],
                  )))),
    );
  }
}
