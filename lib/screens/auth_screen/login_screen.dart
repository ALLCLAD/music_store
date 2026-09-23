import 'package:flutter/material.dart';
import 'package:e_instru/widgets/app_circle_avatar.dart';
import 'package:e_instru/widgets/auth_form/email_field.dart';
import 'package:e_instru/widgets/auth_form/password_field.dart';
import 'package:e_instru/widgets/auth_form/welcome.dart';
import 'package:e_instru/screens/auth_screen/subscription_screen.dart';
import 'package:e_instru/widgets/colors.dart';

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

                      spacing: 50,
                      
                      children: <Widget>[
                        // widget personnalisé du logo de l'app sous forme circulaire
                        const AppCircleAvatar(),

                        // widget personnaisé du texte de bienvenue
                        const Welcome(),

                        // widget personnalisé du champ email
                        const EmailField(),

                        // widget personnalisé du champ mot de passe
                        const PasswordField(),

                        // side box pour contenir le boutton de connexion afin de lui donner une taille fixe et qu'il s'étende sur toute la largeur de l'écran
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {},

                              style: ElevatedButton.styleFrom(
                                backgroundColor: C2,
                                foregroundColor: C3,
                              ),

                              child: const Text('Connexion')
                          ),

                        ),

                        TextButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const SubscriptionScreen()
                                  )
                              );
                            },

                            style: TextButton.styleFrom(
                                foregroundColor: C2
                            ),

                            child: const Text("Je n'ai pas de compte ?")
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
