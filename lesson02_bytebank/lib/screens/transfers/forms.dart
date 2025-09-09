import 'package:flutter/material.dart';
import 'package:lesson02_bytebank/components/Editor.dart';
import 'package:lesson02_bytebank/models/Transfers.dart';

const _titleAppBar = "Criando Transferencia";

const _labelValueNumberAccount = "Numero da conta";
const _aliasValueNumberAccount = "0000";

const _labelValue = "Valor";
const _aliasValue = "0.00";

class FormularioTransferencia extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return FormularioTransferenciaState();
  }
}

class FormularioTransferenciaState extends State<FormularioTransferencia> {
  final TextEditingController _controllerFieldAccountNumber =
      TextEditingController();
  final TextEditingController _controllerFieldValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titleAppBar),
        backgroundColor: Colors.blue,
        titleTextStyle: TextStyle(color: Colors.white, fontSize: 20.0),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Editor(
              controller: _controllerFieldAccountNumber,
              label: _labelValueNumberAccount,
              alias: _aliasValueNumberAccount,
            ),
            Editor(
              controller: _controllerFieldValue,
              label: _labelValue,
              alias: _aliasValue,
              icon: Icons.monetization_on,
            ),
            ElevatedButton(
              onPressed: () => _createTransfer(context),
              child: Text("Confirmar"),
            ),
          ],
        ),
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
