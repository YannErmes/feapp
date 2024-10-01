import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class Garantie extends StatefulWidget {
  const Garantie({super.key});

  @override
  State<Garantie> createState() => _GarantieState();
}

class _GarantieState extends State<Garantie> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'NOS GARANTIES',
          style: TextStyle(color: Colors.green),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(color: Colors.green),
      ),
      body: SafeArea(
        child: Stack(
          children: [
            CachedNetworkImage(
              imageUrl:
              'https://images.pexels.com/photos/7228053/pexels-photo-7228053.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2',
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.4),
                              border: Border.all(width: 1, color: Colors.white),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Center(
                                  child: CachedNetworkImage(
                                    imageUrl:
                                    'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/t.png?alt=media&token=44b9e999-db2a-46a6-b8bf-47205c4540db',
                                    placeholder: (context, url) =>
                                    LoadingAnimationWidget.flickr(
                                      leftDotColor: Colors.brown.shade200,
                                      rightDotColor: Colors.black,
                                      size: 50,
                                    ),
                                    height: 200,
                                  ),
                                ),
                                const SizedBox(height: 20),
                                garantieText(
                                    'Pour tout article avec frais de livraison, la livraison devient gratuite en cas de non-respect du délai de livraison convenu.'),
                                const SizedBox(height: 10),
                                garantieText(
                                    'Pour tout article avec livraison gratuite, bénéficiez d\'une remise de 5% en cas de non-respect du délai de livraison convenu.'),
                                const SizedBox(height: 10),
                                garantieText(
                                    'Vous pouvez retourner le produit en cas de non-conformité de l\'article.Le lieu de retoure vous seras communiqué'),
                                const SizedBox(height: 10),
                                garantieText(
                                    'Si vous changez d\'avis, bénéficiez de la possibilité d\'échanger l\'article deux fois sur une période de 7 jours, si l\'article est toujours intact (état d\'origine).'),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget garantieText(String text) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Icon(
          Icons.offline_pin_rounded,
          color: Colors.green,
        ),
        const SizedBox(width: 8),
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
