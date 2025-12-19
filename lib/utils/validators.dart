class Validators {
  //Registros de inventarios
  static String? validateSDKcode(String? value) {
    if (value == null || value.isEmpty) {
      return 'El código SDK es obligatorio';
    }

    final sdkCodeRegex = RegExp(r'^[A-Z]{3}-\d{3}$');
    if (!sdkCodeRegex.hasMatch(value)) {
      return 'El código SDK no tiene el formato correcto (debe tener el siguiente formato: ABC-123)';
    }

    return null;
  }

  static String? validateProductName(String? value) {
    if (value == null || value.isEmpty) {
      return 'El nombre del producto es un campo obligatorio';
    }

    if (value.length < 5) {
      return 'El nombre del producto debe tener al menos 5 caracteres';
    }

    final nameRegex = RegExp(r'^(?=.*[A-Za-z])[A-Za-z0-9\s]+$');
    if (!nameRegex.hasMatch(value)) {
      return 'El nombre del producto no puede contener solo numeros';
    }

    return null;
  }

  static String? validateInitialStock(String? value) {
    if (value == null || value.isEmpty) {
      return 'El stock inicial es un campo obligatorio';
    }

    final onlyNumbersRegex = RegExp(r'[^0-9]');
    if (onlyNumbersRegex.hasMatch(value)) {
      return 'El stock inicial solo puede contener números';
    }

    if (int.parse(value) <= 0) {
      return 'El stock inicial no puede ser negativo o cero';
    }

    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'El precio es un campo obligatorio';
    }

    final priceRegex = RegExp(r'^\d+(\.\d+)?$');
    if (!priceRegex.hasMatch(value)) {
      return 'El precio debe ser un número entero o un numero con decimales';
    }

    return null;
  }

  //Clientes VIP y pagos
  static String? validateClientName(String? value) {
    if (value == null || value.isEmpty) {
      return 'El nombre del cliente es un campo obligatorio';
    }

    return null;
  }

  static String? validateCorporateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'El correo corporativo es un campo obligatorio';
    }

    final emailRegex = RegExp(r'^[\w\.-]+@(techstore\.com|partner\.com)$');
    if (!emailRegex.hasMatch(value)) {
      return 'El correo corporativo no tiene un formato válido';
    }

    return null;
  }

  static String? validateCreditCard(String? value) {
    if (value == null || value.isEmpty) {
      return 'El número de tarjeta de crédito es un campo obligatorio';
    }

    final creditCardRegex = RegExp(r'^\d{16}$');
    if (!creditCardRegex.hasMatch(value)) {
      return 'El número de tarjeta de crédito debe contener exactamente 16 dígitos';
    }

    final creditCardTypeRegex = RegExp(r'^(4\d*|5[1-5]\d*)$');
    if (!creditCardTypeRegex.hasMatch(value)) {
      return 'Solo aceptamos Visa o MasterCard';
    }

    return null;
  }

  //Gestion de pedidos
  static String? validateCouponCode(String? value) {
    if (value == null || value.isEmpty) {
      return 'El código de cupón es un campo obligatorio';
    }

    final cuponesValidos = ['DESCUENTO10', 'PROMO2025', 'VIPUSER'];

    if (!cuponesValidos.contains(value.trim().toUpperCase())) {
      return 'Cupón expirado o inexistente';
    }

    return null;
  }
}
