import 'package:flutter/material.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Todo App',
      debugShowCheckedModeBanner: false, // Retirando selo de debug na build.
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Text("#"),
        title: Text("Lista de Tarefas"),
        actions: <Widget>[
          Icon(Icons.add),
        ],
      ), // Utilizando uma barra de navegação no app (visual).
      body: Container(
        child: Center(
          child: Text("Olá mundo"),
        ),
      ),
    );
  }
}
