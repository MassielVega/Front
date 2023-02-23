import 'package:domas_ecommerce/screens/complete_profile/complete_profile_screen.dart';
import 'package:flutter/material.dart';

import '../../../components/default_button.dart';
import '../../../components/form_error.dart';
import '../../../constants.dart';
import '../../../size_config.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  final _formKey = GlobalKey<FormState>();
  String? email;
  String? password;
  String? confirmPassword;
  final List<String> errors = [];

  void addError({String? error}) {
    if (!errors.contains(error)) {
      setState(() {
        errors.add(error!);
      });
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      setState(() {
        errors.remove(error!);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          buildEmailFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(30),),
          buildConfirmPasswordFormField(),
          SizedBox(height: getProportionateScreenHeight(10),),
          FormError(errors: errors),
          SizedBox(height: getProportionateScreenHeight(40),),
          DefaultButton(text: "Registrarse", press: () {
            if (_formKey.currentState!.validate()) {
              Navigator.pushNamed(context, CompleteProfileScreen.routeName);
            }
          })
        ],
      ),
    );
  }

  TextFormField buildConfirmPasswordFormField() {
    return TextFormField(
    obscureText: true,
    onSaved: (newValue) => confirmPassword = newValue ?? "",
    onChanged: (value) {
      if (password == confirmPassword) {
        removeError(error: kMatchPassError);
      } 
      confirmPassword = value;
      return;
    },
    validator: (value) {
      if (value!.isEmpty) {
        return "";
      } else if (password != confirmPassword) {
        addError(error: kMatchPassError);
        return "";
      }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "Confirmar contraseña",
      hintText: "Confirma tu contraseña",
      errorStyle: TextStyle(height: 0.0),
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Align(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Icon(
          Icons.password,
        ),
      ),
    ),
  );
  }

  TextFormField buildPasswordFormField() {
    return TextFormField(
    obscureText: true,
    onSaved: (newValue) => password = newValue ?? "",
    onChanged: (value) {
      if (value.isNotEmpty) {
        removeError(error: kPassNullError);
      } else if (value.length >= 8) {
        removeError(error: kShortPassError);
      }
      password = value;
      return;
    },
    validator: (value) {
      if (value!.isEmpty) {
        addError(error: kPassNullError);
        return "";
      } else if (value.length < 8) {
        addError(error: kShortPassError);
        return "";
      }
      return null;
    },
    decoration: const InputDecoration(
      labelText: "Contraseña",
      hintText: "Ingresa tu contraseña",
      errorStyle: TextStyle(height: 0.0),
      // If  you are using latest version of flutter then lable text and hint text shown like this
      // if you r using flutter less then 1.20.* then maybe this is not working properly
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Align(
        widthFactor: 1.0,
        heightFactor: 1.0,
        child: Icon(
          Icons.password,
        ),
      ),
    ),
  );
  }

  TextFormField buildEmailFormField() {
    return TextFormField(
            keyboardType: TextInputType.emailAddress,
            onSaved: (newValue) => email = newValue ?? "",
            onChanged: (value) {
              if (value.isNotEmpty) {
                removeError(error: kEmailNullError);
              } else if (emailValidatorRegExp.hasMatch(value)) {
                removeError(error: kInvalidEmailError);
              }
              return;
            },
            validator: (value) {
              if (value!.isEmpty) {
                addError(error: kEmailNullError);
                return "";
              } else if (!emailValidatorRegExp.hasMatch(value)) {
                addError(error: kInvalidEmailError);
                return "";
              }
              return null;
            },
            decoration: const InputDecoration(
              labelText: "Correo electrónico",
              hintText: "Ingresa tu correo electrónico",
              errorStyle: TextStyle(height: 0.0),
              // If  you are using latest version of flutter then lable text and hint text shown like this
              // if you r using flutter less then 1.20.* then maybe this is not working properly
              floatingLabelBehavior: FloatingLabelBehavior.always,
              suffixIcon: Align(
                widthFactor: 1.0,
                heightFactor: 1.0,
                child: Icon(
                  Icons.email,
                ),
              ),
            ));
  }
}