import 'package:flutter/material.dart';

class ModalButton extends StatelessWidget {
  ModalButton({super.key, required this.func});

  final Function func;

  //String _textValue = '';
  TextEditingController _controller = TextEditingController();

  void _handleOnClick(BuildContext context) {
    //print((_textValue == '') ? 'null' : _textValue);
    //print(_controller.text);
    final String text = _controller.text.trim();
    if (text.isEmpty) return;
    func(text);

    Navigator.pop(context);
    _controller.text = '';
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: MediaQuery.of(context).viewInsets,
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              //onChanged: (value) => {_textValue = value},
              controller: _controller,
              decoration: InputDecoration(
                  border: OutlineInputBorder(), labelText: "Your task"),
            ),
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                  onPressed: (() => _handleOnClick(context)),
                  child: Text("Add Task")),
            )
          ],
        ),
      ),
    );
  }
}
