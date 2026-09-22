import 'package:flutter/material.dart';
import 'package:e_instru/widgets/app_circle_avatar.dart';
import 'package:e_instru/widgets/auth_form/email_field.dart';
import 'package:e_instru/widgets/auth_form/password_field.dart';
import 'package:e_instru/screens/auth_screen/subscription_screen.dart';

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

                        const Text.rich(

                          TextSpan(
                            text:'Bienvenue chez',
                            style: TextStyle(
                                color: Color.fromARGB(255, 15, 59, 74),
                                fontSize: 20,
                                fontWeight: FontWeight.bold
                            ),

                            children : <TextSpan>[
                              TextSpan(
                                  text: ' Music Store',
                                  style: TextStyle(
                                      color: Colors.orange,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold
                                  )
                              )
                            ],
                          ),

                        ),


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
                                backgroundColor: Color.fromARGB(255, 15, 59, 74),
                                foregroundColor: Colors.white,
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
                                foregroundColor: Color.fromARGB(255, 15, 59, 74)
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
