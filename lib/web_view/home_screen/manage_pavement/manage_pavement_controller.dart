import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ManagePavementController extends GetxController {
  static ManagePavementController get my => Get.find();
  TextEditingController amountController = TextEditingController();
  final List<Payment> payments = [
    Payment("Payment #1", 100),
    Payment("Payment #2", 200),
    Payment("Payment #3", 150),
  ];

  void submitPaymentAmount() {
    final double amount = double.tryParse(amountController.text) ?? 0.0;
    amountController.clear();

    // Send the payment amount to the server for processing
    _sendPaymentAmountToServer(amount);
  }

  void _sendPaymentAmountToServer(double amount) async {
    // Replace the URL with your server endpoint to store the payment amount
    const url = 'https://your-server.com/store-payment-amount';

    try {
      // Make an API call to the server
      final response =
          await http.post(Uri.parse(url), body: {'amount': amount.toString()});

      if (response.statusCode == 200) {
        // Payment amount successfully stored on the server
        // You can process the payment with the Stripe API here
      } else {
        // Handle error cases
      }
    } catch (e) {
      // Handle network or other errors
    }
  }
}

class Payment {
  final String description;
  final double amount;

  Payment(this.description, this.amount);
}
