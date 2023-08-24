import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:json_api/screens/login_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../model/prayer.dart';
import '../utils/my_Row.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return HomeState();
  }
}

class HomeState extends State {
  TextStyle myStyle = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.bold,
  );
  List<Prayer> monthData = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("api"),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: () => getData()),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: ListView(children: [
          ElevatedButton(onPressed: () => getData(), child: Text("get data")),
          ElevatedButton(
              onPressed: () => logOut(), child: const Text("logout")),
          Row(
            children: [
              Spacer(),
              Text("Fajr", style: myStyle),
              Spacer(),
              Text("Duhar"),
              Spacer(),
              Text("Asar"),
              Spacer(),
              Text("Magrib"),
              Spacer(),
              Text("Isha"),
              Spacer()
            ],
          ),
          ListView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemCount: monthData.length,
              itemBuilder: (context, index) => MyRow(monthData[index])),
        ]),
      ),
    );
  }

  getData() async {
    var url = Uri.parse(
        "https://api.aladhan.com/v1/calendarByCity/2023/8?city=Lahore&country=Pakistan&method=2");
    var response = await http.get(url);
    Map<String, dynamic> data = jsonDecode(response.body);
    // print(data["data"][0]["timings"]);
    // print(response.body);
    setState(() {
      monthData = Prayer.getMonthData(data);
    });
  }

  logOut() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("LOGIN", false);

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (Route<dynamic> route) => false);
  }
}
