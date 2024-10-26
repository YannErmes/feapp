import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fesneakers/api_ctrl/annexapis.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import 'package:hive/hive.dart';
import 'package:http/http.dart' as https;
import 'package:loading_animation_widget/loading_animation_widget.dart';

import 'Credit.dart';

class ShoppingCartPage extends StatefulWidget {
  const ShoppingCartPage({super.key});

  @override
  State<ShoppingCartPage> createState() => _ShoppingCartPageState();
}

class _ShoppingCartPageState extends State<ShoppingCartPage> {
  List<dynamic> Monpanier = [];

  final card = Hive.box('userauth');
  card_ctrl deletcard = Get.put(card_ctrl());
  int reduction = 3 ;
  String messagedereduction = "Oups !ce code n'est plus valide";
  TextEditingController _codepro = TextEditingController();
  bool loadpromot = false ;


  @override
  void initState() {
    super.initState();
    showpanier(card.get('utilisateurmail') ?? '');

  }

 Future<void> checkcodepromot(String code) async{

    var Url = 'https://www.fe-store.pro/check_codepromot.php';
    final response = await https.post(Uri.parse(Url),
    body: {
      'code_valeur':'$code'
    });

    if ( response.statusCode == 200){
      var    resultat = json.decode(response.body);
      List<dynamic> verif = resultat['reponse'];

      if (verif.isEmpty) {
        setState(() {
          loadpromot = false ;
        });
        Get.snackbar('Oops', 'Ce code est surement expiré ou surgagé veillez réessayer plus tard', backgroundColor: Colors.red.withOpacity(0.3) );


      }else{

        reduction = resultat['reponse'][0]['pourcentage'];
        messagedereduction = resultat['reponse'][0]['offre'];
        //print(reduction);
        print(resultat['reponse'][0]);
        Get.snackbar('WOW', '$messagedereduction' , backgroundColor: Colors.green.withOpacity(0.2));

        setState(() {
          loadpromot = false ;
        });

       }
    }else {
      Get.snackbar('Oups!', 'Veillez jettez un coup d\'oeil a votre connection');
    }



  }

  Future<void> showpanier(String userid) async {
    const url = 'https://www.fe-store.pro/Get_card.php';
    final response = await https.post(Uri.parse(url), body: {'userpass': userid});

    if (response.statusCode == 200) {
      final resbody = jsonDecode(response.body);
      if (resbody['success'] == true) {
        setState(() {
          Monpanier = resbody['todos'];
        });
      } else {
        // Handle error message
        setState(() {
          Monpanier = [];
        });
      }
    } else {
      // Handle network error
      setState(() {
        Monpanier = [];
      });
    }
  }
  calcul (){
    double TT = 0 ;
    double nonTT = 0;
    for( var item in Monpanier){
      double prix = double.tryParse(item['prix']) ?? 0;
      int quantite = int.tryParse(item['quantite']) ?? 1;
      TT =  ((prix -(prix *(reduction/100))) * quantite) + TT;

    }

    return TT ;

  }
  calculoff (){
    double TT = 0 ;
    double nonTT = 0;
    for( var item in Monpanier){
      double prix = double.tryParse(item['prix']) ?? 0;
      int quantite = int.tryParse(item['quantite']) ?? 1;
      TT =  ((prix -(prix *reduction/100)) * quantite) + TT;
      nonTT = prix *quantite +nonTT;
    }

    return nonTT ;

  }



  Widget buildCartItem(int index) {
    final element = Monpanier[index];
    int vall = int.parse(element['quantite']);
    double? realtimeprice = double.parse(element['prix']);

    return GestureDetector(

      child: Container(
        height: 210,
        child: Card(
          margin: EdgeInsets.all(10),
          child: Row(
            children: [
              CachedNetworkImage(
                imageUrl: '${element['image']}',
                height: 190,
                width: 100,
                errorWidget: (context, url, error) => Icon(Icons.image_not_supported_rounded),
              ),
              SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      element['nom'],
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'CFA ${realtimeprice}',
                      style: TextStyle(
                          decoration: TextDecoration.lineThrough,
                          color: Colors.redAccent.shade100,
                          fontSize: 15
                      ),
                    ),
                    Text('CFA${realtimeprice -(realtimeprice * (reduction/100))}fcfa' ,style: TextStyle(fontSize: 18),),
                    Container(
                      width: 130,
                      height: 35,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            icon: Icon(Icons.remove),
                            onPressed: () {
                              if (vall > 1) {
                                setState(() {
                                  vall--;
                                  element['quantite'] = vall.toString();
                                });
                              }
                            },
                          ),
                          Text("${element['quantite']}"),
                          IconButton(
                            icon: Icon(Icons.add),
                            onPressed: () {
                              setState(() {
                                vall++;
                                element['quantite'] = vall.toString();

                              });
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  // Handle deletion
                  setState(() {
                    deletcard.delete_panier(card.get('utilisateurmail'),element['eid'], context);
                    Monpanier.removeAt(index);
                    print(card.get('utilisateurmail'));
                    print(element['quantite']);
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        title: Text('Panier d\'achat'),
      ),
      body: Monpanier.isEmpty
          ? Center(
            child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

            LoadingAnimationWidget.bouncingBall(color: Colors.yellow, size: 100),
            CachedNetworkImage(imageUrl: 'https://i.postimg.cc/Y0pZW9hn/logo-4.png',height: 200,).animate().scale(curve:Curves.easeInOutExpo, duration: Duration(seconds: 2))
                .slide().shader(duration: Duration(seconds: 100)),
                    ],
                  ),
          )
          : Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: Monpanier.length,
              itemBuilder: (context, index) => buildCartItem(index),
            ),
          ),
          Divider(height: 2),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text('Réductions:', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 16), ),
                    Text('Sous-total :', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20), ),
                  ],
                ),
                Column(
                  children: [
                    Text('CFA ${calculoff().toStringAsFixed(2)}', style: TextStyle(color: Colors.redAccent,fontWeight: FontWeight.bold , fontSize: 17,
                        decoration: TextDecoration.lineThrough)),
                    Text('CFA ${calcul().toStringAsFixed(2)} fcfa', style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold , fontSize: 20),),

                  ],
                ),
              ],
            ),
          ),
          //code promote
          Container(
            height: 60,
            color: Colors.brown.shade50,
            child: TextField(
              controller: _codepro,
              decoration: InputDecoration(
                  labelText: 'code promot',

              ),

            ),
          ),
          SizedBox(height: 10),
          MaterialButton(onPressed:(){

            if(_codepro.text.isNotEmpty)
            setState(() {
              checkcodepromot('${_codepro.text}');
              loadpromot = true ;
            });

          },child: loadpromot ? LoadingAnimationWidget.dotsTriangle(color: Colors.redAccent, size: 20):Text('Valider mon code') ,),


          // passage a la caise
          ElevatedButton(
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(Colors.black87),
              elevation: WidgetStatePropertyAll(50),


            ),
            onPressed: () {
              // Handle checkout



              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return CheckoutPage(chekall: Monpanier, ttprix: calcul().toStringAsFixed(2), offprix: calculoff().toStringAsFixed(2),);
              },));
            },
            child: Text('VALIDER MON PANIER 👉', style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),

          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
