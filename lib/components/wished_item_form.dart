import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class WishedItemForm extends StatefulWidget {
  const WishedItemForm({super.key});

  @override
  State<WishedItemForm> createState() => _WishedItemFormState();
}

class _WishedItemFormState extends State<WishedItemForm> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: Container(
        width: double.infinity,
        height: 200,
        child: Form(
          child: Column(
            children: [
              TextFormField(),
              TextFormField(),
              TextFormField(),
              ElevatedButton(
                onPressed: () {
                }, 
                child: const Text("CONFIRMAR")
              )
            ],
          )
        ),
      ),
    );
  }
}