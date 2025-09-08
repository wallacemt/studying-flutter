import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: FormularioTransferencia()));
  }
}

class ListaTransferencias extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Transferencias")),
      body: Column(
        children: <Widget>[
          ItemTransferencia(Transferencias(100.0, 1000)),
          ItemTransferencia(Transferencias(560.0, 1400)),
          ItemTransferencia(Transferencias(780.0, 1340)),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => (),
        child: Icon(Icons.add),
      ),
    );
  }
}

class FormularioTransferencia extends StatelessWidget {
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Criando Transferencia"),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
      body: Column(
        children: <Widget>[
          Editor(_controllerFieldAccountNumber, "Numero da conta", "0000", null),
          Editor(_controllerFieldValue, "Valor", "0.00", Icons.monetization_on),
          ElevatedButton(
            onPressed: () {
              final int? numberAccount = int.tryParse(
                _controllerFieldAccountNumber.text,
              );
              final double? value = double.tryParse(_controllerFieldValue.text);
              if (numberAccount != null && value != null) {
                final createTransfer = Transferencias(value, numberAccount);
                debugPrint("${createTransfer}");
              }
            },
            child: Text("Confirmar"),
          ),
        ],
      ),
    );
  }
}

class Editor extends StatelessWidget {
  final TextEditingController _controller;
  final String _label;
  final String _alias;
  final IconData? _icon;
  Editor(this._controller, this._label, this._alias, this._icon);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: _controller,
        style: TextStyle(fontSize: 20.0),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: Icon(_icon),
          labelText: _label,
          hintText: _alias,
        ),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencias _transferencia;

  ItemTransferencia(this._transferencia);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Icon(Icons.monetization_on),
        title: Text(_transferencia.value.toString()),
        subtitle: Text(_transferencia.countNumber.toString()),
      ),
    );
  }
}

class Transferencias {
  final double value;
  final int countNumber;

  @override
  String toString() {
    return "Transferencia{valor:${value}, conta:${countNumber}";
  }

  Transferencias(this.value, this.countNumber);
}
