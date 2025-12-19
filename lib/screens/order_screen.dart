import 'package:flutter/material.dart';
import '../utils/validators.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({super.key});

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  final _formkey = GlobalKey<FormState>();
  DateTime? selectedDate;

  final TextEditingController _discountController = TextEditingController();
  final TextEditingController _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Registro de Pedido')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _discountController,
                decoration: InputDecoration(
                  labelText: 'Descuento',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorMaxLines: 2,
                ),
                validator: Validators.validateCouponCode,
              ),
              const SizedBox(height: 20),
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(
                  labelText: 'Fecha del Pedido',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  errorMaxLines: 2,
                ),
                onTap: () => {
                  showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  ).then((pickedDate) {
                    if (pickedDate != null) {
                      setState(() {
                        selectedDate = pickedDate;
                        _dateController.text =
                            '${pickedDate.day}/${pickedDate.month}/${pickedDate.year}';
                      });
                    }
                  }),
                },
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formkey.currentState!.validate()) {
                    if (selectedDate!.weekday == DateTime.saturday ||
                        selectedDate!.weekday == DateTime.sunday) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          backgroundColor: Colors.red,
                          content: Text('No hay despachos en fines de semana'),
                        ),
                      );
                      return;
                    }
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Formulario válido. Procesando...'),
                        backgroundColor: Colors.green,
                      ),
                    );
                  }
                },
                child: const Text('Guardar Pedido'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
