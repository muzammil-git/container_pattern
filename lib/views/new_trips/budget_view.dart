import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:container_pattern/model/Trip.dart';
import 'package:flutter/material.dart';

class NewTripBudgetView extends StatelessWidget {
  // final Future<FirebaseApp> _tripApp = Firebase.initializeApp();
  final db = FirebaseFirestore.instance;
  final Trip trip;

  NewTripBudgetView({Key key, @required this.trip}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip - Location'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Finish'),
              Text('${trip.title}'),
              Text('${trip.startDate}'),
              Text('${trip.endDate}'),
              Text('${trip.budget}'),
              ElevatedButton(
                onPressed: () async {
                  //save data to firebase
                  await db.collection("trips").add({
                    'title': trip.title,
                    'startDate': trip.startDate,
                    'endDate': trip.endDate,
                  });

                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: Text('Finish'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void postTrip() async {
    await db.collection("trips").add({
      'title': trip.title,
      'startDate': trip.startDate,
      'endDate': trip.endDate,
    });
  }
}
