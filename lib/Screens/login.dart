import 'package:busmate/Constants/constants.dart';
import 'package:busmate/Screens/conductor_home.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:busmate/Controller/LoginController.dart';

class LoginPage extends StatelessWidget {
  final LoginController loginController = Get.put(LoginController());
  final auth = FirebaseAuth.instance;
  late String email;
  late String password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Visibility(
              visible: !loginController.isLoading.value,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(18),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("Log in", style: kBlackHeadingSize),
                      const SizedBox(
                        height: 13,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Email",
                              style: kGreyTextStyle,
                            ),
                          ),
                          TextFormField(
                            decoration: kTextFieldDecoration,
                            textAlign: TextAlign.center,
                            onChanged: (value) {
                              email = value;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Password",
                              style: kGreyTextStyle,
                            ),
                          ),
                          TextFormField(
                            decoration: kTextFieldDecoration,
                            textAlign: TextAlign.center,
                            obscureText: true,
                            onChanged: (value) {
                              password = value;
                            },
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Container(
                        width: double.infinity,
                        height: 45,
                        margin: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            try {
                              loginController.loadingStatus(true);
                              final user =
                                  await auth.signInWithEmailAndPassword(
                                      email: email, password: password);
                              if (user != null) {
                                Get.off(HomePage());
                              }
                            } catch (e) {
                              print(e);
                            } finally {
                              loginController.loadingStatus(false);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kGreenMainTheme,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )),
                          child: const Text(
                            "Continue",
                            style: TextStyle(
                                fontSize: 16.7, fontWeight: FontWeight.w700),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Obx(() {
              return Visibility(
                visible: loginController.isLoading.value,
                child: CircularProgressIndicator(
                  color: kGreenMainTheme,
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
