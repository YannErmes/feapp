import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:fesneakers/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  bool start = false ;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      yann();
    });

  }

  Future<void> yann() async {
    await Future.delayed(
        const Duration(seconds: 4),
      () {
          print ('ok');
          setState(() {
            start = !start;
          });


      }


    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(alignment: AlignmentDirectional.topEnd, children: [
            Container(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: SizedBox(
                  height: 300,
                  child: Center(
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(

                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OblicImage(
                              'https://i.postimg.cc/HnNMDgny/b072b67e5756473d8de9f5a72d81a6af.jpg'),
                          OblicImage(
                              'https://i.postimg.cc/Jh8kWKrP/adc31364b898e3c30897b946ac5c175f.jpg'),
                          OblicImage(
                              'https://i.postimg.cc/YSthP9RP/3373879e3c932e3e7a8442bba7ee83eb.jpg'),
                          OblicImage(
                              'https://i.pinimg.com/564x/47/06/dd/4706dd9f077b207aca6942d54171463b.jpg'),
                          OblicImage(
                              'https://i.postimg.cc/R0CwHGkq/pexels-photo-2048547.jpg'),

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),


            // container 2 de la stack
            Container(
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                    Colors.black,
                    Colors.black54,
                    Colors.black38,
                  ])),
              alignment: AlignmentDirectional.bottomEnd,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  SizedBox(
                      height: 200,
                      width: 100,
                      child: LottieBuilder.network('https://lottie.host/ce695df7-40a6-4052-a545-a4b23b53dc7e/2W9Gg9cENN.json',fit: BoxFit.cover,)),


                  ElevatedButton(
                      style: const ButtonStyle(
                        backgroundColor: WidgetStatePropertyAll(Colors.black87)
                      ),
                      onPressed: (){
                    setState(() {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  const homepage(usernom: '', t: 1,)

                          ));
                    });

                  }, child: start ?const Text('Bienvenue sur le Store fé', style: TextStyle(color: Colors.white),):const LinearProgressIndicator()),



                  SizedBox(
                    height: 320,
                    child: Row(children: [
                      Expanded(
                          child: Image.network(
                              "https://i.postimg.cc/jdcRqPPx/fe2.png"))
                    ]),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

OblicImage(
  String image,
) {
  return Transform.rotate(
    angle: 1.96 * pi,
    child: Container(
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      height: 300,
      width: 110,
      child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            placeholder: (context, url) => const LinearProgressIndicator(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          )


      ),
    ),
  );
}
