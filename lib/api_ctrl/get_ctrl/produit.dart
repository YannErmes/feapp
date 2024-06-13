import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';



class Produits extends StatelessWidget {
  final String image;
  final String nom;
  final String prix;
  final String Code;
  const Produits({super.key, required this.image, required this.nom, required this.prix, required this.Code});




  @override
  Widget build(BuildContext context) {
    return Container(


        decoration: BoxDecoration(

            boxShadow:const [BoxShadow(
                color: Colors.black38,
                blurRadius: 40,

            )

            ],

            color: Colors.white,
            borderRadius: BorderRadius.circular(15)
        ),





     child: Column(
          children: [
            Container(
              // images de produit


                child: ClipRRect(
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(15),
                        topRight: Radius.circular(15))
                    , child: CachedNetworkImage(
                    imageUrl: image,
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const CircularProgressIndicator(),
                    errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_rounded),
                  ))),

            //prix et nom ......
            Expanded(

              child: Container(
                decoration: const BoxDecoration(
                    color: Colors.black12,
                    borderRadius: BorderRadius.only(bottomLeft: Radius.circular(15),
                        bottomRight: Radius.circular(15))
                ),
              
                padding: const EdgeInsets.symmetric(horizontal: 5),
              

              
                child:  Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Code: $Code'),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text( nom ,
                          style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black),),
              
              
                        // le prix
                        Container(
                          width: 52,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: Center(
                            child: Text('$prix f', style: const TextStyle(
                                color: Colors.green
                            ),),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );



  }
}
