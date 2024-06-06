import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;



class Categorie extends StatefulWidget {
  const Categorie({super.key});

  @override
  State<Categorie> createState() => _CategorieState();
}

class _CategorieState extends State<Categorie> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10, // Nombre d'éléments dans la liste
      itemBuilder: (BuildContext context, int index) {
        // Créer un carré horizontal pour chaque élément de la liste
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(25)),
          margin: const EdgeInsets.all(8.0),
          // Marge autour du carré
          width: 100,
          // Largeur du carré
          height: 100,
          // Hauteur du carré
          // Couleur du carré
          child: Center(
            child: Text(
              'Square $index', // Texte à l'intérieur du carré
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}









class rotacon extends StatefulWidget {
  const rotacon({super.key});

  @override
  State<rotacon> createState() => _rotaconState();
}

class _rotaconState extends State<rotacon> with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
        duration: const Duration(milliseconds: 30000), vsync: this);
    // TODO: implement initState
    _controller.repeat();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: _controller,
        builder: (_, child) {
          return Transform.rotate(
              angle: _controller.value * 2 * math.pi,
              child: Container(


                  decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(50)),
                  child: Image.network('https://i.postimg.cc/7YDHTGz5/Untitled-image-4.png')

              ));
        });
  }
}


class CategoriePro extends StatefulWidget {
  const CategoriePro({super.key});

  @override
  State<CategoriePro> createState() => _CategorieProState();
}

class _CategorieProState extends State<CategoriePro> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: 10, // Nombre d'éléments dans la liste
      itemBuilder: (BuildContext context, int index) {
        // Créer un carré horizontal pour chaque élément de la liste
        return Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.white),
              color: Colors.white.withOpacity(0.4),
              borderRadius: BorderRadius.circular(25)),
          margin: const EdgeInsets.all(8.0),
          // Marge autour du carré
          width: 180,
          // Largeur du carré
          height: 200,
          // Hauteur du carré
          // Couleur du carré
          child: Center(
            child: Text(
              'Square $index', // Texte à l'intérieur du carré
              style: const TextStyle(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}

class SliderP extends StatefulWidget {
  const SliderP({super.key});

  @override
  _SliderPState createState() => _SliderPState();
}

class _SliderPState extends State<SliderP> {
  Future<void> Refresh() async {
    return Future.delayed(const Duration(seconds: 2));
  }

  List<String> imageUrls = [
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2FUntitled%20image%20(2).jpeg?alt=media&token=f2c796c8-9856-4e70-8770-55c35eb44d36',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2FUntitled%20image%20(9).png?alt=media&token=7643e99c-cb9a-44a9-b5e1-a1b61712b32c',

    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2FUntitled%20image%20(15).png?alt=media&token=c0efeac4-b39d-4752-abb7-6942c64255f7',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2Fpexels-photo-9660950.jpeg?alt=media&token=3dafb9af-883f-47ab-9cc5-d54ae337be69',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2Fpexels-photo-4219175.jpeg?alt=media&token=4ce04753-a8df-4308-a2a4-1cc92fbc130c',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2FUntitled%20image%20(3).png?alt=media&token=9d871d86-bac4-4e3c-97c7-0e0305a898de',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2Fpexels-photo-3927389.webp?alt=media&token=8093e76d-2f83-4ccc-b6d9-aeb05e12560e',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2FUntitled%20image%20(3).jpeg?alt=media&token=64aadb13-659f-4c23-9f52-105240253c53',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2FUntitled%20image%20(6).png?alt=media&token=bcb4aabe-46ce-4cde-b007-81d97a934737',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2Fpexels-photo-3775575.jpeg?alt=media&token=28836663-a282-4f89-b0d7-16eaecf78070',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2Fpeople-spending-time-together-outside.jpg?alt=media&token=3130c09d-ca63-409e-b212-291be270a54a',
    'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1440&dpr=2',

    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2Facc1.png?alt=media&token=3c1ac974-4f87-41e0-af4b-55d0526c4b29',
   'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2FUntitled%20image%20(4).jpeg?alt=media&token=09500efe-07ca-4d43-bf3f-dc546e260515',


    // Add more image URLs as needed
  ];

  // Construisez vos propres rêves, ou quelqu’un d’autre va vous embaucher pour construire le sien.


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 240,
        aspectRatio: 9/10, // You can adjust the aspect ratio as needed
        autoPlay: true,
        autoPlayInterval: const Duration(seconds: 4), // Adjust the interval as needed
        enlargeCenterPage: true,
      ),
      items: imageUrls.map((url) {

        return Builder(
          builder: (BuildContext context) {

            return Container(

              width: MediaQuery.of(context).size.width,
              height: double.infinity,
             // width: 210,
             // margin: const EdgeInsets.symmetric(horizontal: 3.0),
              decoration:  const BoxDecoration(
               // image: DecorationImage(image: NetworkImage(url),fit: BoxFit.cover,)

              ),
              child: CachedNetworkImage(
                imageUrl: url,
                fit: BoxFit.cover,
                placeholder: (context, url) => const LinearProgressIndicator(),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),

            );
          },
        );
      }).toList(),
    );
  }
}



// CachedNetworkImage(
//                       imageUrl: url,
//
//
//                       placeholder: (context, url) => CircularProgressIndicator(),
//                       errorWidget: (context, url, error) => Icon(Icons.error),
//                     ),