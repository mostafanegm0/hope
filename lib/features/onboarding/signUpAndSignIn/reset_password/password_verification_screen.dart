import 'package:flutter/material.dart';
import 'package:war_time/features/onboarding/gird_menu/home.dart';
import 'package:war_time/features/onboarding/signUpAndSignIn/reset_password/create_new_password.dart';

class PasswordVerificationScreen extends StatefulWidget {
  const PasswordVerificationScreen({super.key});

  @override
  State<PasswordVerificationScreen> createState() => _PasswordVerificationScreen();
}

class _PasswordVerificationScreen extends State<PasswordVerificationScreen> {
  final int codeLength = 4;
  String code = "";

  void onKeyTap(String value) {
    if (code.length < codeLength) {
      setState(() {
        code += value;
      });
    }
  }

  void onDelete() {
    if (code.isNotEmpty) {
      setState(() {
        code = code.substring(0, code.length - 1);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              IconButton(
                onPressed: () => Navigator.pop(context),
                icon: const Icon(Icons.arrow_back_ios),
              ),

              const SizedBox(height: 30),

              const Text(
                "Verification Code",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Enter the verification code that we have\nsent to your phone number",
                style: TextStyle(color: Colors.grey),
              ),

              const SizedBox(height: 30),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: List.generate(codeLength, (index) {
                  return Container(
                    width: 60,
                    height: 60,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: index < code.length
                            ? Colors.black
                            : Colors.grey.shade300,
                      ),
                    ),
                    child: Text(
                      index < code.length ? code[index] : "",
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  );
                }),
              ),

              const SizedBox(height: 16),

              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Resend Code",
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ),

              const SizedBox(height: 10),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: code.length == codeLength ? () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CreateNewPasswordScreen();
                        },
                      ),
                    );
                  } : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text(
                    "Continue",
                    style: TextStyle(fontSize: 16,color: Colors.white),
                  ),
                ),
              ),

              const Spacer(),

              buildKeypad(),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildKeypad() {
    return Column(
      children: [
        for (var row in [
          ["1", "2", "3"],
          ["4", "5", "6"],
          ["7", "8", "9"],
          [".", "0", "⌫"],
        ])
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: row.map((key) {
              return Padding(
                padding: const EdgeInsets.all(12),
                child: InkWell(
                  onTap: () {
                    if (key == "⌫") {
                      onDelete();
                    } else if (key != ".") {
                      onKeyTap(key);
                    }
                  },
                  borderRadius: BorderRadius.circular(40),
                  child: SizedBox(
                    width: 60,
                    height: 60,
                    child: Center(
                      child: Text(
                        key,
                        style: const TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
      ],
    );
  }
}
