import 'package:flutter/material.dart';
import '../utils/validators.dart';

class ClientRegitrationScreen extends StatefulWidget {
  const ClientRegitrationScreen({super.key});

  @override
  State<ClientRegitrationScreen> createState() =>
      _ClientRegistrationScreenState();
}

class _ClientRegistrationScreenState extends State<ClientRegitrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _corporateEmailController =
      TextEditingController();
  final TextEditingController _payController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro del Cliente')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nombre del del Cliente',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorMaxLines: 2,
                ),
                validator: Validators.validateClientName,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _corporateEmailController,
                decoration: InputDecoration(
                  labelText: 'Correo Corporativo',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorMaxLines: 2,
                ),
                validator: Validators.validateCorporateEmail,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _payController,
                decoration: InputDecoration(
                  labelText: 'Tarjeta de credito',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorMaxLines: 2,
                ),
                keyboardType: TextInputType.number,
                validator: Validators.validateCreditCard,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Formulario válido. Procesando...'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text('Guardar Cliente'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
