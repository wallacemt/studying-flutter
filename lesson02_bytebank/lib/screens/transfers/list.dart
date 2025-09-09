import 'package:flutter/material.dart';
import 'package:lesson02_bytebank/components/TransferItem.dart';
import 'package:lesson02_bytebank/models/Transfers.dart';
import 'package:lesson02_bytebank/screens/transfers/forms.dart';

const _titleAppBar = "Transferencias";

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
        title: Text(_titleAppBar),
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
