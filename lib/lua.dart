// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Lua extends StatefulWidget {
  const Lua({Key? key}) : super(key: key);

  @override
  _LuaState createState() => _LuaState();
}

class _LuaState extends State<Lua> {
  // ignore: non_constant_identifier_names
  var meuItemInicial = "item 1";
  List<String> listaPlanetas = [
    "item 1",
    "item 2",
    "item 3",
    "item 4",
    "item 5",
    "item 6",
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
              height: MediaQuery.of(context).size.height * .2,
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
                                decoration: InputDecoration(
                              labelText: 'Peso',
                              hintText: "Digite o seu peso",
                              border: OutlineInputBorder(),
                            )),
                            DropdownButton(
                                onChanged: (value) {
                                  meuItemInicial = value.toString();
                                  setState(() {});
                                },
                                value: meuItemInicial,
                                items: listaPlanetas.map((items) {
                                  return DropdownMenuItem(
                                      value: items, child: Text(items));
                                }).toList())
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
