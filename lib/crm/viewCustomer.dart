import 'package:app/archive/crm_archived.dart';
import 'package:app/crm/AddProject.dart';
import 'package:app/crm/ProjectPicker.dart';
import 'package:app/crm/ViewProject.dart';
import 'package:app/crm/crm.dart';
import 'package:flutter/material.dart';
import 'package:app/services/services.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ViewCustomerScreen extends StatefulWidget {
  const ViewCustomerScreen({Key? key, required this.customer}) : super(key: key);

  final Customer customer;

  @override
  State<ViewCustomerScreen> createState() => _ViewCustomerScreenState();
}

class _ViewCustomerScreenState extends State<ViewCustomerScreen> {
  bool switchstatus = false;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    TextEditingController _firstnameController = TextEditingController(text: widget.customer.firstname);
    TextEditingController _lastnameController = TextEditingController(text: widget.customer.lastname);
    TextEditingController _emailController = TextEditingController(text: widget.customer.email);
    TextEditingController _phoneController = TextEditingController(text: widget.customer.phone);
    TextEditingController _streetController = TextEditingController(text: widget.customer.street);
    TextEditingController _housenumberController = TextEditingController(text: widget.customer.housenumber);
    TextEditingController _zipcodeController = TextEditingController(text: widget.customer.zipcode);
    TextEditingController _townController = TextEditingController(text: widget.customer.town);
    TextEditingController _notesController = TextEditingController(text: widget.customer.notes);

    _submitForm() {
      if (_formKey.currentState!.validate()) {
        Customer c = Customer();
        c.fid = widget.customer.fid;
        c.uid = widget.customer.uid;

        c.firstname = _firstnameController.text;
        c.lastname = _lastnameController.text;
        c.email = _emailController.text;
        c.phone = _phoneController.text;
        c.street = _streetController.text;
        c.housenumber = _housenumberController.text;
        c.zipcode = _zipcodeController.text;
        c.town = _townController.text;
        c.notes = _notesController.text;

        FirestoreService().editCustomer(c);

        // If the form passes validation, display a Snackbar.
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Registration sent')));
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
            builder: (BuildContext context) => CrmScreen(),
          ),
          (route) => false,
        );
      }
    }

    return Scaffold(
        appBar: AppBar(
          title: Text("Client"),
          actions: <Widget>[
            Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: Row(
                children: [
                  Text("Edit mode"),
                  Switch(
                    value: switchstatus,
                    onChanged: (value) {
                      setState(() {
                        switchstatus = value;
                      });
                    },
                  ),
                  ElevatedButton(
                      onPressed: () {
                        showDialog(context: context, builder: (context) => _deletePopupDialog(context));
                      },
                      child: Row(children: const <Widget>[Text('Delete'), Icon(Icons.delete)]))
                ],
              ),
            )
          ],
        ),
        body: Padding(
            padding: EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Row(children: [
                    ElevatedButton.icon(
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => AddProject(customer: widget.customer))),
                      icon: Icon(FontAwesomeIcons.houseDamage),
                      label: Text("Register"),
                      style: ElevatedButton.styleFrom(fixedSize: (const Size(120, 50))),
                    ),
                    ElevatedButton.icon(
                      onPressed: () => Navigator.push(
                          context, MaterialPageRoute(builder: (context) => ProjectPicker(customer: widget.customer))),
                      icon: Icon(FontAwesomeIcons.houseDamage),
                      label: Text("View"),
                      style: ElevatedButton.styleFrom(fixedSize: (const Size(120, 50))),
                    ),
                  ]),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        //notes
                        TextFormField(
                          readOnly: !switchstatus,
                          keyboardType: TextInputType.multiline,
                          controller: _notesController,
                          decoration: InputDecoration(labelText: "Enter notes"),
                          maxLines: 10,
                        ),

                        //firstname
                        TextFormField(
                          readOnly: !switchstatus,
                          keyboardType: TextInputType.name,
                          controller: _firstnameController,
                          decoration: InputDecoration(labelText: "First name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill in a first name';
                            }
                            return null;
                          },
                        ),
                        //lastname
                        TextFormField(
                          readOnly: !switchstatus,
                          keyboardType: TextInputType.name,
                          controller: _lastnameController,
                          decoration: InputDecoration(labelText: "Last name"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill in a last name';
                            }
                            return null;
                          },
                        ),
                        //email
                        TextFormField(
                            readOnly: !switchstatus,
                            keyboardType: TextInputType.emailAddress,
                            controller: _emailController,
                            decoration: InputDecoration(labelText: "Email"),
                            validator: (value) {
                              if (RegExp(
                                      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                                  .hasMatch(value.toString())) {
                                return null;
                              }
                              return 'Please fill in a valid email';
                            }),
                        //phone
                        TextFormField(
                          readOnly: !switchstatus,
                          keyboardType: TextInputType.phone,
                          controller: _phoneController,
                          decoration: InputDecoration(labelText: "Phone"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill in a phone number';
                            }
                            return null;
                          },
                        ),
                        //street
                        TextFormField(
                          readOnly: !switchstatus,
                          keyboardType: TextInputType.text,
                          controller: _streetController,
                          decoration: InputDecoration(labelText: "Street"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill in a street name';
                            }
                            return null;
                          },
                        ),
                        //housenumber
                        TextFormField(
                          readOnly: !switchstatus,
                          keyboardType: TextInputType.streetAddress,
                          controller: _housenumberController,
                          decoration: InputDecoration(labelText: "Housenumber"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill in a housenumber';
                            }
                            return null;
                          },
                        ),
                        //zipcode
                        TextFormField(
                          readOnly: !switchstatus,
                          keyboardType: TextInputType.streetAddress,
                          controller: _zipcodeController,
                          decoration: InputDecoration(labelText: "Zipcode"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill in a zipcode';
                            }
                            return null;
                          },
                        ),
                        //town
                        TextFormField(
                          readOnly: !switchstatus,
                          keyboardType: TextInputType.streetAddress,
                          controller: _townController,
                          decoration: InputDecoration(labelText: "Town or city"),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please fill in a town or city';
                            }
                            return null;
                          },
                        ),
                        Row(
                          children: [
                            if (switchstatus)
                              Expanded(
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    top: 16,
                                  ),
                                  child: ElevatedButton(
                                    onPressed: () => _submitForm(),
                                    child: Text('Update'),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  Widget _deletePopupDialog(BuildContext context) {
    return AlertDialog(
      title: const Text('Warning'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text("Are you sure you want to delete ${widget.customer.firstname}?"),
        ],
      ),
      actions: <Widget>[
        Row(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            Spacer(),
            ElevatedButton(onPressed: _deleteCustomer, child: const Text('Yes')),
          ],
        ),
      ],
    );
  }

  void _deleteCustomer() {
    FirestoreService().editCustomer(widget.customer, delete: true);
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => CrmScreen(),
      ),
      (route) => false,
    );
  }
}
