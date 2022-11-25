import 'package:flp1/ClientPage/ClientDashboard.dart';
import 'package:flp1/Widgets/BrandName.dart';
import 'package:flp1/Widgets/TextButton1.dart';
import 'package:flp1/Widgets/TextField1.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flp1/Widgets/ElevatedButton1.dart';

class ClientIndex extends StatefulWidget {
  const ClientIndex({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ClientIndexState createState() => _ClientIndexState();
}

class _ClientIndexState extends State<ClientIndex> {
  final taskInputController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
        toolbarHeight: 80, // Set this height
        backgroundColor: Colors.white,
            bottom: PreferredSize(
          preferredSize: Size.fromHeight(-8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 20,bottom: 20),
                  child: const BrandName()),
              SizedBox(
                width: 50,
              ),
              Flexible(
                child: TabBar(
                  labelColor: Colors.pink,
                  indicatorColor: Colors.pink,
                  labelStyle: TextStyle(fontSize: 20),
                  tabs: [
                    Tab(text: 'Dashboard'),
                    Tab(text: 'Payment History'),
                    Tab(text: 'Profile'),
                  ],
                ),
              ),
            ],
          ),
        )),
        body: TabBarView(
          children: [
            ClientDashboard(),
            Container(),
            Container(),
          ],
        ),
      ),
    );
  }
}
