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
    'https://i.postimg.cc/L61HyfdH/Untitled-image-8.jpg',
    'https://i.postimg.cc/NfGbg844/Untitled-image-6.jpg',

    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2FUntitled%20image%20(9).png?alt=media&token=7643e99c-cb9a-44a9-b5e1-a1b61712b32c',
    'https://i.postimg.cc/8PKhb2S8/Untitled-image-7.jpg',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2FUntitled%20image%20(15).png?alt=media&token=c0efeac4-b39d-4752-abb7-6942c64255f7',
'https://i.postimg.cc/bvPVL5D8/Untitled-image-11.jpg',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2Fpexels-photo-4219175.jpeg?alt=media&token=4ce04753-a8df-4308-a2a4-1cc92fbc130c',
'https://i.postimg.cc/3xN2hCsp/Untitled-image-12.jpg',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2Fpexels-photo-3927389.webp?alt=media&token=8093e76d-2f83-4ccc-b6d9-aeb05e12560e',
'https://i.postimg.cc/L61HyfdH/Untitled-image-8.jpg',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2FUntitled%20image%20(6).png?alt=media&token=bcb4aabe-46ce-4cde-b007-81d97a934737',
'https://i.postimg.cc/gj87kb1w/Untitled-image-9.jpg',
    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2Fpeople-spending-time-together-outside.jpg?alt=media&token=3130c09d-ca63-409e-b212-291be270a54a',
    'https://images.pexels.com/photos/2529148/pexels-photo-2529148.jpeg?auto=compress&cs=tinysrgb&w=1440&dpr=2',
'https://i.postimg.cc/Njm0qKNY/Untitled-image-10.jpg',
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