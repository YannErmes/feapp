import 'dart:convert';
import 'dart:math';

import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';

import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'dart:io';

class ImagePickerWidget extends StatefulWidget {
  const ImagePickerWidget({super.key});

  @override
  State<ImagePickerWidget> createState() => _ImagePickerWidgetState();
}

class _ImagePickerWidgetState extends State<ImagePickerWidget> {
  File? imagePath;
  String? imageName;
  String? imageData;
  bool anime = false ;
bool repeat = true ;
  final rep = Hive.box('mybox3');




  final ImagePicker imagePicker = ImagePicker();
  TextEditingController captionController = TextEditingController();

  Future<void> upload() async {

    try {
      // URL de l'API pour télécharger l'image
      String uri = "https://www.fe-store.pro/Upload.php";

      // Requête POST avec les données d'image
      var response = await http.post(
        Uri.parse(uri),
        body: {
          "caption": captionController.text,
          "data": imageData,
          "name": imageName,
        },

      );

      // Analyse de la réponse JSON
      var responseData = jsonDecode(response.body);

      // Vérification du succès de la requête
      if (responseData["success"] == true) {

        Get.back();
        Get.defaultDialog(title: "Felicitation !Votre image a été envoyée"
            " avec succès.Nous envrons les resultats directement dans votre inbox . À bientôt !" ,titleStyle: const TextStyle(fontSize: 20),content: const Text('') );
        captionController.clear();
        Navigator.pop(context);


      } else {
        print(
            'Erreur lors du téléchargement de l\'image : ${responseData["message"]}');
      }
    } catch (e) {
      // Gestion des erreurs lors de la requête HTTP
      print('Erreur lors de l\'envoi de l\'image : $e');
    }
  }
  Future<void> getImage() async {
    try {
      // Sélectionner une image depuis la galerie
      final pickedFile =
      await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Lisez l'image sous forme de `Uint8List`
        Uint8List imageBytes = await pickedFile.readAsBytes();

        // Encodez l'image en base64
        String data = base64Encode(imageBytes);

        // Mettre à jour l'état de l'application
        setState(() {
          imageData = data;
          imagePath = File(pickedFile.path);
          imageName = pickedFile.name ?? pickedFile.path.split('/').last;
        });
        Fluttertoast.showToast(msg: 'Image sélectionnée! Ajoutez votre numéro de téléphone et autres information de votre choix avant l\'envoie',timeInSecForIosWeb: 10);
        print('Image sélectionnée et encodée en base64.');
      } else {
        print('Aucune image sélectionnée.');
      }
    } catch (e) {
      // Gestion des erreurs lors de la sélection de l'image
      print('Erreur lors de la sélection de l\'image : $e');
    }
  }
  Future<void> animateforme() async {
    await Future.delayed(const Duration(seconds: 1), () {
      print('ok');
      setState(() {
        anime = true ;
      });
    });
  }



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animateforme() ;

  }



  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(seconds: 3),
      margin: const EdgeInsets.only(bottom: 5),
      height: 40,
      width: anime ? 380 :100,
      decoration: BoxDecoration(

        color: anime ? Colors.black54: Colors.blueGrey,
        borderRadius: BorderRadius.circular(16),

      ),

      child: Center(
        child: TextFormField(
          style: const TextStyle(color: Colors.white, fontFamily:AutofillHints.addressCity , fontSize: 15),

          controller: captionController,
          decoration: InputDecoration(
            border: InputBorder.none,
            labelStyle: const TextStyle(color: Colors.black),
            prefixIcon: imagePath != null
                ? IconButton(
                onPressed:() {
                  if(captionController.text.isNotEmpty) {
                        Get.defaultDialog(
                            content: const CircularProgressIndicator(),
                            title: 'Envoie en cours...');
                        upload();
                      }else {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("N'oublez pas d'insérer dans le champs quelques indications sur votre requéte et une numero ou une adresse mail pour recevoire les resultats de notre équipe,Merci!"),duration: Duration(seconds: 9),));
                  }
                    },
                icon: const Icon(
                  CupertinoIcons.paperplane,
                  color: Colors.green,
                ))

                : IconButton(
                onPressed: getImage, icon: const Icon(Icons.image_search_outlined , color: Colors.white,)),


            suffixIcon: AvatarGlow(
              repeat: rep.get(15) ?? true ,
              curve: Easing.legacy,
              glowCount: 4,
              glowColor: Colors.white,

              child: IconButton(
                icon:  Icon(CupertinoIcons.question_circle , color: Colors.white,),
                onPressed: () {
                  setState(() {
                    rep.put(15, false);
                  });


                  Get.snackbar('Cc', "Retrouvez n'importe lequel des modèle de vos désir "
                      "en envoyant simplement une photo de votre galerie et en ajoutant un numero ou une indication dans la barre. Notre équipe "
                      "d'experts se charge de le retrouver avec tous les détails possibles et de vous contactez directement pour vous faire gagné du temps."  , duration: const Duration(seconds: 16),colorText: Colors.white, backgroundColor: Colors.black12  );
                },
              ),
            ),




            suffixIconColor: Colors.black87,
            prefixIconColor: Colors.black87,



          ),
        ),
      ),
    );
  }
}
