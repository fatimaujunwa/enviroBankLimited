import 'package:envirobank/custom_snackbar.dart';
import 'package:envirobank/loan_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_paystack/flutter_paystack.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'logo_container.dart';

class Payment {
  BuildContext ctx;
  int price;
  String email;
  Payment({required this.ctx, required this.price, required this.email});
  PaystackPlugin paystackPlugin = PaystackPlugin();
  //initisalize plugin
  Future initPlugin() async {
    await paystackPlugin.initialize(
        publicKey: 'pk_test_e7a0ccaadc5f41ea3c5173b4a96df24a0136e02b');
  }

  //reference
  String _getReference() {
    String platform = 'iOS';

    return 'ChargedFrom${platform}_${DateTime.now().millisecondsSinceEpoch}';
  }

  PaymentCard _getCardFromUI() {
    // Using just the must-required parameters.
    return PaymentCard(
      number: '',
      cvc: '',
      expiryMonth: 0,
      expiryYear: 0,
    );
  }

//method of charging card and making payments
  bool cardResponse = false;

  Future chargeCard(LoanController controller, int index) async {
    initPlugin().then((value) async {
      Charge charge = Charge()
        ..amount = price * 100
        ..email = email
        ..reference = _getReference()
        ..card = _getCardFromUI();

      CheckoutResponse response = await paystackPlugin
          .checkout(ctx,
              charge: charge,
              method: CheckoutMethod.card,
              fullscreen: false,
              logo: LogoContainer())
          .then((value) {
        if (value.status == true) {
          controller.addToRemitItems(
              controller.getLoanHistory()[index].reference!,
              controller.getLoanHistory()[index].amount!,
              controller.getLoanHistory()[index].time!,
              index);
          controller.addToRemitHistory();
          controller.setOutstandingLoans();
          controller.getOutstandingLoan();
          controller.getLoanHistory();
          showCustomSnackBar('Congratulations! your transaction was successful', 'transaction message');
        } else if (value.status == null) {
          showCustomSnackBar(
              'Please make sure you are connected to the internet',
              'transaction message');
        } else {
          showCustomSnackBar('Transaction terminated', 'tansaction message');
        }

        return value;
      });
//       print('Response $response');
//       if(response.status==true){
// cardResponse=true;
// // Navigator.pop(ctx);

//       }
//       else if(response==null){
//         cardResponse=false;
//         // Navigator.pop(ctx);
//         showCustomSnackBar('Please make sure you are connected to the internet', 'transaction message');
//       }
//       else{
//         cardResponse=false;
//         showCustomSnackBar('Sorry! transaction failed, please try again', 'transaction message');
//       }
    });

    // print('card from paymet'+cardResponse.toString());
  }
}
