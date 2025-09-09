import 'package:flutter/material.dart';
import 'package:lesson02_bytebank/models/Transfers.dart';

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
