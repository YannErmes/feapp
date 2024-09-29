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
      floatingActionButton: Row(
        children: [
          Spacer(),
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade900),
                color: Colors.blueGrey.shade900,
              borderRadius: BorderRadius.circular(30)
            ),
            height: 55,
            width: 220,

            child: Center(
              child: TextField(
                controller: _commentctrl,
                style: TextStyle(color: Colors.white),
                maxLines: 1,

                decoration: InputDecoration(

                  filled: false,

                  alignLabelWithHint: false,
                    hintStyle: TextStyle( color: Colors.grey),
                    hintText: 'Message',
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
                        setState(() {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (BuildContext context) => super.widget));
                        });

                      },
                    ),
                    border: OutlineInputBorder(
                        borderRadius:
                        BorderRadius.circular(
                            25))),
              ),
            ),
          ),
          /*InkWell(
            onTap: () {
              showModalBottomSheet(
                  backgroundColor: Colors.transparent,
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
                                  maxLines: 3,


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
            child: Container(
              height: 40,
              width: 250,
              decoration: BoxDecoration(
                  border: Border.all(width: 2, color: Colors.blueGrey.shade500),
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.blueGrey.shade900
              ),
              child: Center(child: Text('votre texte' ,style: TextStyle(color: Colors.grey, fontSize: 18),)),
            ),
          ),*/
          IconButton(
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


        ],
      ),
      body: RefreshIndicator(

        onRefresh: (){
          return Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => super.widget));
        },
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    children: [
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

                          ],
                        ),
                      ),
                      Spacer(),
                      Container(

                        width: MediaQuery.of(context).size.width,
                        height:450,


                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(20),
                            color: Colors.black54,
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.white.withOpacity(0.5),
                                  blurStyle: BlurStyle.outer,
                                  blurRadius: 3,
                                  spreadRadius: 2)
                            ]),
                        child: const Rcommentaire(),
                      ),
                    ],
                  ),
                ),
               SizedBox(
                 height: 70,
               )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
