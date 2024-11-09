import 'package:badge_task/model/model.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<GoogleNotes>> googlenotes = ValueNotifier([]);

Future<void> addNotes(GoogleNotes value) async {
  final googleSave = await Hive.openBox<GoogleNotes>('savedata');
  await googleSave.add(value);
  getData();
}

Future<void> getData() async {
  final googleSave = await Hive.openBox<GoogleNotes>('savedata');
  googlenotes.value.clear();
  googlenotes.value.addAll(googleSave.values);
  googlenotes.notifyListeners();
}

Future<void> editing(int index, GoogleNotes value) async {
  final googleSave = await Hive.openBox<GoogleNotes>('savedate');
  googleSave.putAt(index, value);
  getData();
}

Future<void> delete(int index) async {
  final googleSave = await Hive.openBox<GoogleNotes>('savedata');
  googleSave.deleteAt(index);
  getData();
}
