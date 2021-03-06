// ignore_for_file: prefer_const_constructors, void_checks
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
  int contator = 0;
  String dropdownValue = 'jupiter';
  var classeTotal = Total(0.0, '');
  var valorPorCima = 0.0;

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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(),
          ),
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
          LayoutBuilder(
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
                          padding:
                              EdgeInsets.symmetric(horizontal: 12, vertical: 4),
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
                                items: listaPlanetas
                                    .map<DropdownMenuItem<String>>(
                                        (String value) {
                                  return DropdownMenuItem(
                                      value: value,
                                      child: Text(
                                        value,
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
                                    borderRadius: BorderRadius.circular(35.0),
                                    side: BorderSide(color: Colors.white)),
                                primary: Color.fromRGBO(7, 78, 232, 1),
                                elevation: 0,
                                onPrimary: Colors.white, // foreground
                              ),
                              onPressed: () {
                                setState(() {
                                  //mudar o valor do contator instantaneamente
                                  contator++;
                                });
                                if (_valorController.text.isNotEmpty) {
                                  // ignore: unused_local_variable
                                  final double valor =
                                      double.parse(_valorController.text);
                                  Total(valor, dropdownValue);
                                  valorPorCima = valor;
                                  
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
                        ImagemPlanetas(dropdownValue),
                        TextoPlaneta()
                      ],
                    ),
                  ),
                ],
              );
            },
          )
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  SizedBox TextoPlaneta() {
    //aquie
    //final double valor = double.parse(_valorController.text);

    if (_valorController.text.isNotEmpty && contator > 0) {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .10,
        child: Text(
          'O seu peso em $dropdownValue ?? de: ${classeTotal.calculo(valorPorCima, dropdownValue)} kg',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            decoration: TextDecoration.none,
            fontSize: 20,
          ),
        ),
      );
    } else {
      return SizedBox(
        height: MediaQuery.of(context).size.height * .10,
      );
    }
  }

  Padding ImagemPlanetas(String dropdownValue) {
    return Padding(
      padding: const EdgeInsets.only(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            'assets/images/' + dropdownValue + '.png',
            width: MediaQuery.of(context).size.width * .70,
          ),
        ],
      ),
    );
  }
}

class Total {
  late double pesoFinal = 0.0;

  Total(double valor, String dropdownValue);

  calculo(double peso, String planeta) {
    switch (planeta) {
      case 'lua':
        pesoFinal = 0.17 * peso;
        return pesoFinal.round();
      case 'marte':
        pesoFinal = 0.38 * peso;
        return pesoFinal.round();
      case 'saturno':
        pesoFinal = 1.15 * peso;
        return pesoFinal.round();
      case 'jupiter':
        pesoFinal = 2.64 * peso;
        return pesoFinal.round();
      case 'urano':
        pesoFinal = 1.17 * peso;
        return pesoFinal.round();
      case 'plutao':
        pesoFinal = 0.11 * peso;
        return pesoFinal.round();
      case 'venus':
        pesoFinal = 0.88 * peso;
        return pesoFinal.round();
      case 'mercurio':
        pesoFinal = 0.37 * peso;
        return pesoFinal.round();
    }
  }
}
