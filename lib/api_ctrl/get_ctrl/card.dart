import 'dart:convert';
import 'package:fesneakers/pages/Credit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';



class ListCard extends StatefulWidget {
  final String userpass;

  const ListCard({super.key, required this.userpass});

  @override
  State<ListCard> createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  late PageController pageController;
  double _currentPage = 0;
  List<Map<String, dynamic>> cards = [];


  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0);
    pageController.addListener(() {
      setState(() {
        _currentPage = pageController.page!;
      });
    });
    _fetchcards();

  }

  Future<void> _fetchcards() async {
    try {
      var response = await http.post(
        Uri.parse('https://www.fe-store.pro/Get_card.php'),
        body: {"nom": 'card', "userpass": widget.userpass},
      );

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          cards = responseData.cast<Map<String, dynamic>>().map((card) {
            // Ajoutez une clé 'deleteMode' à chaque carte
            return {...card, 'deleteMode': false};
          }).toList();
        });
      } else {
        Get.defaultDialog(
            title:
            'Oups! chargement de votre panier depuis le local sécurisé essayez de redémmaré l\'application dans 50 seconde 😉',
            titleStyle: const TextStyle(fontSize: 15),
            content: SizedBox(
                height: 30,
                child: LottieBuilder.network(
                    'https://lottie.host/7586c362-df43-4a53-be74-7ba3da4297cf/Y0ZkJP3d4R.json')));
        print('Erreur de chargement des produits : ${response.statusCode}');
      }
    } catch (e) {
      print(e.toString());

      Get.defaultDialog(
          title: 'Oups! la connection à internet a été interrompue 😥 !',
          titleStyle: const TextStyle(fontSize: 15),
          content: const SizedBox(height: 30, child: Icon(Icons.wifi_off)));
    }
  }

  Future<void> _delCard(String eid, String userpass) async {
    try {
      var response = await http.post(
        Uri.parse('https://www.fe-store.pro/delet_card.php'),
        body: {
          "userpass": userpass,
          "eid": eid,
        },
      );
      Fluttertoast.showToast(msg: 'Supprimer...')
      ;
    } catch (e) {
      print(e.toString());
      Fluttertoast.showToast(msg: "Verifié votre connection a internet");
    }
  }



  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        children: [

          Text('${cards.length}',style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold

          ),),
          Container(
           height: 450,
            child: ListView.builder(
              itemCount: cards.length,
              itemBuilder: (context, index) {
                final card = cards[index];
                bool deleteMode = card['deleteMode'] ?? false;

                return  AnimationConfiguration.staggeredList(
                  position: index,
                  duration: const Duration(milliseconds: 375),
                  child: SlideAnimation(
                    verticalOffset: 50.0,
                    child: SlideAnimation(

                      child: Column(
                        children: [
                          Container(
                            height: 100,

                            margin: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(color: Colors.white),
                            ),
                            child: ListTile(
                              hoverColor: Colors.black38,
                              mouseCursor: MouseCursor.uncontrolled,
                              leading:CircleAvatar(
                                radius: 50,
                                child:  Image.network(
                                  '${card['image']}',
                                  fit: BoxFit.cover,
                                ),
                              ),

                              title: Text('${card['nom']}', style: const TextStyle(color: Colors.black87),),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(' Code: ${card['eid']}' , style: const TextStyle(color: Colors.black87),),
                                  Text('Status : ${card['status']}')
                                ],
                              ),
                              trailing: GestureDetector(
                                onTap: () {
                                  setState(() {
                                    // Basculez le mode de suppression

                                    // Supprimez la carte si le mode de suppression est activé
                                    if (card['deleteMode'] = true) {
                                      setState(() {
                                        _delCard('${card['eid']}' , '${card['userpass']}');
                                      });
                                    }else {
                                      return ;
                                    }
                                  });
                                },
                                child: deleteMode
                                    ? const Icon(CupertinoIcons.xmark_square, color: Colors.red)
                                    : const Icon(CupertinoIcons.delete , color: Colors.black87,),
                              ),

                            ),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => Credit( prix: '${card['prix']}' , image: '${card['image']}', code: '${card['eid']}', nom: '${card['nom']}'),));
                            },
                            icon: const Icon(
                              Icons.shopify,
                              size: 30,
                              color: Colors.green,
                            ),
                            label: const Text('Commander'),
                          ),

                        ],
                      ),
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
}

