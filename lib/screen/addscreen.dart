import 'package:badge_task/function/function.dart';
import 'package:badge_task/model/model.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class Addscreen extends StatefulWidget {
  const Addscreen({super.key});

  @override
  State<Addscreen> createState() => _AddscreenState();
}

class _AddscreenState extends State<Addscreen> {
  TextEditingController titleCtlr = TextEditingController();
  TextEditingController notectrlr = TextEditingController();
  @override
  Widget build(BuildContext context) {
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
                  controller: titleCtlr,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Title',
                      hintStyle: TextStyle(fontSize: 25)),
                ),
                const Gap(10),
                TextField(
                  controller: notectrlr,
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
    if (titleCtlr.text.isNotEmpty && notectrlr.text.isNotEmpty) {
      final notes = GoogleNotes(
        title: titleCtlr.text,
        subTitle: notectrlr.text,
      );
      addNotes(notes);
      Navigator.pop(context);
    }
  }
}
