import 'package:intl/intl.dart';
import 'package:flutter/material.dart';

class AgeCalculator extends StatefulWidget {
  @override
  _AgeCalculatorState createState() => _AgeCalculatorState();
}

class _AgeCalculatorState extends State<AgeCalculator> {
  DateTime? _selectedDate;
  String _result = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Age Calculator'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              //select date icon
              IconButton(onPressed: ()=>_selectedDate, 
              icon: Icon(Icons.date_range,size: 55,)),
                
               
              const SizedBox(height: 20),

                //show select date of birthh
              _selectedDate != null
                  ? Text(
                      'Date of Birth: ${DateFormat('yyyy-MM-dd').format(_selectedDate!)}',
                      style: const TextStyle(fontSize: 18),
                    )

                  : Container(),

              const SizedBox(height: 20),

              //calculate age
              ElevatedButton(
                onPressed: _selectedDate != null ? _calculateAge : null,
                child: const Text('Calculate Age'),
              ),

              const SizedBox(height: 20),

              //result
              Text(
                'Age: $_result',
                style: const TextStyle(fontSize: 18),
              ),

            ],
          ),
        ),
      ),
    );
  }

  //Select Date
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  //Age Calculate
  void _calculateAge() {
    // Calculate the age
    DateTime now = DateTime.now();
    int age = now.year - _selectedDate!.year;
    

    // Check if birthday has occurred this year


    if(_selectedDate != null){
 if (now.month < _selectedDate!.month ||
        (now.month == _selectedDate?.month && now.day < _selectedDate!.day)) {
      age--;
    }
    }
   

    // Update the result in the UI
    setState(() {
      _result = '$age years';
    });
  }
}