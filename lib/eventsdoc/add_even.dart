import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:intl/intl.dart';

import 'codeX/event_services.dart';
import 'home_page.dart';

class AddEvents extends StatefulWidget {
  final DateTime selectDate;

  const AddEvents({super.key, required this.selectDate});
  @override
  State<AddEvents> createState() => _AddEventsState();
}

class _AddEventsState extends State<AddEvents> {
  final _formKey = GlobalKey<FormBuilderState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.clear,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                // save event here dady :)
                bool validated = _formKey.currentState!.validate();
                _formKey.currentState!.save();
                final data =
                    Map<String, dynamic>.from(_formKey.currentState!.value);
                data['date'] =
                    DateTime.parse(data['date']).microsecondsSinceEpoch;
                if (data.isNotEmpty) {
                  EventServices().create(data['title'], data['date']);
                  // EventServices().createe(data);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => HomePage()));
                }
              },
              child: const Text("Save"),
            ),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: <Widget>[
          FormBuilder(
              key: _formKey,
              child: Column(
                children: [
                  FormBuilderTextField(
                    name: "title",
                    decoration: const InputDecoration(
                      hintText: "Add title",
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.only(left: 48.0),
                    ),
                  ),
                  const Divider(),
                  FormBuilderTextField(
                    name: "description",
                    maxLines: 5,
                    minLines: 1,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: "Add details",
                      prefixIcon: Icon(Icons.short_text),
                    ),
                  ),
                  const Divider(),
                  FormBuilderSwitch(
                    name: "public",
                    title: const Text("Public"),
                    initialValue: false,
                    controlAffinity: ListTileControlAffinity.leading,
                    decoration: const InputDecoration(border: InputBorder.none),
                  ),
                  const Divider(),
                  FormBuilderDateTimePicker(
                    name: "date",
                    initialValue: widget.selectDate,
                    fieldHintText: "add date",
                    inputType: InputType.date,
                    format: DateFormat('EEEE, dd MMMM, yyyy'),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      prefix: Icon(Icons.calendar_today_sharp),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Firebase.initializeApp().whenComplete(() {
      print("completed");
      setState(() {});
    });
  }
}
