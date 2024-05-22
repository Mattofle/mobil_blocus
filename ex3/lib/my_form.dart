import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'notes.dart';

class MyForm extends StatefulWidget {
  //final void Function(Note) addNote;
  const MyForm({
    super.key,
    //required this.addNote,
  });

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  final controller = TextEditingController();
  final contentController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

            TextFormField(
              controller: controller,
              decoration: const InputDecoration(labelText: "Note title"),
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? "Title be empty"
                    : null;
              },
            ),

          const SizedBox(width: 32.0),

            TextFormField(
              controller: contentController,
              decoration: const InputDecoration(labelText: "Note content"),
              validator: (value) {
                return (value == null || value.isEmpty)
                    ? "content can't be empty"
                    : null;
              },
            ),

          const SizedBox(width: 32.0),
          ElevatedButton(
            child: const Text("Send note"),
            onPressed: () {
              if (formKey.currentState!.validate()) {
                // widget.setColor(controller.text);
                controller.text = "";
              }
            },
          )
        ],
      ),
    );
  }
}
