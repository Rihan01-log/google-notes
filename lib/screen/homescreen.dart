import 'package:badge_task/function/function.dart';
import 'package:badge_task/model/model.dart';
import 'package:badge_task/screen/addscreen.dart';
import 'package:badge_task/screen/editscreen.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController searchCrls = TextEditingController();
  String search = '';

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold(
      drawer: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(60),
            const Padding(
              padding: EdgeInsets.only(left: 20),
              child: Text('Google Keep'),
            ),
            const Gap(10),
            listMethod(name: 'Notes', iconsname: Icons.lightbulb),
            listMethod(name: 'Create new label', iconsname: Icons.add),
            listMethod(name: 'Archive', iconsname: Icons.archive),
            listMethod(name: 'Trash', iconsname: Icons.delete),
            listMethod(name: 'Settings', iconsname: Icons.settings),
            listMethod(name: 'Help', iconsname: Icons.help),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffeaeef7),
        elevation: 10,
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => const Addscreen()));
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(15),
                    child: TextField(
                      controller: searchCrls,
                      onChanged: (value) {
                        setState(() {
                          search = value.toLowerCase();
                        });
                      },
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: const Color(0xffeaeef7),
                        hintText: 'Search your notes',
                        contentPadding: const EdgeInsets.all(7),
                        prefixIcon: const Icon(Icons.menu),
                        suffixIcon: const Icon(Icons.account_circle),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                    ),
                  ),
                  ValueListenableBuilder(
                    valueListenable: googlenotes,
                    builder: (context, List<GoogleNotes> google, child) {
                      var filteredNotes = google.where((note) {
                        return note.title
                                .toString()
                                .toLowerCase()
                                .contains(search) ||
                            note.subTitle
                                .toString()
                                .toLowerCase()
                                .contains(search);
                      }).toList();

                      return SizedBox(
                        height: 500,
                        child: GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5,
                                  mainAxisSpacing: 4,
                                  childAspectRatio: 1.1),
                          itemBuilder: (context, index) {
                            var a = filteredNotes[index];
                            return GestureDetector(
                              onLongPress: () {
                                delete(index);
                              },
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (ctx) => Editscreen(
                                              index: index,
                                              title: a.title!,
                                              notes: a.subTitle!,
                                            )));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                padding: const EdgeInsets.all(8),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      a.title!,
                                      style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      a.subTitle!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 5,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          itemCount: filteredNotes.length,
                        ),
                      );
                    },
                  ),
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
                    Gap(13),
                    Icon(Icons.check_box),
                    Gap(13),
                    Icon(Icons.brush),
                    Gap(13),
                    Icon(Icons.mic),
                    Gap(13),
                    Icon(Icons.photo),
                    Gap(13),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  ListTile listMethod({required String name, required IconData iconsname}) {
    return ListTile(
      horizontalTitleGap: 10,
      onTap: () {},
      title: Text(name),
      leading: Icon(iconsname),
    );
  }
}
