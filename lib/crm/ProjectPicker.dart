import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:app/services/services.dart';
import 'package:app/shared/shared.dart';

//todo show list of ongoing projects make a toggle to show finished projects
class ProjectPicker extends StatefulWidget {
  ProjectPicker({Key? key, required this.customer}) : super(key: key);

  final Customer customer;
  @override
  State<ProjectPicker> createState() => _ProjectPickerState();
}

class _ProjectPickerState extends State<ProjectPicker> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Project>>(
        future: FirestoreService().getProjectsRelatedToCustomer(widget.customer),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const LoadingScreen();
          } else if (snapshot.hasError) {
            return Center(
              child: ErrorMessage(message: snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            var projects = snapshot.data!;
            return Scaffold(
              appBar: AppBar(
                title: const Text("Select project"),
              ),
              body: ListView.builder(
                  itemCount: projects.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(width: 5.0, color: Helpers().getColorBasedOnStatus(projects[index]))),
                        child: Row(
                          children: [
                            const SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.house),
                            const SizedBox(
                              width: 10,
                            ),
                            Column()
                          ],
                        ),
                      ),
                    );
                  }),
            );
          } else {
            return const Text('No projects found');
          }
        });
  }
}
