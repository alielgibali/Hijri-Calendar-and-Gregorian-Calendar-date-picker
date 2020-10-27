import 'package:flutter/material.dart';
import 'package:hijri_picker/hijri_picker.dart';
import 'package:hijri/hijri_calendar.dart';

class DatePicker extends StatefulWidget {
  @override
  _DatePickerState createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  _presntDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime(1990),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
    ).then((pickedDate) {
      if (pickedDate == null) {
        return;
      }
    });
  }
  var selectedDate = new HijriCalendar.now();
   Future<Null> _selectDateHijri(BuildContext context) async {
    
     await showHijriDatePicker(
      context: context,
      initialDate: HijriCalendar.now(),

      lastDate:  HijriCalendar()
        ..hYear = 1445
        ..hMonth = 9
        ..hDay = 25,
      firstDate:  HijriCalendar()
        ..hYear = 1438
        ..hMonth = 12
        ..hDay = 25,
      initialDatePickerMode: DatePickerMode.day,
    );
    // if (picked != null)
    //   setState(() {
    //     selectedDate = picked;
    //   });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FlatButton.icon(
              onPressed: _presntDatePicker,
              icon: Icon(Icons.data_usage),
              label: Text('DatePicker Miladi'),
            ),
             FlatButton.icon(
              onPressed:()=> _selectDateHijri(context),
              icon: Icon(Icons.data_usage),
              label: Text('DatePicker Hijri'),
            ),
          ],
        ),
      ),
    );
  }
}
