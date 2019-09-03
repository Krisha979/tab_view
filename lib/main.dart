import 'package:flutter/material.dart';
import 'notification.dart' as second;
import 'profile.dart' as third;
import 'home.dart' as first;

void main() => runApp(new MyApp());

// stateless widget is used when data cannot be changed
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(


      
      home: new UploadImage(),
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),

    );
  }
}
class UploadImage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return UploadImageState();
  }
  }
  class UploadImageState extends State<UploadImage> with SingleTickerProviderStateMixin {
    TabController controller;
    @override
    void initState() {
      super.initState();
        controller =new TabController(vsync: this, length: 3,);
      }

      @override
      void dispose(){
        controller.dispose();
        super.dispose();
      }
  @override
  Widget build(BuildContext context) {
      return Scaffold(         
      body: new TabBarView(
            controller: controller,
            children: <Widget>[
            new first.Home(),
            new second.Notification(),
            new third.Profile()
              ]  
              ),
        bottomNavigationBar: new Material(
        color: Colors.green,
        child: TabBar(
          controller: controller,
          tabs: <Tab>[
            new Tab(icon: new Icon(Icons.home), text: "Home",),
            new Tab(icon: new Icon(Icons.notifications_active), text: "Notification",),
            new Tab(icon: new Icon(Icons.person), text: "Profile",),
          ]
          ),
        ),

  );
  }
  }
