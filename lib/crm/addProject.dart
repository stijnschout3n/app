import 'package:app/services/services.dart';
import 'package:flutter/material.dart';
import 'package:app/services/services.dart';
import 'package:table_calendar/table_calendar.dart';

class addProject extends StatefulWidget {
  addProject({Key? key, required this.customer}) : super(key: key);

  final Customer customer;

  final FocusNode _labelFocusNode = FocusNode();
  final FocusNode _causeFocusNode = FocusNode();

  final TextEditingController _labelController = TextEditingController();
  final TextEditingController _causeController = TextEditingController();

  @override
  State<addProject> createState() => _addProjectState();
}

class _addProjectState extends State<addProject> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register Project"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(),
                TextFormField(),
                TableCalendar(focusedDay: DateTime.now(), firstDay: DateTime(2019, 1, 1), lastDay: DateTime(2023, 1, 1))
              ],
            ),
          ),
        ),
      ),
    );
  }

  _submitForm() {
    if (_formKey.currentState!.validate()) {
      Project p = Project();

      p.customer = widget.customer.fid;
      DateTime dateTime = DateTime.now();
      p.timeCreated = dateTime.toString();
    }
  }
}
