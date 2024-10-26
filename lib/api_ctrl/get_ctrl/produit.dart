import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:hive/hive.dart';



// ancienc produit card
class Produit extends StatelessWidget {
  final String image;
  final String nom;
  final String prix;
  final String Code;
  const Produit({super.key, required this.image, required this.nom, required this.prix, required this.Code});




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
          CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_rounded),
          ),

          //prix et nom ......
          Expanded(

            child: ClipRRect(
              borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),
                  bottomRight: Radius.circular(15)),
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.black12,
                      borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),
                          bottomRight: Radius.circular(15))
                  ),

                  padding: const EdgeInsets.symmetric(horizontal: 5),



                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                        child: Text( nom ,
                          style:
                          const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black),),
                      ),
                      Row(

                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Code:$Code'),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [



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
                    ],
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );



  }
}



class Product {
  final String name;
  final String imageUrl1;
  final String imageUrl2;
  final String imageUrl3;
  final String price;
  final String Description ;

  Product( {required this.name, required this.imageUrl1, required this.imageUrl2, required this.imageUrl3, required this.price,required this.Description});
}



class Products extends StatefulWidget {
  final Map<dynamic, dynamic> product;
  const Products({super.key, required this.product});

  @override
  State<Products> createState() => _ProductsState();
}

class _ProductsState extends State<Products> {



  var liked = Hive.box('like');
  @override
  Widget build(BuildContext context) {
    return GestureDetector(



        child:Container(

          decoration: BoxDecoration(
              boxShadow:const [BoxShadow(
                blurRadius: 15,
              )],
              color: Colors.white,
              borderRadius: BorderRadius.circular(15)
          ),
          child: Column(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: CachedNetworkImage(
                  imageUrl: widget.product['image1'],
                  height: 155,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  placeholder: (context, url) =>  Image.network("https://i.postimg.cc/sDGVRgq2/Untitled_image_(2).png", height: 11,).animate().shake(duration: Duration(seconds: 100), curve: ElasticInCurve()),
                  errorWidget: (context, url, error) => const Icon(Icons.image_not_supported_rounded),
                ),
              ),

              //prix et nom ......
              Expanded(

                child: ClipRRect(
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15)),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaY: 10, sigmaX: 10),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(15),
                              bottomRight: Radius.circular(15))
                      ),

                      padding: const EdgeInsets.symmetric(horizontal: 5),



                      child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text( widget.product['nom'] ,
                            style:
                            const TextStyle(fontWeight: FontWeight.bold, fontSize: 15,color: Colors.black,overflow: TextOverflow.ellipsis),maxLines: 1,overflow: TextOverflow.ellipsis,),
                          Row(

                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  // le prix
                                  Container(
                                    width: 110,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    child: Center(
                                      child: Text('CFA ${widget.product['prix']}', style: const TextStyle(
                                          color: Colors.black ,fontSize: 18
                                      ),),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          int.tryParse(widget.product['eid']) != null && int.parse(widget.product['eid']) > 100
                              ? Text("Livaison gratuite", style: TextStyle(color: Colors.green),) :Text('Livraison: ${widget.product['eid']}0f',style: TextStyle(color: Colors.green))
,
                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(1),
                                child: IconButton(icon :

                                liked.get("${widget.product['nom']}") == 'liked' ? Icon(Icons.favorite, color: Colors.red,):
                                Icon(Icons.favorite_border),

                                  onPressed: (){

                                    setState(() {
                                      if( liked.get("${widget.product['nom']}") == 'liked')
                                      {
                                        liked.put('${widget.product['nom']}', 'unliked');
                                      }else{
                                        liked.put('${widget.product['nom']}', 'liked');
                                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Liker'),backgroundColor: Colors.red.shade200,));

                                      }

                                    });

                                  },),),
                              Text('${double.tryParse(widget.product['eid'])!*0.5}k')
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
    );
  }
  }