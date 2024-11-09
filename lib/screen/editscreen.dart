import 'package:badge_task/function/function.dart';
import 'package:badge_task/model/model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

// ignore: must_be_immutable
class Editscreen extends StatefulWidget {
  int index;
  String title;
  String notes;
  Editscreen(
      {super.key,
      required this.title,
      required this.notes,
      required this.index});

  @override
  State<Editscreen> createState() => _EditscreenState();
}

class _EditscreenState extends State<Editscreen> {
  TextEditingController titleCtl = TextEditingController();
  TextEditingController noteCtl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titleCtl = TextEditingController(text: widget.title);
    noteCtl = TextEditingController(text: widget.notes);
    return Scaffold(
      appBar: AppBar(
        actions: [
          const Icon(Icons.push_pin_outlined),
          const Gap(10),
          const Icon(Icons.notification_add_rounded),
          const Gap(10),
          const Icon(Icons.archive),
          IconButton(
              onPressed: () {
                addButton();
              },
              icon: const Icon(Icons.save))
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(12),
            child: Column(
              children: [
                TextField(
                  controller: titleCtl,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(fontSize: 25)),
                ),
                const Gap(10),
                TextField(
                  controller: noteCtl,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Note',
                      hintStyle: TextStyle(fontSize: 15)),
                )
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 50,
              width: double.infinity,
              color: const Color(0xffeaeef7),
              child: const Row(
                children: [
                  Gap(10),
                  Icon(Icons.add_box),
                  Gap(10),
                  Icon(Icons.palette),
                  Gap(10),
                  Icon(Icons.format_underline_outlined),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> addButton() async {
    if (titleCtl.text.isNotEmpty && noteCtl.text.isNotEmpty) {
      final notes = GoogleNotes(
        title: titleCtl.text,
        subTitle: noteCtl.text,
      );
      editing(widget.index, notes);
      Navigator.pop(context);
    }
  }
}
