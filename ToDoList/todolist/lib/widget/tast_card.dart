import 'package:confirm_dialog/confirm_dialog.dart';
import 'package:flutter/material.dart';

class TaskCard extends StatelessWidget {
  TaskCard(
      {super.key, required this.index, required this.item, required this.func});

  var item;
  int index;
  final Function func;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      margin: EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
          color: (index % 2 == 0)
              ? const Color.fromARGB(255, 124, 126, 148)
              : const Color.fromARGB(255, 60, 61, 70),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.Name,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  func(item.ID);
                }
                return;
              },
              child: Icon(
                Icons.delete_forever,
                size: 30,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
