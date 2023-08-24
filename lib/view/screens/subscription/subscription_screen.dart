import 'package:flutter/material.dart';
import 'package:jetfit/utilis/theme_data.dart';
import 'package:jetfit/view/screens/dashboard.dart';
import 'package:jetfit/view/screens/subscription/subscription_controller.dart';
import 'package:get/get.dart';

class SubscriptionSCreen extends StatefulWidget {
  const SubscriptionSCreen({super.key});

  @override
  State<SubscriptionSCreen> createState() => _SubscriptionSCreenState();
}

class _SubscriptionSCreenState extends State<SubscriptionSCreen> {
  var height, width;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: OrientationBuilder(builder: (context, oreentation) {
        return GetBuilder<SubscriptionController>(initState: (state) {
          Get.put(SubscriptionController());
        }, builder: (value) {
          return Container(
              height: height,
              width: width,
              color: MyThemeData.background,
              child: oreentation == Orientation.landscape
                  ? Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: width * 0.12,
                        ),
                        Container(
                          height: height * 0.85,
                          width: width * 0.33,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/home/persons.png")),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        SizedBox(
                          width: width * 0.03,
                        ),
                        SizedBox(
                          height: height * 0.9,
                          width: width * 0.45,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Subscribe to Premium",
                                style: TextStyle(
                                  fontSize: width * 0.025,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Subscribe to our services to start your fitness journey",
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: width * 0.015,
                                ),
                              ),
                              Text(
                                "Our Plans",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: width * 0.017,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "1 Month Subscription",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.3,
                                          child: Text(
                                            "Start your 7-day free trial then \$7.99 / month. Subscription continues until cancelled",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: width * 0.015,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "\$07.99",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Radio(
                                          value: true,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.white),
                                          activeColor: Colors.white,
                                          groupValue: "filtervalue",
                                          onChanged: (value) {
                                            print(value);
                                            //  obj.filterChange(value);
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "3 Month Subscription",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.3,
                                          child: Text(
                                            "Start your 7-day free trial then \$19.99 / 3 months. Subscription continues until cancelled",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: width * 0.015,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "\$19.99",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Radio(
                                          value: true,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.white),
                                          activeColor: Colors.white,
                                          groupValue: "filtervalue",
                                          onChanged: (value) {
                                            print(value);
                                            //  obj.filterChange(value);
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "12 Month Subscription",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: width * 0.02,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        SizedBox(
                                          width: width * 0.3,
                                          child: Text(
                                            "Start your 7-day free trial then \$79.99 / 12 months. Subscription continues until cancelled",
                                            style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: width * 0.015,
                                            ),
                                          ),
                                        ),
                                        Text(
                                          "\$79.99",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.02,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Radio(
                                          value: true,
                                          fillColor:
                                              MaterialStateColor.resolveWith(
                                                  (states) => Colors.white),
                                          activeColor: Colors.white,
                                          groupValue: "filtervalue",
                                          onChanged: (value) {
                                            print(value);
                                            //  obj.filterChange(value);
                                          },
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Row(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DashBoard()));
                                    },
                                    child: Container(
                                      height: height * 0.09,
                                      width: width * 0.2,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Subscribe now",
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: width * 0.01,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const DashBoard()));
                                    },
                                    child: Container(
                                      height: height * 0.09,
                                      width: width * 0.2,
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: Colors.grey,
                                        ),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Skip",
                                          style: TextStyle(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: height * 0.05,
                        ),
                        Container(
                          height: height * 0.34,
                          width: width * 0.8,
                          decoration: BoxDecoration(
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage("images/home/persons.png")),
                              borderRadius: BorderRadius.circular(20)),
                        ),
                        Container(
                          height: height * 0.01,
                        ),
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: width * 0.08),
                            child: SizedBox(
                              // color: Colors.red,
                              height: height,
                              width: width * 0.9,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Subscribe to Premium",
                                    style: TextStyle(
                                      fontSize: width * 0.05,
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    "Subscribe to our services to start your fitness journey",
                                    style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: width * 0.03,
                                    ),
                                  ),
                                  Text(
                                    "Our Plans",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: width * 0.035,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "1 Month Subscription",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.037,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.6,
                                              child: Text(
                                                "Start your 7-day free trial then \$7.99 /3 month. Subscription continues until cancelled",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: width * 0.03,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "\$07.99",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Radio(
                                              value: true,
                                              fillColor: MaterialStateColor
                                                  .resolveWith(
                                                      (states) => Colors.white),
                                              activeColor: Colors.white,
                                              groupValue: "filtervalue",
                                              onChanged: (value) {
                                                print(value);
                                                //  obj.filterChange(value);
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "3 Month Subscription",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.037,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.6,
                                              child: Text(
                                                "Start your 7-day free trial then \$19.99 / 3 months. Subscription continues until cancelled",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: width * 0.03,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "\$19.99",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Radio(
                                              value: true,
                                              fillColor: MaterialStateColor
                                                  .resolveWith(
                                                      (states) => Colors.white),
                                              activeColor: Colors.white,
                                              groupValue: "filtervalue",
                                              onChanged: (value) {
                                                print(value);
                                                //  obj.filterChange(value);
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          "12 Month Subscription",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: width * 0.037,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: width * 0.6,
                                              child: Text(
                                                "Start your 7-day free trial then \$79.99 / 12 months. Subscription continues until cancelled",
                                                style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: width * 0.03,
                                                ),
                                              ),
                                            ),
                                            Text(
                                              "\$79.99",
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: width * 0.035,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                            Radio(
                                              value: true,
                                              fillColor: MaterialStateColor
                                                  .resolveWith(
                                                      (states) => Colors.white),
                                              activeColor: Colors.white,
                                              groupValue: "filtervalue",
                                              onChanged: (value) {
                                                print(value);
                                                //  obj.filterChange(value);
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: height * 0.02,
                                  ),
                                  Row(
                                    children: [
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DashBoard()));
                                        },
                                        child: Container(
                                          height: height * 0.055,
                                          width: width * 0.35,
                                          decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Subscribe now",
                                            ),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        width: width * 0.05,
                                      ),
                                      InkWell(
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      const DashBoard()));
                                        },
                                        child: Container(
                                          height: height * 0.055,
                                          width: width * 0.35,
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(50),
                                          ),
                                          child: const Center(
                                            child: Text(
                                              "Skip",
                                              style: TextStyle(
                                                color: Colors.grey,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: height * 0.05,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ));
        });
      }),
    );
  }
}
