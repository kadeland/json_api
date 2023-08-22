import 'package:flutter/material.dart';

import '../model/prayer.dart';

class MyRow extends StatelessWidget {
  Prayer data;
  MyRow(this.data, {super.key});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 3),
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(color: Colors.black, width: 1),
            borderRadius: BorderRadius.circular(1)),
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Container(
            //     padding: EdgeInsets.all(5),
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.black, width: 2),
            //         borderRadius: BorderRadius.circular(1)),
            //     child: Text(data.fajr)),
            // Container(
            //     padding: EdgeInsets.all(5),
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.black, width: 2),
            //         borderRadius: BorderRadius.circular(1)),
            //     child: Text(data.dhuhr)),
            // Container(
            //     padding: EdgeInsets.all(5),
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.black, width: 2),
            //         borderRadius: BorderRadius.circular(1)),
            //     child: Text(data.asar)),
            // Container(
            //     padding: EdgeInsets.all(5),
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.black, width: 2),
            //         borderRadius: BorderRadius.circular(1)),
            //     child: Text(data.maghrib)),
            // Container(
            //     padding: EdgeInsets.all(5),
            //     decoration: BoxDecoration(
            //         border: Border.all(color: Colors.black, width: 2),
            //         borderRadius: BorderRadius.circular(1)),
            //     child: Text(data.isha)),

            Row(children: [
              Text(data.fajr),
              const SizedBox(
                width: 10,
              ),
              Text(data.dhuhr),
              const SizedBox(
                width: 10,
              ),
              Text(data.asar),
            ]),
            const SizedBox(
              height: 10,
            ),
            Row(children: [
              Text(data.maghrib),
              const SizedBox(
                width: 10,
              ),
              Text(data.isha),
            ]),
          ],
        ),
      ),
    );
  }
}
