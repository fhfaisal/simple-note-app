import 'dart:ffi';

import 'package:caretutors/app/utils/validators/validators.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: controller.loginFormKey,
          child: Column(
            children: [
              TextFormField(
                controller: controller.email.value,
                validator: (value) => AppValidators.validateEmail(value),
                decoration: const InputDecoration(labelText: 'Email'),
              ),
              TextFormField(
                controller: controller.password.value,
                validator: (value) => AppValidators.validatePassword(value),
                decoration: const InputDecoration(labelText: 'Password',),
                obscureText: controller.hidePass.value,
              ),
              ElevatedButton(
                onPressed: () =>controller.loginWithEmailAndPassword(),
                child: const Text('Login'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
