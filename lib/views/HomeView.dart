import 'package:container_pattern/Pages.dart';
import 'package:container_pattern/model/Trip.dart';
import 'package:container_pattern/views/PlacesListView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'new_trips/location_view.dart';

class HomeView extends StatefulWidget {
  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {

  int _currentIndex = 0;
  final List<Widget> _children = [
    PlacesListView(),
    ExplorePage(),
    PastTrips()
  ];

  @override
  Widget build(BuildContext context) {
    final newTrip = new Trip(null, null, null, null, null);
    return Scaffold(
      appBar: AppBar(
        title: Text('Travel Budget App'),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => NewTripLocationView(trip: newTrip)));
            },
          )
        ],

      ),
      body: _children[_currentIndex],

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: onTabTapped,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Past Trips',
          ),
        ],
      ),

    );
  }
  void onTabTapped(int index){
    setState((){
      _currentIndex = index;

    });
  }

}
