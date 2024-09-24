import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../api_ctrl/annexapis.dart';

class CheckoutPage extends StatefulWidget {
  final List<dynamic> chekall;

  final String ttprix;

  final String offprix;

  const CheckoutPage(
      {super.key,
        required this.chekall,
        required this.ttprix,
        required this.offprix});

  @override
  State<CheckoutPage> createState() => _CheckoutPageState();
}

class _CheckoutPageState extends State<CheckoutPage> {
  @override
  int quantite = 1;
  card_ctrl send = Get.put(card_ctrl());
  double prix_final = 1;
  TextEditingController num_ctrl = TextEditingController();
  TextEditingController nom_ctrl = TextEditingController();
  TextEditingController adresse_ctrl = TextEditingController();
  TextEditingController commentair_ctrl = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget buildCartItem(int index) {
    final element = widget.chekall[index];
    int vall = int.parse(element['quantite']);
    double? realtimeprice = double.parse(element['prix']);

    return Container(
      height: 100,
      child: Card(
        margin: EdgeInsets.all(10),
        child: Row(
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: '${element['image']}',
                  height: 100,
                  errorWidget: (context, url, error) =>
                      Icon(Icons.image_not_supported_rounded),
                ),
                Positioned(
                    child: CircleAvatar(
                      radius: 10,
                      backgroundColor: Colors.brown.shade200,
                      child: Text('${element['quantite']}'),
                    ))
              ],
            ),
            SizedBox(width: 20),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    element['nom'],
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${realtimeprice} fcfa',
                    style: TextStyle(
                      decoration: TextDecoration.lineThrough,
                      color: Colors.grey,
                    ),
                  ),
                  Text('  ${realtimeprice - (realtimeprice * 0.15)}fcfa' , style: TextStyle(fontSize: 18),),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget build(BuildContext context) {
    double offprice = double.parse(widget.ttprix);
    return Scaffold(
      appBar: AppBar(
        title: Text('Checkout'),
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.arrow_back, color: Colors.black),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // resume

                  ExpansionTile(
                    collapsedBackgroundColor: Colors.black12,
                    title: Txt('Résumé de la commande', 15, FontWeight.normal,
                        Colors.black),
                    trailing: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            '${widget.offprix} fcfa',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey,
                                decoration: TextDecoration.lineThrough),
                          ),
                          Txt('${widget.ttprix} fcfa', 17, FontWeight.bold,
                              Colors.black),
                        ]),
                    children: [
                      Container(
                        height: 300,
                        child: ListView.builder(
                          itemCount: widget.chekall.length,
                          itemBuilder: (context, index) {
                            return buildCartItem(index);
                          },
                        ),
                      )
                    ],
                  ),
                  // Sélection de la quantité

                  SizedBox(height: 16),
                  MaterialButton(
                    color: Colors.yellowAccent.shade200,
                    onPressed: () {
                      showModalBottomSheet(
                        isScrollControlled: true,
                        backgroundColor: Colors.transparent,
                        context: context,
                        sheetAnimationStyle: AnimationStyle(
                            curve: ElasticInCurve(),
                            duration: Duration(seconds: 1)),
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                                "Nous regrettons de vous informer que cette option de"
                                    " paiement n'est pas prise en charge dans votre pays."
                                    " Nous vous invitons à sélectionner l\'une des alternatives "
                                    "disponibles en bas de la page pour finaliser votre commande."),
                            actions: [
                              TextButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                  },
                                  child: Text('Je comprends'))
                            ],
                          );
                        },
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: CachedNetworkImage(
                        imageUrl: 'https://i.postimg.cc/WzdG285F/Untitled-image.png',
                        height: 40,errorWidget: (context, url, error) =>  Image.asset('/pay.png',height: 50,),
                        placeholder: (context, url) =>  Image.asset('/pay.png',height: 50,) ,
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 15,
                  ),

                  // row pour le OU
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                      Txt('Ou', 15, FontWeight.normal, Colors.black),
                      Expanded(
                        child: Container(
                          height: 1,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 20,
                  )

                  // container info
                  ,
                  Container(
                    color: Colors.black12,
                    child: Txt(
                        "VEUILLEZ NOTER : Aucun paiement ne sera débité de votre"
                            " compte. Vos informations sont collectées de manière sécurisée"
                            " afin de confirmer votre commande. Nous vous enverrons"
                            " une confirmation via WhatsApp ainsi que votre numéro de commande"
                            " pour finaliser l'expédition."
                            " Vous aurez alors la possibilité de régler l'intégralité"
                            "avant l'envoi ou d'opter pour un paiement en deux temps : "
                            "la moitié avant expédition et le solde après validation "
                            "de la réception.",
                        15,
                        FontWeight.normal,
                        Colors.black),
                  ),

                  SizedBox(
                    height: 20,
                  )

                  // Champ de texte : Nom et Prénom
                  ,
                  TextField(
                    controller: nom_ctrl,
                    decoration: InputDecoration(
                      labelText: 'Nom et Prénom *',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Champ de texte : Numéro de Téléphone
                  TextField(
                    controller: num_ctrl,
                    decoration: InputDecoration(
                      labelText: 'Numéro de Téléphone Fonctionnel *',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  SizedBox(height: 16),
                  // Champ de texte : Lieu de Livraison
                  TextField(
                    controller: adresse_ctrl,
                    decoration: InputDecoration(
                      labelText: 'Lieu ou adresse de Livraison *',
                      prefixIcon: Icon(Icons.location_on),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),
                  // Champ de texte : Heure de Livraison
                  TextField(
                    controller: commentair_ctrl
                    ,
                    decoration: InputDecoration(
                      labelText: 'Un petit commentaire ou une indication *',
                      prefixIcon: Icon(Icons.comment),
                      border: OutlineInputBorder(),
                    ),
                  ),
                  SizedBox(height: 16),

                  SizedBox(height: 16),
                  // Sous-total et Total

                  SizedBox(height: 32),
                  // Bouton de confirmation

                  MaterialButton(
                    padding: EdgeInsets.all(15),
                    color: Colors.black,
                    onPressed: () {
                      if (nom_ctrl.text.isEmpty ||
                          adresse_ctrl.text.isEmpty ||
                          commentair_ctrl.text.isEmpty ||
                          num_ctrl.text.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red.shade300,
                            content:
                            Text('"*" indique ce champs est obligatoir')));
                      } else {
                        send.envoiecommande(
                            '${nom_ctrl.text}',
                            '${adresse_ctrl.text}',
                            '${commentair_ctrl.text}',
                            '${nom_ctrl.text}',
                            widget.chekall,
                            context) ;


                      }
                    },
                    child: Txt('Finaliser ma commande', 18, FontWeight.bold,
                        Colors.white),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),

          ],
        ),
      ),
    );
  }

  Champs() {}

  Txt(String txt, double sze, var bld, var clr) {
    return Text(
      txt,
      style: TextStyle(
        fontSize: sze,
        fontWeight: bld,
        color: clr ?? Colors.white,
      ),
    );
  }
}
