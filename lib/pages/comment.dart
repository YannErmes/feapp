import 'package:cached_network_image/cached_network_image.dart';
import 'package:fesneakers/api_ctrl/add_ctrl/comment.dart';
import 'package:fesneakers/api_ctrl/get_ctrl/comment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Commentaire extends StatefulWidget {
  final String nom;

  const Commentaire({super.key, required this.nom});

  @override
  State<Commentaire> createState() => _CommentaireState();
}

class _CommentaireState extends State<Commentaire> {
  final TextEditingController _commentctrl = TextEditingController();
  bool send = false;

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _commentctrl.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE5D6C8),
      floatingActionButton: IconButton(
        style: ButtonStyle(
            backgroundColor: WidgetStatePropertyAll(Colors.black87)),
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios_sharp,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: SafeArea(
          child: Column(
            children: [
              Stack(
                children: [
                  // suit de page avec les commentaires

                  Container(
                    margin: const EdgeInsets.only(top: 300),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(20),
                        color: Colors.black12,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.white.withOpacity(0.5),
                              blurStyle: BlurStyle.outer,
                              blurRadius: 3,
                              spreadRadius: 2)
                        ]),
                    child: const Rcommentaire(),
                  ),

                  Container(
                    height: 230,
                    width: 400,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(20)),
                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: const BorderRadius.only(
                                bottomRight: Radius.circular(50),
                                bottomLeft: Radius.circular(50)),
                            child: CachedNetworkImage(
                              imageUrl:
                                  'https://i.postimg.cc/gj87kb1w/Untitled-image-9.jpg',
                              width: double.infinity,
                              fit: BoxFit.cover,
                            )),
                        Positioned(
                        top: 150,
                          left:250 ,
                          child: FloatingActionButton(
                            backgroundColor: Colors.black54,
                            onPressed: () {
                              showModalBottomSheet(
                                  backgroundColor: Colors.white70,
                                  context: context,isScrollControlled: true,
                                  builder: (BuildContext context) {
                                    return SizedBox(
                                        height: 600,
                                        child: Center(
                                            child: Column(
                                          children: [
                                            const SizedBox(
                                              height: 20,
                                            ),
                                            TextField(
                                              controller: _commentctrl,
                                              decoration: InputDecoration(
                                                  hintText: 'Votre combentaire',
                                                  suffixIcon: IconButton(
                                                    icon: const Icon(
                                                      CupertinoIcons
                                                          .paperplane_fill,
                                                      color: Colors.green,
                                                    ),
                                                    onPressed: () {
                                                      Add_comment(widget.nom,
                                                          _commentctrl.text);
                                                      _commentctrl.clear();
                                                      Navigator.pop(context);
                                                    },
                                                  ),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10))),
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                          ],
                                        )));
                                  });
                            },
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
