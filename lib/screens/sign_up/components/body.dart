import 'package:domas_ecommerce/components/no_account_text.dart';
import 'package:domas_ecommerce/screens/sign_up/components/sign_up_form.dart';
import 'package:domas_ecommerce/size_config.dart';
import 'package:flutter/material.dart';

import '../../../components/google_card.dart';
import '../../../constants.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(20)),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: SizeConfig.screenHeight * 0.04),
                Text("Crear tu cuenta", style: headingStyle),
                const Text(
                  "Ingresa tu información \n o inicia sesión con Google",
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                const SignUpForm(),
                SizedBox(
                  height: SizeConfig.screenHeight * 0.08,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GoogleCard(
                      icon: "assets/icons/google-icon.svg",
                      press: () {},
                    ),
                  ],
                ),
                const Text("Regístrate", textAlign: TextAlign.center,)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
