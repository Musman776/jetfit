import 'package:flutter/material.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/view/widgets/textformfield.dart';
import 'package:jetfit/view/widgets/web_button.dart';
import 'package:jetfit/web_view/home_screen/manage_pavement/manage_pavement_controller.dart';
import 'package:get/get.dart';

class ManagePavementScreen extends StatefulWidget {
  const ManagePavementScreen({super.key});

  @override
  State<ManagePavementScreen> createState() => _ManagePavementScreenState();
}

class _ManagePavementScreenState extends State<ManagePavementScreen> {
  GlobalKey<FormState> profileformkey = GlobalKey<FormState>();
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: MyThemeData.background,
      body: GetBuilder<ManagePavementController>(initState: (state) {
        Get.put(ManagePavementController());
      }, builder: (obj) {
        return Form(
          key: profileformkey,
          child: Stack(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    padding: EdgeInsets.only(left: width * 0.05),
                    width: width,
                    height: height * 0.1,
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "MANAGE PAVEMENT",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 28,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01,
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: height * 0.08),
                child: Align(
                  alignment: Alignment.center,
                  child: Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                      width: width,
                      height: height * 0.85,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white,
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: width * 0.05),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: height * 0.03,
                              ),
                              Text(
                                "Admin Panel - Payments",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: MyThemeData.background,
                                    fontWeight: FontWeight.bold),
                              ),
                              Container(
                                height: height * 0.03,
                              ),
                              SizedBox(height: height * 0.03),
                              lableTextname("Enter Amount"),
                              SizedBox(height: height * 0.01),
                              SizedBox(
                                width: width * 0.25,
                                child: Textformfield(
                                  controller: obj.amountController,
                                  abscureText: false,
                                  validation: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter ammount';
                                    }
                                    return null; // input is valid
                                  },
                                  keyboardtype: TextInputType.name,
                                ),
                              ),
                              SizedBox(
                                height: height * 0.3,
                                child: ListView.builder(
                                  itemCount: obj.payments.length,
                                  itemBuilder: (context, index) {
                                    final payment = obj.payments[index];
                                    return ListTile(
                                      title: Text(payment.description),
                                      subtitle: Text(
                                          "Amount: \$${payment.amount.toString()}"),
                                    );
                                  },
                                ),
                              ),
                              WebButton(
                                text: 'Submit Payment Amount',
                                color: MyThemeData.background,
                                width: width * 0.25,
                                onPressed: () {
                                  obj.submitPaymentAmount();
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget lableTextname(String title) {
    var height = MediaQuery.of(context).size.height;
    return Padding(
      padding: EdgeInsets.only(top: height * 0.015, bottom: height * 0.01),
      child: Text(
        title,
        style: TextStyle(
            color: MyThemeData.background, fontWeight: FontWeight.bold),
      ),
    );
  }
}
