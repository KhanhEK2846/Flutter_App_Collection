import 'package:flutter/material.dart';
import 'package:todolist/modal/items.dart';
import 'widget/modal_button.dart';
import 'widget/tast_card.dart';

void main(List<String> args) {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //Mock Data
  final List<DataItem> items = [];

  void _handleAddTask(String Name) {
    final newItem = DataItem(ID: DateTime.now().toString(), Name: Name);
    setState(() {
      items.add(newItem);
    });
  }

  void _handleDeleteCard(String id) {
    setState(() {
      items.removeWhere((e) => e.ID == id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //Header App
        appBar: AppBar(
          title: const Text(
            "To Do List",
            style: TextStyle(
                fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          backgroundColor: Colors.blueAccent,
          centerTitle: true,
          toolbarHeight: 35,
        ),

        // Body App
        body: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: items
                .map((e) => TaskCard(
                    index: items.indexOf(e), item: e, func: _handleDeleteCard))
                .toList(),
          ),
        ),

        // Footer App
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(20))),
                isScrollControlled: true,
                context: context,
                builder: (BuildContext content) {
                  return ModalButton(func: _handleAddTask);
                });
          },
          child: Icon(
            Icons.add,
            size: 40,
          ),
        ));
  }
}
