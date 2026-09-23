import 'package:flutter/material.dart';
import 'package:e_instru/widgets/app_circle_avatar.dart';
import 'package:e_instru/widgets/auth_form/email_field.dart';
import 'package:e_instru/widgets/auth_form/password_field.dart';
import 'package:e_instru/widgets/auth_form/name_field.dart';
import 'package:e_instru/widgets/auth_form/welcome.dart';
import 'package:e_instru/screens/auth_screen/login_screen.dart';
import 'package:e_instru/widgets/colors.dart';

class SubscriptionScreen extends StatefulWidget {
  const SubscriptionScreen({super.key});

  @override
  State<SubscriptionScreen> createState() => _SubscriptionScreenState();
}

class _SubscriptionScreenState extends State<SubscriptionScreen> {
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

                                // widget personnalisé du champ nom
                                const NameField(),

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

                                      child: const Text("S'inscrire")
                                  ),

                                ),

                                TextButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) => const LoginScreen()
                                          )
                                      );
                                    },

                                    style: TextButton.styleFrom(
                                        foregroundColor: C2,
                                    ),

                                    child: const Text("J'ai déjà un compte ?")
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

