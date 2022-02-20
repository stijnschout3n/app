import 'package:app/crm/addCustomer.dart';
import 'package:app/crm/crm.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/services/services.dart';
import 'package:app/shared/shared.dart';

class CrmScreen extends StatefulWidget {
  const CrmScreen({Key? key}) : super(key: key);

  @override
  State<CrmScreen> createState() => _CrmScreenState();
}

class _CrmScreenState extends State<CrmScreen> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Customer>>(
      future: FirestoreService().getCustomersRelatedToUser(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const LoadingScreen();
        } else if (snapshot.hasError) {
          return Center(
            child: ErrorMessage(message: snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          var customers = snapshot.data!;

          return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.deepPurple,
                title: const Text('CRM'),
                actions: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(right: 20.0),
                    child: GestureDetector(
                        onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CrmScreen()))
                            .then((value) => setState(() {})),
                        child: Row(children: <Widget>[
                          Text('Add'),
                          Icon(Icons.contacts)
                        ])),
                  )
                ],
              ),
              body: FractionallySizedBox(
                widthFactor: 0.9,
                child: SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: DataTable(columns: const [
                      DataColumn(label: Text("First Name")),
                      DataColumn(label: Text("Last Name")),
                      DataColumn(label: Text("Address")),
                      DataColumn(label: Text("Phone")),
                      DataColumn(label: Text("Email")),
                    ], rows: getRows(customers)),
                  ),
                ),
              ));
        } else {
          return const Text('No topics found in Firestore. Check database');
        }
      },
    );
  }

  List<DataRow> getRows(List<Customer> customers) =>
      customers.map((Customer customer) {
        final cells = [
          customer.firstname,
          customer.lastname,
          customer.street,
          customer.phone,
          customer.email
        ];
        return DataRow(cells: getCells(cells));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();
}
