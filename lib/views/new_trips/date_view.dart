import 'package:container_pattern/model/Trip.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'budget_view.dart';

class NewTripDateView extends StatefulWidget {
  final Trip trip;
  NewTripDateView({Key key, @required this.trip}) : super(key:key);

  @override
  _NewTripDateViewState createState() => _NewTripDateViewState();
}

class _NewTripDateViewState extends State<NewTripDateView> {
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
              Text('Location: ${widget.trip.title}'),
              SizedBox(height: 50,),

              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:30.0, right: 30),
                    child: Row(
                      children: [
                        Text('Enter Start Date\n ${DateFormat("dd/MM/yyyy").format(_startDate).toString()}'),
                        Spacer(),
                        Text('Enter End Date\n${DateFormat("dd/MM/yyyy").format(_endDate).toString()}'),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:30, right: 30, top: 10,bottom:10),
                    child: Row(
                      children: [
                        ElevatedButton(
                            onPressed: ()async{
                              await _selectStartDate(context);
                            },

                            child: Text('Select Date')
                        ),
                        Spacer(),
                        ElevatedButton(
                            onPressed: () async{
                              await _selectEndDate(context);
                            },

                            child: Text('Select Date')
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              ElevatedButton(
                onPressed:(){
                  widget.trip.startDate = _startDate;
                  widget.trip.endDate = _endDate;
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => NewTripBudgetView(trip:widget.trip)));
                },
                child: Text('Continue'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  DateTime _startDate = DateTime(2000,12,01);//= DateTime.now()
  DateTime _endDate = DateTime(2000,12,01); //=DateTime.now().add(Duration(days: 7))

  Future _selectStartDate(BuildContext context) async{
    DateTime _selectedDate = DateTime.now();
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,//When opening map current date will be marked.
      helpText: 'Booking Dates',
      locale: Localizations.localeOf(context),
      firstDate: DateTime(DateTime.now().year -50),//Sets the range of date
      lastDate: DateTime(DateTime.now().year +50),//Sets the range of date
    );
    //Checking if the date is not null
    setState(() {
      if(picked != null){
        _startDate = picked;
    }
    });

  }

  Future _selectEndDate(BuildContext context) async{
    DateTime _selectedDate = DateTime.now();
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(DateTime.now().year -50),
      lastDate: DateTime(DateTime.now().year +50),
    );

    setState(() {
      if(picked != null){
        _endDate = picked;
      }
    });

  }
}

// final Future<DateTimeRange> picked = showDateRangePicker(
//   context: context,
//   firstDate: DateTime(DateTime.now().year -50),
//   lastDate: DateTime(DateTime.now().year +50),
//
// );