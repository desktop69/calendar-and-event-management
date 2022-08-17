import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class EventServices {
  // the var used to make acces to the data base ;
  final CollectionReference event =
      FirebaseFirestore.instance.collection('eventcrud');

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
}
