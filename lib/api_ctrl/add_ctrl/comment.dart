import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';

Add_comment(String nom, String commentaire) async {
  Fluttertoast.showToast(msg: "Félicitations");
  DateTime date = DateTime.now();
  try {
    var res = await http.post(
        Uri.parse('https://nanisneakers.000webhostapp.com/add_comment.php'),
        body: {
          "nom": nom,
          "commentaire": commentaire,
          "date": '$date',
        });

    if (res.statusCode == 200) {
      var responseBodyOfSignUp = jsonDecode(res.body);
      if (responseBodyOfSignUp['success'] == true) {
        Fluttertoast.showToast(msg: "Félicitations ! Ajout reussie");
      } else {
        Fluttertoast.showToast(
            msg: "Une erreur est survenue, veuillez réessayer");
      }
    } else {
      // Gérer les cas où le code de statut HTTP n'est pas 200 (OK)
      Get.defaultDialog(
          title:
              "Il s'emmble qu'une interferance se produit veillez juste patienté quelque minute.",
          content: LottieBuilder.network(
              "https://lottie.host/ea23801f-4d06-444b-b94b-8b9abe4c3131/lSVwU8lXB5.json"));
    }
  } catch (e) {
    // Gérer les erreurs ici
    print(e.toString());
    Fluttertoast.showToast(msg: "Oups! Verifié votre connection a internet.");
  }
}
