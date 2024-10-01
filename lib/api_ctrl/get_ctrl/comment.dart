

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hive/hive.dart';

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shimmer/shimmer.dart';

class Rcommentaire extends StatefulWidget {
  const Rcommentaire({super.key});

  @override
  _RcommentaireState createState() => _RcommentaireState();
}

class _RcommentaireState extends State<Rcommentaire> {
  List  _commemtaires = [];
  var Moncommentaire = Hive.box('userauth');
  var repondue = Hive.box('repply');


  @override
  void initState() {
    super.initState();
    _fetchProducts();
  }

  Future<void> _fetchProducts() async {
    // Remplacez l'URL par l'URL de votre API PHP

    try {
      var response = await http
          .post(Uri.parse('https://www.fe-store.pro/Get.php'),
          body: {
            "nom": 'commentaire',
          });

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _commemtaires = responseData.cast<Map<String, dynamic>>();
        });
      } else {
        // Gérer les erreurs
        print('Erreur de chargement des produits : ${response.statusCode}');
      }
    } catch (e) {
      // Gérer les erreurs ici
      print(e.toString());
      Fluttertoast.showToast(msg: "Erreur: Veiller reessayé plus tard");
    }
  }

  @override
  Widget build(BuildContext context) {
    return

      Container(
        padding: EdgeInsets.only(bottom: 100),
        child: _commemtaires.isNotEmpty ? ListView.builder(

          itemCount: _commemtaires.length,
          itemBuilder: (context, index) {
            final cmt = _commemtaires[index];
            return Container(

              margin: const EdgeInsets.all(10),
              child:Moncommentaire.get('utilisateurnom') == cmt['nom'] ?
                  //montext
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [

                  Container(
                    padding: const EdgeInsets.all(5),
                    margin: const EdgeInsets.only(left: 10 , top: 10),

                    width: MediaQuery.of(context).size.width/1.5,
                    decoration: BoxDecoration(
                        color: Colors.green.shade400,

                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(15),
                          topRight: Radius.circular(15),
                          bottomLeft: Radius.circular(15)
                          
                        )

                    ),
                    child:Text('${cmt['commentaire']}' , style: TextStyle(color: Colors.white),),
                  ),
                  SizedBox(


                    child:Center(child: Text('${cmt['date']}' , style: const TextStyle(color: Colors.white),)),
                  ),
                ],
              ) :
                  // leur text
              GestureDetector(
                onLongPress: (){

                  repondue.put('Rmessage', "Reponse à:(${cmt['nom']} )\n ${cmt['commentaire']}");
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('repondre à :${cmt['commentaire']}'),duration: Duration(seconds: 5),));
                },
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(

                      height: 30,
                      width: 80,

                      child:Center(child: Text('${cmt['nom']}' , style: const TextStyle(color: Colors.white, fontSize: 20),)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(5),
                      margin: const EdgeInsets.only(left: 10 , top: 10),

                      width: MediaQuery.of(context).size.width/ 1.5,
                      decoration: BoxDecoration(
                          color: Colors.blueGrey.shade900,

                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15)

                          )

                      ),
                      child:Text('${cmt['commentaire']}', style: TextStyle(color: Colors.white),),
                    ),
                    SizedBox(


                      child:Center(child: Text('${cmt['date']}' , style: const TextStyle(color: Colors.white),)),
                    ),
                  ],
                ),
              ),
            );
          },
        ) :


        Shimmer.fromColors(
            child: Column(
              children: [
                Container(

                  height: 80,
            padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 10 , top: 20),

          width: MediaQuery.of(context).size.width/1.5,
          decoration: BoxDecoration(
              color: Colors.green.shade400,

              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)))







                ),
                Container(

                  height: 100,
            padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(left: 10 , top: 20),

          width: MediaQuery.of(context).size.width/1.5,
          decoration: BoxDecoration(
              color: Colors.green.shade400,

              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)))







                ),
                Container(

                  height: 40,
            padding: const EdgeInsets.all(5),
          margin: const EdgeInsets.only(right: 60 , top: 20),

          width: MediaQuery.of(context).size.width/1.5,
          decoration: BoxDecoration(
              color: Colors.green.shade400,

              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                  bottomLeft: Radius.circular(15)))







                )
              ],
            ),
            baseColor: Colors.white12,
            highlightColor: Colors.black12),
      );

  }}
