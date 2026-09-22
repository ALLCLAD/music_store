import 'package:flutter/material.dart';
import 'package:e_instru/widgets/app_circle_avatar.dart';
import 'package:e_instru/widgets/email_field.dart';
import 'package:e_instru/widgets/name_field.dart';
import 'package:e_instru/widgets/password_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Form(
                    child: Column(
                      children: <Widget>[
                        const AppCircleAvatar(),
                        const Text('Bienvenue chez Music Store'),
                        const EmailField(),
                        const PasswordField(),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text('Connexion')
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text("Je n'ai pas de compte")
                        )
                      ],
                    )

                )
              )
            )
          )
      )
    );
  }
}
