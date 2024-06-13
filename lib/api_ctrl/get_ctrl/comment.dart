

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;

class Rcommentaire extends StatefulWidget {
  const Rcommentaire({super.key});

  @override
  _RcommentaireState createState() => _RcommentaireState();
}

class _RcommentaireState extends State<Rcommentaire> {
  List  _products = [];

  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    // Remplacez l'URL par l'URL de votre API PHP

    try {
      var response = await http
          .post(Uri.parse('http://nanisneakers.000webhostapp.com/Get.php'),
          body: {
            "nom": 'commentaire',
          });

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _products = responseData.cast<Map<String, dynamic>>();
        });
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





  @override
  Widget build(BuildContext context) {
    return

      ListView.builder(
        itemCount: _products.length,
        itemBuilder: (context, index) {
          final cmt = _products[index];
          return Container(
            margin: const EdgeInsets.all(10),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(

                  height: 30,
                  width: 80,

                  child:Center(child: Text('${cmt['nom']}' , style: const TextStyle(color: Colors.white),)),
                ),
                Container(
                  padding: const EdgeInsets.all(5),
                  margin: const EdgeInsets.only(left: 10 , top: 10),
                  height: 180,
                  width: 200,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.8),
                      border: Border.all(color: Colors.white),
                      borderRadius: BorderRadius.circular(15)

                  ),
                  child:Text('${cmt['commentaire']}'),
                ),
                SizedBox(


                  child:Center(child: Text('${cmt['date']}' , style: const TextStyle(color: Colors.white),)),
                ),
              ],
            ),
          );
        },
      );

  }}
