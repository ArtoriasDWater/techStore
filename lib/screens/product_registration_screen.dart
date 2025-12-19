import 'package:flutter/material.dart';
import '../utils/validators.dart';

class ProductRegistrationScreen extends StatefulWidget {
  const ProductRegistrationScreen({super.key});

  @override
  State<ProductRegistrationScreen> createState() =>
      _ProductRegistrationScreenState();
}

class _ProductRegistrationScreenState extends State<ProductRegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  bool esAltaGama = false;

  // Controllers for form fields
  final TextEditingController _productCodeController = TextEditingController();
  final TextEditingController _productNameController = TextEditingController();
  final TextEditingController _initialStockController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Product Registration'),
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
        body: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _productCodeController,
                  decoration: InputDecoration(
                    labelText: 'Codigo SDK',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorMaxLines: 2,
                  ),
                  validator: Validators.validateSDKcode,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _productNameController,
                  decoration: InputDecoration(
                    labelText: 'Nombre del Producto',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorMaxLines: 2,
                  ),
                  validator: Validators.validateProductName,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _initialStockController,
                  decoration: InputDecoration(
                    labelText: 'Stock Inicial',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorMaxLines: 2,
                  ),
                  keyboardType: TextInputType.number,
                  validator: Validators.validateInitialStock,
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: _priceController,
                  decoration: InputDecoration(
                    labelText: 'Precio',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    errorMaxLines: 2,
                  ),
                  keyboardType: TextInputType.number,
                  validator: Validators.validatePrice,
                  onChanged: (value) {
                    double precio =
                        double.tryParse(value.replaceAll(',', '.')) ?? 0;
                    setState(() {
                      if (precio > 1000000) {
                        esAltaGama = true;
                      } else {
                        esAltaGama = false;
                      }
                    });
                  },
                ),
                if (esAltaGama)
                  Padding(
                    padding: const EdgeInsets.only(top: 6, left: 8),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          size: 14,
                          color: Colors.orange.shade700,
                        ),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            'Este producto será marcado como Alta Gama',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.orange.shade700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      // Process data
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Processing Data')),
                      );
                    }
                  },
                  child: Text('Guardar Producto'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
