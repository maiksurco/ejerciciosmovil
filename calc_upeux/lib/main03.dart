import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ejemplo de Widgets')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFieldExample(),
            SizedBox(height: 20),
            FormExample(),
            SizedBox(height: 20),
            CheckboxExample(),
            SizedBox(height: 20),
            SwitchExample(),
            SizedBox(height: 20),
            RadioButtonExample(),
            SizedBox(height: 20),
            SliderExample(),
            SizedBox(height: 20),
            DropdownButtonExample(),
          ],
        ),
      ),
    );
  }
}

class TextFieldExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: 'Nombre',
        hintText: 'Escribe tu nombre',
      ),
      onChanged: (text) {
        print('Texto ingresado: $text');
      },
    );
  }
}

class FormExample extends StatefulWidget {
  @override
  _FormExampleState createState() => _FormExampleState();
}

class _FormExampleState extends State<FormExample> {
  final _formKey = GlobalKey<FormState>();
  String _email = '';
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          TextFormField(
            decoration: InputDecoration(
              labelText: 'Correo Electrónico',
              border: OutlineInputBorder(),
            ),
            onChanged: (value) {
              _email = value;
            },
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Por favor, ingrese un correo';
              }
              if (!emailRegex.hasMatch(value)) {
                return 'Ingrese un correo válido';
              }
              return null;
            },
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                print('Correo ingresado: $_email');
              }
            },
            child: Text('Enviar'),
          ),
        ],
      ),
    );
  }
}

class CheckboxExample extends StatefulWidget {
  @override
  _CheckboxExampleState createState() => _CheckboxExampleState();
}

class _CheckboxExampleState extends State<CheckboxExample> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Checkbox(
          value: _isChecked,
          onChanged: (bool? value) {
            setState(() {
              _isChecked = value ?? false;
            });
          },
        ),
        Text('Acepto los términos y condiciones'),
      ],
    );
  }
}

class SwitchExample extends StatefulWidget {
  @override
  _SwitchExampleState createState() => _SwitchExampleState();
}

class _SwitchExampleState extends State<SwitchExample> {
  bool _switchValue = false;

  @override
  Widget build(BuildContext context) {
    return Switch(
      value: _switchValue,
      onChanged: (bool value) {
        setState(() {
          _switchValue = value;
        });
        print('Switch: $_switchValue');
      },
    );
  }
}

class RadioButtonExample extends StatefulWidget {
  @override
  _RadioButtonExampleState createState() => _RadioButtonExampleState();
}

class _RadioButtonExampleState extends State<RadioButtonExample> {
  int _selectedValue = 1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ListTile(
          title: Text('Opción 1'),
          leading: Radio<int>(
            value: 1,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;
              });
              print("Seleccionado: $_selectedValue");
            },
          ),
        ),
        ListTile(
          title: Text('Opción 2'),
          leading: Radio<int>(
            value: 2,
            groupValue: _selectedValue,
            onChanged: (int? value) {
              setState(() {
                _selectedValue = value!;
              });
              print("Seleccionado: $_selectedValue");
            },
          ),
        ),
      ],
    );
  }
}

class SliderExample extends StatefulWidget {
  @override
  _SliderExampleState createState() => _SliderExampleState();
}

class _SliderExampleState extends State<SliderExample> {
  double _sliderValue = 20.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Slider(
          value: _sliderValue,
          min: 0,
          max: 100,
          divisions: 10,
          label: _sliderValue.round().toString(),
          onChanged: (double value) {
            setState(() {
              _sliderValue = value;
            });
            print("Valor: $_sliderValue");
          },
        ),
        Text('Valor seleccionado: ${_sliderValue.round()}'),
      ],
    );
  }
}

class DropdownButtonExample extends StatefulWidget {
  @override
  _DropdownButtonExampleState createState() => _DropdownButtonExampleState();
}

class _DropdownButtonExampleState extends State<DropdownButtonExample> {
  final List<Map<String, String>> _dropdownItems = [
    {'label': 'Opción A', 'value': '1'},
    {'label': 'Opción B', 'value': '2'},
    {'label': 'Opción C', 'value': '3'},
  ];
  String? _selectedValue;

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: _selectedValue,
      hint: Text('Seleccione una opción'),
      items: _dropdownItems.map((item) {
        return DropdownMenuItem<String>(
          value: item['value'],
          child: Text(item['label']!),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          _selectedValue = newValue;
        });
        print('Valor seleccionado: $_selectedValue');
      },
    );
  }
}
