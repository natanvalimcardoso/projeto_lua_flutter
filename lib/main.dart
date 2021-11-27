import 'package:flutter/material.dart';
import 'package:projeto_lua_flutter/lua.dart';
import 'lua.dart';

void main() {
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  const Lua(),
      debugShowCheckedModeBanner: false,
    );
  }
}
