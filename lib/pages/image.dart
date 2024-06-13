import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

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
  bool activeform = false ;

  final ImagePicker imagePicker = ImagePicker();
  TextEditingController captionController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    active();
  }

  Future<void> upload() async {

    try {
      // URL de l'API pour télécharger l'image
      String uri = "https://nanisneakers.000webhostapp.com/Upload.php";

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
        Get.defaultDialog(title: "Felicitation !', Votre image a été envoyée"
            " avec succès. Restez connecté pour recevoir prochainement les résultats. À bientôt !" ,titleStyle: const TextStyle(fontSize: 20),content: const Text('') );

      } else {
        print(
            'Erreur lors du téléchargement de l\'image : ${responseData["message"]}');
      }
    } catch (e) {
      // Gestion des erreurs lors de la requête HTTP

      Fluttertoast.showToast( msg :'Erreur lors de l\'envoi de l\'image : $e');
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
        Fluttertoast.showToast(msg: 'Image sélectionnée! Ajoutez votre numéro de téléphone et autres information de votre choix avant l\'envoie');
        print('Image sélectionnée et encodée en base64.');
      } else {
        print('Aucune image sélectionnée.');
      }
    } catch (e) {
      // Gestion des erreurs lors de la sélection de l'image
      print('Erreur lors de la sélection de l\'image : $e');
    }
  }

  Future<void> active ()async{
    await   Future.delayed(Duration(seconds: 6),(){
      setState(() {
        activeform = true ;
      });
    },);
  }


  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      margin: const EdgeInsets.only(bottom: 5),
      height: 40,
      width: 380,
      decoration: BoxDecoration(
 color: activeform ?
 const Color(0xFFB0ADB0)
     : Colors.blueGrey,
        boxShadow: [
          BoxShadow(
              offset: Offset(-5,- 5),
              color:activeform? Colors.black : Colors.transparent,
              blurRadius: 12,
              spreadRadius: 2
          ),
          BoxShadow(
              offset: Offset(3,3),
              color: activeform ?Colors.white : Colors.transparent,
              blurRadius: 15,
              spreadRadius: 2
          ),
        ],
        borderRadius: BorderRadius.circular(15),

      ),

      duration: const Duration(seconds: 3),
      child: Center(
        child: TextFormField(
          style: const TextStyle(color: Colors.black, fontFamily:AutofillHints.addressCity , fontSize: 15),

          controller: captionController,
          decoration: InputDecoration(
            fillColor: Colors.transparent,

            border: InputBorder.none,
            labelStyle: const TextStyle(color: Colors.black),
            prefixIcon: imagePath != null
                ? IconButton(
                onPressed:() {
                  Get.defaultDialog(content: const CircularProgressIndicator() , title: 'Envoie en cours...');
                  upload();
                },
                icon: const Icon(
                  CupertinoIcons.paperplane,
                  color: Colors.green,
                ))


                : IconButton(
                onPressed: getImage, icon: const Icon(Icons.image_search_outlined)),


            suffixIcon: IconButton(
              icon: const Icon(CupertinoIcons.question_circle),
              onPressed: () {
               Get.snackbar('', "Retrouvez n'importe quel modèle de votre désir "
                                "en envoyant simplement une photo de votre galerie. Notre équipe "
                   "d'experts se charge de le retrouver avec tous les détails possibles."  , duration: const Duration(seconds: 10) );
              },
            ),


            suffixIconColor: Colors.black87,
            prefixIconColor: Colors.black87,



          ),
        ),
      ),
    );
  }
}
