import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fesneakers/api_ctrl/add_ctrl/card.dart';
import 'package:fesneakers/pages/Credit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class Description extends StatelessWidget {
  final String image1;
  final String image2;
  final String image3;
  final String prix;
  final String nom;
  final String description;
  final String quantite;
  final String eid;
  final String? useremail;

  const Description(
      {super.key,
      required this.image1,
      required this.image2,
      required this.image3,
      required this.prix,
      required this.nom,
      required this.description,
      required this.quantite,
      required this.eid,
     // required this.pass,
      required this.useremail,
     });

  @override
  Widget build(BuildContext context) {
    double h =  MediaQuery.of(context).size.height;
    double w =  MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: IconButton(
        hoverColor: Colors.white,
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black87)),
        onPressed: () {
          Navigator.pop(context);
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Colors.white,
        ),
      ),
      backgroundColor: const Color(0xFFE5D6C8),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Stack(
                children: [
                  // image de fond


                  // premier column des element
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 120,
                        ),

                        // nom et taill prix comment et autre

                        Container(
                          decoration: BoxDecoration(

                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(15)),
                          height: 280,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // row de nom est prix
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // nom du produit

                                    Text(
                                      nom,
                                      style: const TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    // container de prix
                                    Container(
                                        height: 30,
                                        width: 60,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(5),
                                            color: Colors.black),
                                        child: Center(
                                            child: Text(
                                          '$prix f',
                                          style: const TextStyle(
                                              color: Colors.green),
                                        )))
                                  ],
                                ),

                                // la row du nombre en stock est du commentaie
                                Row(
                                  children: [
                                    Text(
                                      'Nombre en stock [$quantite]',
                                      style: const TextStyle(
                                          color: Colors.redAccent),
                                    ),
                                  ],
                                ),

                                const SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),

                        // desciption
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Container(
                            height: 200,
                            width: 355,
                            decoration: BoxDecoration(
                                image: const DecorationImage(
                                    image: NetworkImage(
                                        'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Untitled-image-2.png?alt=media&token=692ef897-56f6-4db6-94bb-3d5558bbe9bb'),
                                    fit: BoxFit.cover),

                                border:
                                    Border.all(color: Colors.black12, width: 2),
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.white.withOpacity(0.6)),

                            // scrol view de la description
                            child: SingleChildScrollView(
                              scrollDirection: Axis.vertical,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    'Description',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black87),
                                  ),
                                  Text(
                                    description,
                                    style:
                                        const TextStyle(color: Colors.black87),
                                    softWrap: true,
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),

                        //
                        //
                        //            boutton de base commade et ajoute au panier
                        Container(
                          height: 40,
                          width: 355,

                          // row des boutton de base
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton.icon(
                                  onPressed: () {
                                    Add_card(image1, nom, eid, useremail ?? 'fé');
                                  },
                                  icon: const Icon(
                                    Icons.add_shopping_cart,
                                    color: Colors.black,
                                  ),
                                  label: const Text(
                                    'Ajouté',
                                    style: TextStyle(color: Colors.black),
                                  )),
                              const SizedBox(
                                width: 4,
                              ),
                              Animate(
                                effects: [FadeEffect(), SlideEffect()],
                                child: ElevatedButton.icon(
                                    style: const ButtonStyle(
                                        backgroundColor:
                                            WidgetStatePropertyAll(Colors.black)),
                                    onPressed: () {
                                      Navigator.push(
                                          context,PageRouteBuilder(pageBuilder:
                                          (context, animation, anotheranimation) =>Credit(
                                              prix: prix,
                                              image: image1,
                                              code: eid,
                                              nom: nom),
                                        transitionDuration: Duration(seconds: 1),
                                        reverseTransitionDuration: Duration(seconds:1),
                                        transitionsBuilder: (context, animation , anotheranimation , child){
                                            animation = CurvedAnimation(parent:animation, curve:Curves.fastOutSlowIn,
                                            reverseCurve: Curves.fastOutSlowIn);
                                            return Align(
                                              alignment: Alignment.bottomCenter,
                                              child: SizeTransition(
                                                sizeFactor: animation,
                                                axisAlignment: 0,
                                                child: Credit(
                                                    prix: prix,
                                                    image: image1,
                                                    code: eid,
                                                    nom: nom),
                                              ),

                                            );
                                        }

                                      ) ,
                                      );
                                      },
                                    /*(
                                            builder: (context) => */
                                    icon: const Icon(
                                      Icons.shopify,
                                      color: Colors.white,
                                    ),
                                    label: const Text(
                                      'Commander',
                                      style: TextStyle(color: Colors.white),
                                    )),
                              ).animate().shader(duration: Duration(seconds: 5)),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),









                  // deuxieme couche
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),

                        // containare des images produit
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(5, 5),
                                  color: Colors.black,
                                  blurRadius: 15,
                                  spreadRadius: 3),
                              BoxShadow(
                                  offset: Offset(-5, -5),
                                  color: Colors.white,
                                  blurRadius: 15,
                                  spreadRadius: 3),
                            ],
                            image: const DecorationImage(
                                image: NetworkImage(
                                 // 'https://i.postimg.cc/g099JZcT/419f1ee36d887a65dc7268ddd3b42bec.jpg'
                                    'https://i.postimg.cc/7LwYtdv9/1d8a884dec3992018cd6b5807e6966c5.jpg'
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(30),

                          ),
                          height: 280,
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    height: 280,
                                    width: 247,
                                    child: Transform.rotate(
                                      angle: 6,
                                      child: Center(
                                        child: descimage(image1,context),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 280,
                                    width: 260,
                                    child: descimage(image2 ,context),
                                  ),
                                  SizedBox(
                                    height: 280,
                                    width: 260,
                                    child: descimage(image3 , context),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }





}
Widget descimage(String image, BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(

            content: CachedNetworkImage(imageUrl: image,),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Ferme le dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    },
    child: CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.cover,
      placeholder: (context, url) => CircularProgressIndicator(),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}