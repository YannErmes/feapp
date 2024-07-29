import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fesneakers/pages/home.dart';
import 'package:fesneakers/pages/sigin.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();


  bool view =  false ;
  registerAndSaveUserRecord( String email , String password ,String nomuser) async {
    try {
      var res = await http.post(
        Uri.parse('https://www.fe-store.pro/login.php'),
        body: {
          "email": email,
          "password": password,
        },
      );

      if (res.statusCode == 200) {
        var responseBodyOfSignUp = jsonDecode(res.body);
        if (responseBodyOfSignUp['success'] == true) {

          Get.defaultDialog(title: 'Bienvenue $nomuser',content: const CircularProgressIndicator() );
         writebox(nomuser, password, email);

          await Future.delayed(
            const Duration(seconds: 4),
                ()
                {
                  Get.back();
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return homepage(
                        useremail:email,
                        usernom: nomuser, t: 1,
                      );
                    }));
                  });

        } else {
          Fluttertoast.showToast(
              msg: "Oups ! ${responseBodyOfSignUp['message']}");
        }
      } else {
        // Gérer les cas où le code de statut HTTP n'est pas 200 (OK)
        Get.defaultDialog(
            title:
            "Mise en place des mesures d'authentification sécurisée du compte. Essayez de vous reconnecter après quelques secondes 😉 "
            ,titleStyle: const TextStyle(fontSize: 15),
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
          'Oups!Vérifiez votre connection à internet 😥 !',
          titleStyle: const TextStyle(fontSize: 15),
          content: const SizedBox(
              height: 30,
              child: Icon(Icons.wifi_off)));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black87)),
        hoverColor: Colors.white,
        onPressed: () {

          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios, size: 30,color: Colors.white,),
      ),
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SizedBox(
            width: double.infinity,
            height: 1000,

            child:
            CachedNetworkImage(
                imageUrl: 'https://i.postimg.cc/PxdtgJSp/download.jpg', fit: BoxFit.cover,
                placeholder: (context, url) => const LinearProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              )


          ),
          Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(10),
              scrollDirection: Axis.vertical,
              child: Container(
                padding: const EdgeInsets.all(8),
                height: 450,
                width: 300,
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

                       redbox()  ,
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veillez ramplire ce champs !';
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
                            return 'Veillez ramplire ce champs !';
                          }
                          return null;
                        },
                        controller: _passwordController,
                        obscureText: view,
                        decoration:  InputDecoration(
                          labelText: 'Password',
                          prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    view = !view;
                                  });
                                },
                                icon: view
                                    ? const Icon(CupertinoIcons.eye_slash)
                                    : const Icon(CupertinoIcons.eye) )
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Veillez ramplire ce champs !';
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text(
                            'Bienvenue veillez crée un compte',
                            style: TextStyle(fontSize: 12),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const singupPage(),));
                              },
                              child: const Text(
                                'ici!',
                                style: TextStyle(fontSize: 15),
                              ))
                        ],
                      ),
                      const SizedBox(height: 12.0),
                      ElevatedButton.icon(
                        onPressed: () async {

                          if(_formKey.currentState!.validate()){

                            registerAndSaveUserRecord( _emailController.text , _passwordController.text , _usernameController.text);

                          }else{

                          }


                        },
                        label: const Text('Login'),
                        icon: const Icon(CupertinoIcons.lock),
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

















  final _memoir = Hive.box('mybox');

  void writebox ( String nom , String password , String email){
    _memoir.put(1, nom);
    _memoir.put(2, password);
    _memoir.put(3, email);

  }
// read
  Widget redbox (){
   String nomuser =  _memoir.get(1) ?? '';
   String email =  _memoir.get(3) ?? '';
   String password =  _memoir.get(2) ?? '';
   return Container(
     child: TextButton(
       onPressed: (){
         registerAndSaveUserRecord(email , password , nomuser);
       },
       child: Text('Se connecté sur : $nomuser'),
     )

   );

  }
// dele
  void delbox (){
    //  print( _fav.delete(1));
  }

}
