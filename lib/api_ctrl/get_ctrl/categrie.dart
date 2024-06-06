import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';










List<Map<String, dynamic>> _categorie = [];
Future<void> _fetchcategorie() async {
  // Remplacez l'URL par l'URL de votre API PHP

  try {
    var response = await http
        .post(Uri.parse('https://nanisneakers.000webhostapp.com/Get.php'),
        body: {
          "nom": 'categorie',
        });

    if (response.statusCode == 200) {
      final List<dynamic> responseData = json.decode(response.body);
      _categorie = responseData.cast<Map<String, dynamic>>();


    } else {
      // Gérer les erreurs
      print('Erreur de chargement des produits : ${response.statusCode}');
    }
  } catch (e) {
    // Gérer les erreurs ici
    print(e.toString());
    Fluttertoast.showToast(msg: "Erreurrrrrrrrrr: $e");
  }
}





Widget  print_cat () {
  return SizedBox(
    height: 1001,
    child: Column(
      children: [
        const ElevatedButton(onPressed: _fetchcategorie, child: Text('ok')),
        SizedBox(
          height: 999,
          child: ListView.builder(


            scrollDirection: Axis.vertical,
            itemCount: _categorie.length,
            itemBuilder: (context, index) {
              final cat = _categorie[index];
              return GestureDetector(
                onTap: (){

                },
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: const Color(0xFFC09E5D), width: 2),
                      color: Colors.white.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(60)),
                  margin: const EdgeInsets.all(8.0),
                  // Marge autour du carré
                  width: 80,
                  // Largeur du carré
                  height: 80,
                  // Hauteur du carré
                  // Couleur du carré
                  child: Column(
                    children: [
                      Transform.rotate(
                        angle: -0.10 * pi,
                        child: Container(
                          child: Image.network('${cat['']}'),
                        ),
                      ),
                      Text('${cat['nom']}')
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    ),
  );
}






