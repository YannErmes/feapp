import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fesneakers/pages/home.dart';
import 'package:fesneakers/pages/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:lottie/lottie.dart';

class singupPage extends StatefulWidget {
  const singupPage({super.key});

  @override
  _singupPageState createState() => _singupPageState();
}

class _singupPageState extends State<singupPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _contactController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  var registretion = Hive.box('userauth');

  registerAndSaveUserRecord() async {
    DateTime date = DateTime.now();

    try {
      var res = await http.post(
          Uri.parse('https://www.fe-store.pro/singup.php'),
          body: {
            "name": _usernameController.text,
            "email": _emailController.text,
            "password": _passwordController.text,
            "contact": _contactController.text,
            "dateN": "$date"
          });

      print(jsonDecode(res.body));

      if (  res.statusCode == 200) {
        var responseBodyOfSignUp = jsonDecode(res.body);
        if (responseBodyOfSignUp['success'] == true) {
          
          Get.snackbar('Félicitation☺', "votre compte viens d'étre crée avec succsé \n.Veillez inseré vos identifiant de connection ",duration: Duration(seconds: 5),colorText: Colors.white,backgroundColor: Colors.black45 );
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => homepage(t: 1),
              ));
          registretion.put('utilisateurnom', '${_usernameController.text}');
          registretion.put('utilisateurmail', '${_emailController.text}');
          registretion.put('utilisateurpassword', '${_passwordController.text}');


        } else {
          Fluttertoast.showToast(msg: " Oops! ${responseBodyOfSignUp['message ']}");
        }
      } else {
        // Gérer les cas où le code de statut HTTP n'est pas 200 (OK)

        Get.defaultDialog(
            title:
             "Nous avons commencé à mettre en place la sécurisation pour la création de compte. Réssayez de créer votre compte après avoir redémarré l'application 😉",
            titleStyle: const TextStyle(fontSize: 15),
            content: SizedBox(
                height: 100,
                child: LottieBuilder.network(
                    'https://lottie.host/792693d2-fdce-44e2-b901-49bad6c7599a/9TEcEU7mfB.json')
            ));


      }
    } catch (e) {
      // Gérer les erreurs ici
      print(e.toString());
      Get.defaultDialog(
          title:
          'Oups! Verifié votre connection à internet et redémmarez votre application 😥 !',
          titleStyle: const TextStyle(fontSize: 15),
          content: const SizedBox(
              height: 30,
              child: Icon(Icons.wifi_off)));
    }
  }
  bool view = false;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      floatingActionButton: IconButton(

        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black87)),
        onPressed: () {

          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios, size: 30,color: Colors.white,),
      ),
      body: Stack(
        children: [
          SizedBox(
              width: double.infinity,
              height: 1000,
              child: CachedNetworkImage(
                imageUrl:
                    'https://i.postimg.cc/3N7Qx5vk/pexels-photo-1972115.jpg',
                fit: BoxFit.cover,
                placeholder: (context, url) =>  LoadingAnimationWidget.flickr(
                  leftDotColor: Colors.brown.shade200,
                  rightDotColor: Colors.black,
                  size: 50,
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 500,
                width: 330,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: Colors.white70),
                    color: Colors.white.withOpacity(0.6)),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://i.postimg.cc/X73NB9fB/fe1.png',
                        fit: BoxFit.cover,
                        height: 40,
                      ),
                      const SizedBox(height: 1.0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _usernameController,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person_outline),
                          labelText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText:view,
                        decoration:  InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    view =!view;
                                  });
                                },
                                icon: view ? const Icon(CupertinoIcons.eye_slash) : const Icon(CupertinoIcons.eye) )
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _emailController,
                        decoration: const InputDecoration(
                          labelText: 'e-mail',
                          prefixIcon: Icon(Icons.email_outlined),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter some text';
                          }
                          return null;
                        },
                        controller: _contactController,
                        decoration: const InputDecoration(
                          labelText: 'contact',
                          prefixIcon: Icon(CupertinoIcons.phone),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Déja un compts ?',
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => const LoginPage(),
                                    ));
                              },
                              child: const Text(
                                'connecter vous!',
                                style: TextStyle(fontSize: 15),
                              ))
                        ],
                      ),
                      const SizedBox(height: 11.0),
                      ElevatedButton.icon(
                        onPressed: () async {
                          if (_formKey.currentState!.validate() && _emailController.text.contains('@') && _emailController.text.contains('.com') && _passwordController.text.length<4) {

                            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Vérfiez si le format de votre email est correcte , remplissez tous les champs et insérez un mots de passe avec au moins 4 charactéres'), duration: Duration(seconds: 9),));

                          } else {
                            registerAndSaveUserRecord();
                          }
                        },
                        label: const Text('SignUp'),
                        icon: const Icon(CupertinoIcons.person_add_solid),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
