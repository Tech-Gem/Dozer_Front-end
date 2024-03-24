import 'dart:io';

class Validator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Name is required';
    }

    const namePattern = r"^[a-zA-Z]+(([',. -][a-zA-Z ])?[a-zA-Z]*)*$";
    final regExp = RegExp(namePattern);

    if (!regExp.hasMatch(value)) {
      return 'Invalid name format';
    }

    if (value.length < 2 || value.length > 50) {
      return 'Name should be between 2 and 50 characters';
    }

    return null;
  }

  static String? validateQuantity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Quantity is required';
    }

    final quantity = int.tryParse(value);

    if (quantity == null || quantity <= 0) {
      return 'Invalid quantity';
    }

    return null;
  }

  static String? validateCapacity(String? value) {
    if (value == null || value.isEmpty) {
      return 'Capacity is required';
    }

    return null;
  }

  static String? validateSpecifications(String? value) {
    if (value == null || value.isEmpty) {
      return 'Specification is required';
    }

    return null;
  }

  static String? validateTransportation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Transportation option is required';
    }

    return null;
  }

  static String? validateModel(String? value) {
    if (value == null || value.isEmpty) {
      return 'Model is required';
    }

    return null;
  }

  static String? validatePrice(String? value) {
    if (value == null || value.isEmpty) {
      return 'Price per hour is required';
    }

    final price = double.tryParse(value);

    if (price == null || price <= 0) {
      return 'Invalid price';
    }

    return null;
  }

  static String? validateLocation(String? value) {
    if (value == null || value.isEmpty) {
      return 'Location is required';
    }

    return null;
  }

  static String? validateDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Description is required';
    }

    if (value.length < 10 || value.length > 100) {
      return 'Description should be between 10 and 100 characters';
    }

    return null;
  }

  static String? validateCategory(String? value) {
    if (value == null || value.isEmpty) {
      return 'Category is required';
    }

    return null;
  }

  static String? validateCategoryImage(File? value) {
    if (value == null) {
      return 'Category image is required';
    }

    return null;
  }

  static String? validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Phone number is required';
    }

    // Define the regular expression pattern
    const phonePattern = r'^\d{10}$';

    // Create a regular expression object
    final regExp = RegExp(phonePattern);

    // Check if the value matches the pattern
    if (!regExp.hasMatch(value)) {
      return 'Invalid phone number format';
    }

    // Return null if the value is valid
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email is required';
    }

    // Define the regular expression pattern
    const emailPattern = r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,}$';

    // Create a regular expression object
    final regExp = RegExp(emailPattern);

    // Check if the value matches the pattern
    if (!regExp.hasMatch(value)) {
      return 'Invalid email format';
    }

    // Return null if the value is valid
    return null;
  }
}