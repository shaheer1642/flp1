import 'package:flutter/material.dart';

class TopTabsController extends StatelessWidget {
  const TopTabsController({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
            bottom: PreferredSize(
          preferredSize: Size.fromHeight(-8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(left: 20),
                  child: Center(child: Text('JobUp'))),
              SizedBox(
                width: 50,
              ),
              Flexible(
                child: TabBar(
                  tabs: [
                    Tab(text: 'Dashboard'),
                    Tab(text: 'Payment'),
                    Tab(text: 'Profile'),
                  ],
                ),
              ),
            ],
          ),
        )),
        body: TabBarView(
          children: [
            Icon(Icons.search),
            Icon(Icons.file_download),
            Icon(Icons.file_download),
          ],
        ),
      ),
    );
  }
}
