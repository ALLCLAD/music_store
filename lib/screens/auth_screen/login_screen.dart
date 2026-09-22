import 'package:flutter/material.dart';
import 'package:e_instru/widgets/app_circle_avatar.dart';
import 'package:e_instru/widgets/auth_form/email_field.dart';
import 'package:e_instru/widgets/auth_form/password_field.dart';

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
                        // wiget personnalisé du logo de l'app sous forme circulaire
                        const AppCircleAvatar(),
                        
                        const Text('Bienvenue chez Music Store'),

                        // wiget personnalisé du champ email
                        const EmailField(),

                        // wiget personnalisé du champ mot de passe
                        const PasswordField(),

                        // side box pour contenir le boutton de connexion afin de lui donner une taille fixe et qu'il s'étende sur toute la largeur de l'écran
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                              onPressed: () {},

                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.blue,
                                foregroundColor: Colors.white,
                              ),

                              child: const Text('Connexion')
                          ),

                        ),
                        

                        
                        TextButton(
                            onPressed: () {},

                            style: TextButton.styleFrom(
                                foregroundColor: Colors.blue
                            ),

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
