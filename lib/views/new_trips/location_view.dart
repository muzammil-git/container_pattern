import 'package:container_pattern/model/Trip.dart';
import 'package:flutter/material.dart';

import 'date_view.dart';

class NewTripLocationView extends StatelessWidget {
  final Trip trip;
  NewTripLocationView({Key key, @required this.trip}) : super(key:key);
  @override
  Widget build(BuildContext context) {
    TextEditingController _titleController = new TextEditingController();
    _titleController.text = trip.title;

    return Scaffold(
      appBar: AppBar(
        title: Text('Create Trip - Location'),
      ),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Enter a location'),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: TextField(
                  controller: _titleController,
                  autofocus: true,
                ),
              ),
              ElevatedButton(
                  onPressed:(){
                    trip.title = _titleController.text;
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => NewTripDateView(trip:trip)));

                  },
                  child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
