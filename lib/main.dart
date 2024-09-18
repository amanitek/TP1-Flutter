import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: _Convertisseur(),
    );
  }
}

class _Convertisseur extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MyHome();
}

class _MyHome extends State<_Convertisseur> {
  String groupValue = "EuroToDinar";
  double rest = 0.0;

  TextEditingController controller = TextEditingController();

  _Convert() {
    setState(() {
      double val = double.tryParse(controller.text) ?? 0;
      if (groupValue == "DinarToEuro") {
        rest = val * 3.3;
      } else {
        rest = val / 3.3;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tp 1 App"),
        backgroundColor: Colors.purple,
      ),
      body: Center(
        child: Column(children: [
          TextField(
            controller: controller,
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: "Montant"),
          ),
          SizedBox(height: 15),
          RadioListTile(
              title: Text("Dinar=> Euro"),
              value: "DinarToEuro",
              groupValue: groupValue,
              onChanged: (value) => {
                    setState(() {
                      groupValue = value.toString();
                    })
                  }),
          RadioListTile(
              title: Text("Euro=> Dinar"),
              value: "EuroToDinar",
              groupValue: groupValue,
              onChanged: (value) => {
                    setState(() {
                      groupValue = value.toString();
                    })
                  }),
          Text(
            'Resultat: $rest',
            style: TextStyle(color: Colors.red),
          ),
          TextButton(onPressed: _Convert, child: Text("Convertir"))
        ]),
      ),
    );
  }
}
