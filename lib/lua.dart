// ignore_for_file: prefer_const_constructors
import './logica.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Lua extends StatefulWidget {
  const Lua({Key? key}) : super(key: key);

  @override
  _LuaState createState() => _LuaState();
}

class _LuaState extends State<Lua> {
  // ignore: non_constant_identifier_names
  final peso = TextEditingController();
  final planetas = TextEditingController();

  String valorSelecionado = "";
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
                              controller: peso,
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
                                child: DropdownButton(
                                    borderRadius: BorderRadius.circular(10),
                                    onChanged: (value) {
                                      meuItemInicial = value.toString();
                                      setState(() {});
                                    },
                                    value: meuItemInicial,
                                    isExpanded: true,
                                    items: listaPlanetas.map((items) {
                                      return DropdownMenuItem(
                                          value: items,
                                          child: Text(
                                            items,
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400),
                                          ));
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
                                  onPressed: () {},
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
