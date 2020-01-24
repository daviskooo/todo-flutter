import 'package:flutter/material.dart';

import 'models/item.dart';

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

class HomePage extends StatefulWidget {
  var items = new List<Item>();

  HomePage() {
    items = [];
    items.add(Item(title: "Item 1", done: true));
    items.add(Item(title: "Item 2", done: false));
    items.add(Item(title: "Item 3", done: true));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var newTaskCtrl =
      TextEditingController(); // Declarando uma variável para ser uma controladora de edição de texto (no caso de um campo).

  // Essa função, irá adicionar um novo item, setando o seu estado como o valor obtido no campo de texto, e por padrão deixá-lo não checado (falso).
  // O valor do título é pego pela variável declarada como controladora no campo de texto, obtendo pela manipulação, o valor de texto do campo.
  void add() {
    setState(() {
      widget.items.add(Item(
        title: newTaskCtrl.text,
        done: false,
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          controller:
              newTaskCtrl, // Adicionando um controlador para o campo de texto poder ser manipulado.
          keyboardType: TextInputType.text, // Tipo de teclado de digitação.
          style: TextStyle(
            color:
                Colors.white, // Adicionando a cor branca para o texto do campo.
            fontSize: 20,
          ),
          decoration: InputDecoration(
            // Adicionando estilização no campo de texto.
            labelText: "Digite uma nova tarefa",
            labelStyle: TextStyle(
              color: Colors.white,
            ),
          ),
        ),
      ), // Utilizando uma barra de navegação no app (visual).
      body: ListView.builder(
        itemCount: widget.items.length,
        itemBuilder: (BuildContext context, int index) {
          final item = widget.items[index];
          return CheckboxListTile(
            title: Text(item.title),
            activeColor: Colors.black54, // Cor do CheckBox quando está ativo.
            key: Key(item.title),
            value: item.done,
            onChanged: (value) {
              setState(() {
                item.done = value;
              });
              print(value);
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: add,
        child: Icon(Icons.add),
        backgroundColor: Colors.grey,
      ),
    );
  }
}
