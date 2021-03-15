import 'package:container_pattern/model/Trip.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PlacesListView extends StatelessWidget {
  final List<Trip> tripList = [
    Trip("America", DateTime.now(), DateTime.now(), 200.0, "Car"),
    Trip("Maldives", DateTime.now(), DateTime.now(), 700.0, "Plane"),
    Trip("Bali", DateTime.now(), DateTime.now(), 400.0, "Plane"),
    Trip("Canada", DateTime.now(), DateTime.now(), 100.0, "Train")
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        // width: MediaQuery.of(context).size.width,
        // height: MediaQuery.of(context).size.height,
        // color: Colors.blk,
        child: new ListView.builder(
            itemCount: tripList.length,
            itemBuilder: (BuildContext context, int index) {
              return buildTripCard(context, index);
            }),
      ),
    );
  }

  Widget buildTripCard(BuildContext context, int index) {
    final trip = tripList[index];
    return new Container(
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Text(index.toString()),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 4.0),
                child: Row(
                  children: [
                    Text(trip.title, style: TextStyle(fontSize: 30),),
                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:4.0,bottom: 80.0),
                child: Row(
                  children: [
                    Text(
                        "${trip.startDate.day.toString()}/${trip.startDate.month.toString()}/${trip.startDate.year.toString()} - ${trip.endDate.day.toString()}/${trip.endDate.month.toString()}/${trip.endDate.year.toString()}",
                    // style: TextStyle(fontSize: 35),
                    ),

                    Spacer(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0,bottom: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("\$${trip.budget.toStringAsFixed(2)}",
                      style: TextStyle(fontSize: 35),
                    ),
                    Spacer(),
                    // Text(trip.travelType.toString()),
                    Icon(Icons.directions_car)
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}

//  child: Column(
//           children: [
//             Row(
//               // mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   onPressed: (){
//                     Navigator.push(context, MaterialPageRoute(builder: (context) =>
//                     MyHomePage()));
//                   },
//                   style: ElevatedButton.styleFrom(
//
//
//
//                   ),
//                   child: Text('Go Back'),
//                 )
//               ],
//             ),
//           ],
//         ),
