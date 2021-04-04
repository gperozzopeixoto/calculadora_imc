import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController pesoController = new TextEditingController();
  TextEditingController alturaController = new TextEditingController();
  String _resultado = "Informe seus dados!";

  void _resetarCampos() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _resultado = "Informe seus dados!";
      _formKey = new GlobalKey<FormState>();
    });
  }

  void calcularIMC() {
    setState(() {
      double peso = double.parse((pesoController.text));
      double altura = double.parse((alturaController.text)) / 100;
      double imc = peso / (altura * altura);

      if (imc < 18.6) {
        _resultado = "Abaixo do Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _resultado = "Peso Ideal (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _resultado = "Levemente Acima Peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 29.6 && imc < 34.9) {
        _resultado = "Obesidade Grau I (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 24.9 && imc < 39.9) {
        _resultado = "Obesidade Grau II (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 40) {
        _resultado = "Obesidade Grau III (${imc.toStringAsPrecision(3)})";
      }
    });
  }

  String _valiarCampo(String value) {
    if (value.isEmpty) {
      return "Este campo deve ser preenchido!";
    }
  }

  void _onPress_Concluir() {
    if (_formKey.currentState.validate()) {
      calcularIMC();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.grey,
          title: Text("Caladora IMC"),
          actions: [
            IconButton(icon: Icon(Icons.refresh), onPressed: _resetarCampos)
          ],
        ),
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Icon(
                  Icons.person_outline,
                  color: Colors.grey,
                  size: 120.0,
                ),
                TextFormField(
                  controller: pesoController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 20.0),
                  validator: (value) {
                   return _valiarCampo(value);
                  },
                  decoration: InputDecoration(
                      labelText: "Peso (kg)",
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
                TextFormField(
                  controller: alturaController,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 20.0),
                  validator: (value) {
                    return _valiarCampo(value);
                  },
                  decoration: InputDecoration(
                      labelText: "Altura (cm)",
                      labelStyle: TextStyle(color: Colors.grey)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                  child: Container(
                    height: 50.0,
                    child: RaisedButton(
                      onPressed: _onPress_Concluir,
                      color: Colors.grey,
                      child: Text(
                        "Calcular",
                        style: TextStyle(fontSize: 25, color: Colors.white),
                      ),
                    ),
                  ),
                ),
                Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.grey, fontSize: 25.0),
                )
              ],
            ),
          ),
        ));
  }
}
