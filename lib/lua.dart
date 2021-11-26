// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Lua extends StatefulWidget {
  const Lua({Key? key}) : super(key: key);

  @override
  _LuaState createState() => _LuaState();
}

class _LuaState extends State<Lua> {
  final _valorController = TextEditingController();

  String dropdownValue = 'jupiter';

  List<String> listaPlanetas = [
    "jupiter",
    "lua",
    "marte",
    "mercurio",
    "plutao",
    "saturno",
    "urano",
    "venus"
  ];

  @override
  Widget build(BuildContext context) {
    return Material(
      //importante
      color: Colors.white,
      child: Container(
        margin: EdgeInsets.only(top: 50),
        width: MediaQuery.of(context).size.width * .2,
        height: MediaQuery.of(context).size.height * .2,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Seu peso',
                  style: TextStyle(
                    color: Color.fromRGBO(7, 78, 232, 1),
                    fontWeight: FontWeight.w800,
                    decoration: TextDecoration.none,
                    fontSize: 36,
                  ),
                )
              ],
            ),
            Container(
              height: MediaQuery.of(context).size.height * .35,
              child: LayoutBuilder(
                builder: (context, constraints) {
                  return Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          // ignore: prefer_const_literals_to_create_immutables
                          children: [
                            TextField(
                                keyboardType: TextInputType.number,
                                controller: _valorController,
                                decoration: InputDecoration(
                                  labelText: 'Peso',
                                  hintText: "Digite o seu peso",
                                  border: OutlineInputBorder(),
                                )),
                            Divider(
                              height: 20,
                              thickness: 0,
                              indent: 20,
                              endIndent: 20,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 12, vertical: 4),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(3),
                                  border: Border.all(
                                      color: Color.fromRGBO(104, 120, 141, 1),
                                      width: 1)),
                              child: DropdownButtonHideUnderline(
                                //esconde linha do drop
                                child: DropdownButton<String>(
                                    //drop
                                    borderRadius: BorderRadius.circular(10),
                                    onChanged: (String? newValue) {
                                      setState(() {
                                        dropdownValue = newValue!;
                                      });
                                    },
                                    value: dropdownValue,
                                    isExpanded: true,
                                    items: listaPlanetas.map<DropdownMenuItem<String>>((String value) {
                                      return DropdownMenuItem(
                                          value: value,
                                          child: Text(value,style: TextStyle(fontWeight: FontWeight.w400),
                                          )
                                        );
                                    }).toList()),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: SizedBox(
                                height: 50,
                                width: MediaQuery.of(context).size.width * .25,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(35.0),
                                        side: BorderSide(color: Colors.white)),
                                    primary: Color.fromRGBO(7, 78, 232, 1),
                                    elevation: 0,
                                    onPrimary: Colors.white, // foreground
                                  ),
                                  onPressed: () {
                                    if (_valorController.text.isNotEmpty) {
                                      // ignore: unused_local_variable
                                      final double valor =
                                          double.parse(_valorController.text);
                                      print(valor);
                                      print(dropdownValue);
                                    }
                                  },
                                  child: Text(
                                    "Calcular",
                                    style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class Total {
  late final double peso;
  late final String planeta;
  late final double pesoTotal;

  Calculo(double peso, String planeta) {
    switch (planeta) {
      case 'lua':
        double pesoTotal = 0.17 * peso;

        break;
      case 'marte':
        double pesoTotal = 0.38 * peso;
        break;
      case 'saturno':
        double pesoTotal = 1.15 * peso;
        break;
      case 'jupiter':
        double pesoTotal = 2.64 * peso;
        break;
      case 'urano':
        double pesoTotal = 1.17 * peso;
        break;
      case 'plutao':
        double pesoTotal = 0.11 * peso;
        break;
      case 'venus':
        double pesoTotal = 0.88 * peso;
        break;
      case 'mercurio':
        double pesoTotal = 0.37 * peso;
        break;
    }
    return pesoTotal;
  }
}
