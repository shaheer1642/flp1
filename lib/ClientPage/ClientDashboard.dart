import 'package:flp1/Widgets/BrandName.dart';
import 'package:flp1/Widgets/TextButton1.dart';
import 'package:flp1/Widgets/TextField1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flp1/Widgets/ElevatedButton1.dart';


  List workers = [
    {"type": 'Electrician', "icon": Icons.lightbulb},
    {"type": 'Plumber', "icon": Icons.water_drop},
    {"type": 'Gardner', "icon": Icons.yard},
    {"type": 'Housekeeper', "icon": Icons.iron},
    {"type": 'Cook', "icon": Icons.cookie}
  ];

  Map tasks = {
    'Electrician': [
      'Electrician task 1',
      'Electrician task 2',
      'Electrician task 3',
    ],
    'Plumber': [
      'Unblock a toilet',
      'Unblock a sink',
      'Fix a water leak',
      'Install a sink',
      'Install a shower',
      'Install a toilet',
    ],
    'Gardner': [
      'Gardner task 1',
      'Gardner task 2',
      'Gardner task 3',
    ],
    'Housekeeper': [
      'Housekeeper task 1',
      'Housekeeper task 2',
      'Housekeeper task 3',
    ],
    'Cook': [
      'Cooking task 1',
      'Cooking task 2',
      'Cooking task 3',
    ],
  };

class ClientDashboard extends StatefulWidget {
  const ClientDashboard({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ClientDashboardState createState() => _ClientDashboardState();
}

class _ClientDashboardState extends State<ClientDashboard> {
  String serviceType = 'Plumber';
  String serviceTask = 'Unblock a sink';

  void setServiceTask(text) {
    setState(() {
      serviceTask = text;
    });
  }

  void setServiceType(text) {
    setState(() {
      serviceType = text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
            flex: 3,
            child: Container(
              color: Colors.white,
            )),
        Flexible(
            flex: 2,
            child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(color: Colors.grey, width: 1),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 2,
                      offset: Offset(-2, 1), // changes position of shadow
                    ),
                  ],
                ),
                child: ListView(
                  children: [
                    NewTask(
                          serviceTask: serviceTask, serviceType: serviceType),
                          Location(),
                          ServiceType(setServiceType: setServiceType, setServiceTask: setServiceTask),
                          ServiceTasks(serviceType: serviceType,setServiceTask: setServiceTask),
                          TaskDescription(),
                          AvailableDate(),
                          AvailableTime(),
                  ],
                )))
      ],
    );
  }
}

class TextHeading extends StatelessWidget {
  const TextHeading({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.grey, fontSize: 14));
  }
}

class TextTitle extends StatelessWidget {
  const TextTitle({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: TextStyle(color: Colors.black, fontSize: 16));
  }
}

class NewTask extends StatelessWidget {
  const NewTask(
      {super.key, required this.serviceType, required this.serviceTask});
  final String serviceType;
  final String serviceTask;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeading(text: 'New Task'),
          TextTitle(
            text: 'I need a ${serviceType} to ${serviceTask}',
          ),
          SizedBox(
            height: 10,
          ),
          Text('suitable time....'),
          Text('my address....'),
          SizedBox(
            height: 20,
          ),
          ElevatedButton1(
              text: 'Create Task',
              onPressed: () => print('Create Task pressed'))
        ],
      ),
    );
  }
}

class Location extends StatefulWidget {
  const Location({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _LocationState createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeading(text: 'Location'),
          Text('address...'),
        ],
      ),
    );
  }
}

class ServiceType extends StatefulWidget {
  const ServiceType({Key? key, required this.setServiceType, required this.setServiceTask}) : super(key: key);
  final Function setServiceType;
  final Function setServiceTask;
  @override
  // ignore: library_private_types_in_public_api
  _ServiceTypeState createState() => _ServiceTypeState();
}

class _ServiceTypeState extends State<ServiceType> {
  int selectedWorkerIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeading(text: 'Service Type'),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: workers.length,
              itemBuilder: (ctx, index) {
                return Align(
                  alignment: Alignment.center,
                  child: Container(
                      width: 100,
                      height: 100,
                      margin: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: selectedWorkerIndex == index
                              ? Colors.pink
                              : Colors.white,
                          width: 5,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 3,
                            blurRadius: 7,
                            offset: Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: InkWell(
                        borderRadius: BorderRadius.all(Radius.circular(50)),
                        onTap: (() {
                          setState(() {
                            selectedWorkerIndex = index;
                          });
                          widget.setServiceType(workers[index]["type"]);
                          widget.setServiceTask(tasks[workers[index]["type"]][0]);
                          print('inkwell pressed $selectedWorkerIndex');
                        }),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(
                              workers[index]["icon"],
                              color: Colors.pink,
                              size: 30,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '${workers[index]["type"]}',
                              style: TextStyle(fontSize: 12),
                            )
                          ],
                        ),
                      )),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ServiceTasks extends StatefulWidget {
  const ServiceTasks({Key? key, required this.serviceType,required this.setServiceTask}) : super(key: key);
  final String serviceType;
  final Function setServiceTask;
  @override
  // ignore: library_private_types_in_public_api
  _ServiceTasksState createState() => _ServiceTasksState();
}

class _ServiceTasksState extends State<ServiceTasks> {
  int selectedTaskIndex = 1;
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const TextHeading(text: 'Service Tasks'),
          Container(
              height: 40,
              margin: EdgeInsets.only(top: 10),
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: List.generate(tasks[widget.serviceType].length, (int index) {
                  return InkWell(
                    onTap: () {
                      setState(() {
                        selectedTaskIndex=index;
                      });
                      widget.setServiceTask(tasks[widget.serviceType][index]);
                    },
                    child: Container(
                    padding: EdgeInsets.all(10),
                    margin: EdgeInsets.only(right: 10),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: selectedTaskIndex == index ? Colors.pink : Colors.black,
                          width: 2,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                      ),
                    child: Text(tasks[widget.serviceType][index]),
                  ),
                  );
                }),
              ),
          ),
        ],
      ),
    );
  }
}

class TaskDescription extends StatefulWidget {
  const TaskDescription({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _TaskDescriptionState createState() => _TaskDescriptionState();
}

class _TaskDescriptionState extends State<TaskDescription> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeading(text: 'Task Description'),
          Text('Task Description...'),
        ],
      ),
    );
  }
}

class AvailableDate extends StatefulWidget {
  const AvailableDate({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AvailableDateState createState() => _AvailableDateState();
}

class _AvailableDateState extends State<AvailableDate> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeading(text: 'Date'),
          Text('date...'),
        ],
      ),
    );
  }
}

class AvailableTime extends StatefulWidget {
  const AvailableTime({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _AvailableTimeState createState() => _AvailableTimeState();
}

class _AvailableTimeState extends State<AvailableTime> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey.shade200, width: 1),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextHeading(text: 'Time'),
          Text('time...'),
        ],
      ),
    );
  }
}
