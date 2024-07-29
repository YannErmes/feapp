import 'dart:convert';

import 'package:fluttertoast/fluttertoast.dart';

import 'package:http/http.dart' as http;



Add_card(String image, String nom, String eid  , String email) async {
  try {
    var res = await http
        .post(Uri.parse('https://www.fe-store.pro/add_card.php'), body: {
      "eid": eid,
      "image": image,
      "nom": nom,
      "userpass" : email
    });

    if (res.statusCode == 200) {
      var responseBodyOfSignUp = jsonDecode(res.body);
      if (responseBodyOfSignUp['success'] == true) {
        Fluttertoast.showToast(msg: "Félicitations! Ajout réussie");
      } else {
        Fluttertoast.showToast(msg: "Oups! verifié que vous étes connecté a votre compte.");
      }
    } else {
      // Gérer les cas où le code de statut HTTP n'est pas 200 (OK)
      Fluttertoast.showToast(msg: "Oups! veillez redemarré votre applicarion aprés  1 minute");
    }
  } catch (e) {
    // Gérer les erreurs ici
    print(e.toString());
    Fluttertoast.showToast(msg: "Oups! Un probleme de connection à internet.");
  }
}