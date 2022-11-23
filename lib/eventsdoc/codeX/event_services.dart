import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventServices {
  // the var used to make acces to the data base ;
  final CollectionReference event =
      FirebaseFirestore.instance.collection('eventdb');

  Future<void> create(String name, int date) async {
    // final String name = "_nameController.text";
    // final String date = "_priceController.text";
    if (date != null) {
      await event.add({"name": name, "date": date});
      print("addes succer biatchh ");
      // _nameController.text = '';
      // _priceController.text = '';
      // Navigator.of(context).pop();

    }
  }

  // Future<void> createe(Map<String, dynamic> data) async {
  //   final String name = data['name'];
  //   final String date = data['date'];
  //   final String desc = data['description'];
  //   final bool public = data['public'];
  //   if (data != null) {
  //     await event.add(
  //         {"name": name, "date": date, "description": desc, "public": public});
  //     print("succese ");
  //     // _nameController.text = '';
  //     // _priceController.text = '';
  //     // Navigator.of(context).pop();

  //   }
  // }
}
