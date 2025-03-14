import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<String> todosNomes = ['Guigui', 'Alcivan', 'Victor', 'Enzo Manoel', 'Andreas', 'Heitor'];
  List<String> nomesDisponiveis = [];
  List<String> nomesSorteados = [];
  String nomeSorteado = '';

  @override
  void initState() {
    super.initState();
    _reiniciarSorteio();
  }

  void _sortearNome() {
    if (nomesDisponiveis.isNotEmpty) {
      setState(() {
        int index = Random().nextInt(nomesDisponiveis.length);
        nomeSorteado = nomesDisponiveis.removeAt(index);
        nomesSorteados.add(nomeSorteado);
      });
    }
  }

  void _reiniciarSorteio() {
    setState(() {
      nomesDisponiveis = List.from(todosNomes);
      nomesSorteados.clear();
      nomeSorteado = '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('Nome sorteado:'),
            Text(
              nomeSorteado,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            const Text('Nomes sorteados:'),
            Column(
              children: nomesSorteados.map((nome) => Text(nome)).toList(),
            ),
            const SizedBox(height: 20),
            const Text('Nomes disponíveis:'),
            Column(
              children: nomesDisponiveis.map((nome) => Text(nome)).toList(),
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: _sortearNome,
            tooltip: 'Sortear',
            child: const Icon(Icons.shuffle),
          ),
          const SizedBox(height: 10),
          FloatingActionButton(
            onPressed: _reiniciarSorteio,
            tooltip: 'Reiniciar',
            child: const Icon(Icons.refresh),
          ),
        ],
      ),
    );
  }
}
