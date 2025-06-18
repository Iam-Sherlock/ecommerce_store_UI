import 'package:ecommerce_store/utils/style.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Color(0xFF20C187), Color(0xFF094A32)],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft)),
          ),
          Positioned(
              child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 42),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 100, right: 150),
                  child: Text(
                    "CYBER LINIO",
                    style: Style.onboardingheadingStyle,
                    textAlign: TextAlign.left,
                  ),
                ),
                RichText(
                  text: TextSpan(
                      text: "40%",
                      style: Style.onBoardingContentStyle.copyWith(
                        fontSize: 32,
                      ),
                      children: [
                        TextSpan(
                            text: " DISCOUNT",
                            style: TextStyle(
                              fontSize: 16,
                            )),
                        TextSpan(
                            text: "\n in Technology",
                            style: TextStyle(fontSize: 23)),
                      ]),
                ),
                Padding(padding: EdgeInsets.all(8)),
                DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 8.0, vertical: 4.0),
                    child: Text(
                      'FREE SHIPPING',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFF5500)),
                    ),
                  ),
                )
              ],
            ),
          )),
          Positioned(
              top: 300,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Image.asset('assets/onboarding/collage.png'),
              )),
          Positioned(
              child: Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 50.0),
              child: TextButton(
                  onPressed: () {
                    context.push('/home');
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8.0, vertical: 4.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          'Log In',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFFFF5500),
                              fontSize: 22),
                        ),
                      ),
                    ),
                  )),
            ),
          ))
        ],
      ),
    );
  }
}
