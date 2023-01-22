import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_buy/model/wished_item.dart';
import 'package:to_buy/providers/wished_list.dart';

class WishedItemForm extends StatefulWidget {
  const WishedItemForm({super.key});

  @override
  State<WishedItemForm> createState() => _WishedItemFormState();
}

class _WishedItemFormState extends State<WishedItemForm> {

  final _formKey = GlobalKey<FormState>();
  final _formData = {};

  double initalContainerHeight = 280;
  Map<String, double> containerAditionalHeight = {
    "name" : 0,
    "price" : 0
  };

  void _submitForm() {
    print(_formKey.toString());
    bool isValidForm = _formKey.currentState!.validate();

    if(!isValidForm) return;

    _formKey.currentState!.save();

    Provider.of<WishedList>(context, listen: false).addItem(
      WishedItem(
        id: Random().nextDouble().toString(), 
        name: _formData["name"], 
        avgValue: double.parse(_formData["price"]), 
        url: _formData["link"] ?? "", 
        isBought: false
      )
    );
    
    Navigator.of(context).pop();
  }
  @override
  Widget build(BuildContext context) {
    return Dialog(
      insetPadding: const EdgeInsets.all(10),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutCirc,
        padding: const EdgeInsets.only(
          left: 8,
          right: 8
        ),
        width: double.infinity,
        height: initalContainerHeight 
            + containerAditionalHeight["name"]!
             + containerAditionalHeight["price"]!
        ,
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Adicionar item desejado",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 18,
                  fontWeight: FontWeight.bold
                ),
              ),
              TextFormField(
                validator: (name) {
                  if(name == "") {
                    setState(() {
                      containerAditionalHeight["name"] = 15;
                    });
                    return "Insira um nome.";
                  }
                  setState(() {
                    containerAditionalHeight["name"] = 0;
                  });
                  return null;
                },
                onSaved: (name) => _formData["name"] = name,
                decoration: const InputDecoration(
                  labelText: "Nome do item desejado"
                ),
              ),
              TextFormField(
                validator: (price) {
                  if(price == "") {
                    setState(() {
                      containerAditionalHeight["price"] = 15;
                    });
                    return "Insira um valor.";
                  }
                  setState(() {
                    containerAditionalHeight["price"] = 0;
                  });
                  return null;
                },
                onSaved: (price) => _formData["price"] = price,
                decoration: const InputDecoration(
                  labelText: "Preço"
                ),
              ),
              TextFormField(
                initialValue: "",
                onSaved: (link) => _formData["link"] = link,
                decoration: const InputDecoration(
                  labelText: "Link do item(opcional)"
                ),
              ),
              SizedBox(
                width: double.infinity,
                height: 45,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  child: const Text("CONFIRMAR")
                ),
              )
            ],
          )
        ),
      ),
    );
  }
}