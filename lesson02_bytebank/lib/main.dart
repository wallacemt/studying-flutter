import 'package:flutter/material.dart';

void main() => runApp(BytebankApp());

class BytebankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Scaffold(body: ListaTransferencias()));
  }
}

class ListaTransferencias extends StatefulWidget {
  final List<Transferencias> _transfers = [];
  @override
  State<StatefulWidget> createState() {
    return ListaTransferenciasState();
  }
}

class ListaTransferenciasState extends State<ListaTransferencias> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Transferencias"),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
      body: widget._transfers.isNotEmpty
          ? ListView.builder(
              itemCount: widget._transfers.length,
              itemBuilder: (context, index) {
                return ItemTransferencia(widget._transfers[index]);
              },
            )
          : Center(child: Text("Nenhuma transferência cadastrada")),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          final Future<Transferencias?> future = Navigator.push<Transferencias>(
            context,
            MaterialPageRoute<Transferencias>(
              builder: (context) {
                return FormularioTransferencia();
              },
            ),
          );
          future.then((transferenciaRecebida) {
            if (transferenciaRecebida != null) {
              setState(() {
                widget._transfers.add(transferenciaRecebida);
              });
            }
          });
        },
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
          Editor(
            controller: _controllerFieldAccountNumber,
            label: "Numero da conta",
            alias: "0000",
          ),
          Editor(
            controller: _controllerFieldValue,
            label: "Valor",
            alias: "0.00",
            icon: Icons.monetization_on,
          ),
          ElevatedButton(
            onPressed: () => _createTransfer(context),
            child: Text("Confirmar"),
          ),
        ],
      ),
    );
  }

  void _createTransfer(BuildContext context) {
    final int? numberAccount = int.tryParse(_controllerFieldAccountNumber.text);
    final double? value = double.tryParse(_controllerFieldValue.text);
    if (numberAccount != null && value != null) {
      final createTransfer = Transferencias(value, numberAccount);
      Navigator.pop(context, createTransfer);
    }
  }
}

class Editor extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String alias;
  final IconData? icon;

  const Editor({
    super.key,
    required this.controller,
    required this.label,
    required this.alias,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        style: TextStyle(fontSize: 20.0),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          icon: icon != null ? Icon(icon) : null,
          labelText: label,
          hintText: alias,
        ),
      ),
    );
  }
}

class ItemTransferencia extends StatelessWidget {
  final Transferencias _transferencia;

  const ItemTransferencia(this._transferencia);

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
