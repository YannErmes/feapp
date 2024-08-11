import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fesneakers/api_ctrl/get_ctrl/produit.dart';
import 'package:fesneakers/oussama/data.dart';
import 'package:fesneakers/pages/Garantie.dart';
import 'package:fesneakers/pages/board.dart';
import 'package:fesneakers/pages/card.dart';
import 'package:fesneakers/pages/comment.dart';
import 'package:fesneakers/pages/description.dart';
import 'package:fesneakers/pages/image.dart';
import 'package:fesneakers/pages/login.dart';
import 'package:fesneakers/pages/politic_page.dart';
import 'package:fesneakers/pages/sigin.dart';
import 'package:fesneakers/pages/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

import '../oussama/fliter_brand.dart';

class homepage extends StatefulWidget {
  final String? useremail;
  final String? usernom;
  final int t;

  const homepage({super.key, this.useremail, this.usernom, required this.t});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  bool mode = false;
  bool chargement = false;
  bool anime = false;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool animebrand = true;
  bool repeat = true;
  final rep = Hive.box('mybox3');
  final id = Hive.box('mybox');
  int i = 0;
  //Categorie cat_ctrl = Get.put(Categorie());
  @override
  void initState() {
    // TODO: implement initState
    // _fetchcategorie();
    super.initState();
    timerequest();
    // _fetchproduit("Get.php", "produit");
  //  first_use();
    
  }

  



  Future<void> animateforme(bool form) async {
    await Future.delayed(const Duration(seconds: 1), () {
      print('ok');
      setState(() {
        anime = form;
      });
    });
  }

  timerequest() {
    i = widget.t;
    if (i == 1) {

      _fetchproduit("Get.php", "produit");
      _fetchcategorie();
    } else {
      return;
    }
  }
  void _launchURL() async {
    const url = 'https://fe-store-politique-de-confidentialite.netlify.app/'; // Remplacez par l'URL de votre politique de confidentialité
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Impossible d\'ouvrir l\'URL $url';
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      

      key: _scaffoldkey,
      extendBodyBehindAppBar: false,
      endDrawerEnableOpenDragGesture: true,
      //backgroundColor: const Color(0xFFB0ADB0),
      backgroundColor: const Color(0xFFE5D6C8),
      // filter brand
      floatingActionButton: SizedBox(

        child: ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: BackdropFilter(
            filter: ImageFilter.blur( sigmaX: 15, sigmaY: 15),
            child: AnimatedContainer(

              decoration: BoxDecoration(

                borderRadius: BorderRadius.circular(30),

              ),
              height: animebrand ? 50 : 300,
              duration: Duration(seconds: 2),
              curve: Curves.decelerate,

              margin: EdgeInsets.symmetric(horizontal: 20),
              child: animebrand
                  ? Stack(
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                  imageUrl:
                                      'https://firebasestorage.googleapis.com/v0/b/febase'
                                          '-a80cd.appspot.com/o/categorie%2Fmarque%2Fdownloa'
                                          'd%20(3).jfif?alt=media&token=4b7fc20d-8bc4-48ac-8080-82d27338ebbc',height: 50,)),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: 'https://firebasestorage.'
                                    'googleapis.com/v0/b/febase-a80cd.appspot.com/o/categorie%2'
                                    'Fmarque%2FNike%20decide%20deixar%20de%20vender%20seus%20produtos%20na%20Amazon.jfif?alt=media&token=2817c49a-4664-4716-8e95-bf87a47fcd30',
                                height: 50,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: 'https://firebasestorage.'
                                    'googleapis.com/v0/b/febase-a80cd.appspot.com/o/categorie%2'
                                    'Fmarque%2FNike%20decide%20deixar%20de%20vender%20seus%20produtos%20na%20Amazon.jfif?alt=media&token=2817c49a-4664-4716-8e95-bf87a47fcd30',
                                height: 50,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                imageUrl: 'https://firebasestorage.'
                                    'googleapis.com/v0/b/febase-a80cd.appspot.com/o/categorie%2'
                                    'Fmarque%2FNike%20decide%20deixar%20de%20vender%20seus%20produtos%20na%20Amazon.jfif?alt=media&token=2817c49a-4664-4716-8e95-bf87a47fcd30',
                                height: 50,
                              )),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              animebrand=! animebrand;
                              rep.put(10, false);
                            });
                          },
                          child: AvatarGlow(

                            startDelay: Duration(seconds: 4),
                            repeat: rep.get(10) ?? true,
                            glowColor: Colors.white,
                            glowCount: 5,
                            curve: Curves.fastOutSlowIn,




                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: CachedNetworkImage(
                                  imageUrl: 'https://firebasestorage.googleapis.com/v0/b/'
                                      'febase-a80cd.appspot.com/o/categorie%2Fmarque%2Fdow'
                                      'nload%20(3).jfif?alt=media&token=4b7fc20d-8bc4-48ac-8080-82d27338ebbc',height: 50,
                                )),
                          ),
                        ),
                      ],
                    )
                  : SingleChildScrollView(
                scrollDirection: Axis.vertical,
                    child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          InkWell(
                            onTap: () {
                              _fetchproduit(
                                  "marque.php", 'nike');
                            },
                            child: brand(
                                'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/categorie%2Fmarque%2FNike%20decide%20deixar%20de%20vender%20seus%20produtos%20na%20Amazon.jfif?alt=media&token=2817c49a-4664-4716-8e95-bf87a47fcd30',),
                          ),
                          InkWell(
                            onTap: () {
                              _fetchproduit(
                                  "marque.php", 'nb');
                            },
                            child: brand(
                                'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/categorie%2Fmarque%2FBotas%20de%20f%C3%BAtbol%20New%20Balance.jfif?alt=media&token=ffee4096-a824-4723-ba94-8c3153face5c'),
                          ),
                          InkWell(
                            onTap: () {
                              _fetchproduit(
                                  "marque.php", 'addidas');
                            },
                            child: brand(
                                'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/categorie%2Fmarque%2Fadidas.jfif?alt=media&token=89f99b82-b1df-418e-bbb0-304efe1a02c0'),
                          ),
                          InkWell(
                            onTap: () {
                              _fetchproduit(
                                  "marque.php", 'jordan');
                            },
                            child: brand(
                                'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/categorie%2Fmarque%2FAir%20Jordan%20Logo%20PNG%20Transparent%20%26%20SVG%20Vector%20-%20Freebie%20Supply.jfif?alt=media&token=fcd49bfe-fc5a-4348-b19f-3a64b2226392'),
                          ),
                          InkWell(
                            onTap: () {
                              _fetchproduit(
                                  "marque.php", 'balanciaga');
                            },
                            child: brand(
                                'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/categorie%2Fmarque%2FBalenciaga%20SVG%20%26%20PNG%20Download.jfif?alt=media&token=128a5069-4fa7-40f6-9069-6c53b03b3ffa'),
                          ),
                          InkWell(
                            onTap: () {
                              _fetchproduit(
                                  "marque.php", 'puma');
                            },
                            child: brand(
                                'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/categorie%2Fmarque%2Fdownload%20(3).jfif?alt=media&token=4b7fc20d-8bc4-48ac-8080-82d27338ebbc'),
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                animebrand=! animebrand;
                                repeat = false ;
                              });
                            },
                            child:Icon(Icons.cancel,color: Colors.black, size: 30,),
                          ),
                        ],
                      ),
                  ),
            ),
          ),
        ),
      ),
      
      // drawer
      drawer: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
        child: ClipRRect(
          child: Drawer(
            backgroundColor: Colors.white70,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Container(
                      margin: const EdgeInsets.all(50),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(200),
                          child: CachedNetworkImage(
                            imageUrl:
                                'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/produit%2FScreenshot%202024-04-27%20193422.png?alt=media&token=1c3b3a4f-4b45-42bd-8be6-114851040025',
                            height: 100,
                            placeholder: (context, url) =>
                                const LinearProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.image_not_supported_rounded),
                          )),
                    ),
                  ),
                  Container(
                    color: Colors.black87,
                    height: 1,
                    width: 300,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,PageRouteBuilder(pageBuilder:
                            (context, animation, anotheranimation) => const homepage(
                              usernom: 'fé',
                              useremail: '',
                              t: 1,
                            ),
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
                                  child:  const homepage(
                                    usernom: 'fé',
                                    useremail: '',
                                    t: 1,
                                  ),
                                ),

                              );
                            }

                        ) ,
                        );

                      },
                      label: const Text('Acueille'),
                      icon: const Icon(CupertinoIcons.home)),
                  const SizedBox(
                    height: 15,
                  ),


                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,PageRouteBuilder(pageBuilder:
                          (context, animation, anotheranimation) =>  cardpage(
                            useremail: '${id.get(3)}',
                          ),
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
                                child:  cardpage(
                                  useremail: '${id.get(3)}',
                                ),
                              ),

                            );
                          }

                      ) ,
                      );

                    },
                    label: const Text('Panier'),
                    icon: const Icon(Icons.shopping_cart_checkout),
                  ),
                  const SizedBox(
                    height: 15,
                  ),


                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,PageRouteBuilder(pageBuilder:
                          (context, animation, anotheranimation) =>   Commentaire(nom: '${id.get(1)}'),
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
                                child:  Commentaire(nom: '${id.get(1)}'),
                              ),

                            );
                          }

                      ) ,
                      );
                    },
                    label: const Text('Fait comme chez toi et laisse ton Avis'),
                    icon: const Icon(CupertinoIcons.bubble_left_bubble_right),
                  ),
                  const SizedBox(
                    height: 15,
                  ),

                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,PageRouteBuilder(pageBuilder:
                          (context, animation, anotheranimation) =>    Compte(nomuser: '${widget.usernom}'),
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
                                child:   Compte(nomuser: '${widget.usernom}'),
                              ),

                            );
                          }

                      ) ,
                      );

                    },
                    label: const Text('Information'),
                    icon: const Icon(Icons.info_outline_rounded),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,PageRouteBuilder(pageBuilder:
                          (context, animation, anotheranimation) =>  LoginPage(),
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
                                child:  LoginPage(),
                              ),

                            );
                          }

                      ) ,
                      );

                    },
                    label: const Text('Se connecté'),
                    icon: const Icon(Icons.login),
                  ),
                  const SizedBox(
                    height: 10,
                  ),


                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,PageRouteBuilder(pageBuilder:
                          (context, animation, anotheranimation) =>Garantie(),
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
                                child: Garantie(),
                              ),

                            );
                          }

                      ) ,
                      );

                    },
                    label: const Text('Garantie sur les articles'),
                    icon: const Icon(Icons.offline_pin_outlined),
                  ),
                  const SizedBox(
                    height: 10,
                  ),



                  TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PolitiqueConfidentialitePage(),
                          ));
                    },
                    child: const Text('Politique de Confidentialité (Interne)'),

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                 /* TextButton(
                    onPressed: _launchURL,
                    child: const Text('Politique de Confidentialité (Externe)'),

                  ),*/
                ],
              ),
            ),
          ),
        ),
      ),
      //                                                                  appbar
      /*  appBar: AppBar(
        title:
        actions: [
          LottieBuilder.network(
              'https://lottie.host/682e2279-cd6f-41ae-be72-8f94df27fe00/OX4yyOihoQ.json')
        ],
      ),*/

      // Corps de la page
      body: CustomScrollView(

slivers: [
  SliverAppBar(

    shadowColor: Colors.black54,

    leading:Padding(
      padding: const EdgeInsets.all(8.0),
      child: CircleAvatar(backgroundColor : Colors.transparent,radius: 20,child: CachedNetworkImage(imageUrl: 'https://i.postimg.cc/Y0pZW9hn/logo-4.png',),),
    ),
expandedHeight: 415,
    title: Expanded(
      child: Text(
        " ${id.get(1)} Bienvenue!",
        style: const TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold),
      ),
    ),
    actions: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          child: AvatarGlow(
            repeat: rep.get(43) ?? true,

            child: Icon(
              Icons.menu,
              size: 30,
              color: Colors.white,
            ),
          ),
          onTap: () {
            _scaffoldkey.currentState?.openDrawer();
            rep.put(43, false);
          },
        ),
      )
    ],
    backgroundColor:Color(0xFFE5D6C8),
    flexibleSpace: FlexibleSpaceBar(
      background:
      Column(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                color: Colors.brown.shade300,
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30))),
            child: Column(
              children: [


                const SizedBox(
                  height: 56,
                ),
                // image pikers
                Container(
                  child: const ImagePickerWidget(),
                ),
                const SizedBox(
                  height: 15,
                ),
                //  slide P
                GestureDetector(
                  onTap: () {
                    animateforme(false);
                  },
                  child: AnimatedContainer(
                    duration: const Duration(seconds: 2),
                    height: anime ? 100 : 150,
                    width: anime ? 380 : 300,
                    margin: const EdgeInsets.symmetric(horizontal: 5),
                    decoration: BoxDecoration(
                        color: Colors.grey.shade50,
                        boxShadow: const [
                          BoxShadow(
                              offset: Offset(-8, -8),
                              color: Colors.black87,
                              blurRadius: 15,
                              spreadRadius: 1),
                        ],
                        image: const DecorationImage(
                            image: NetworkImage(
                                'https://i.postimg.cc/D0qf3b9L/sld.png'),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(20)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: const SliderP()

                      // Image.network('https://img.freepik.com/free-psd/shoes-sale-social-media-post-template-design_505751-4476.jpg?t=st=1716288493~exp=1716292093~hmac=4e97e5827740eeb09735c6999433cc9bbe88b947b8cbd38a113ec6cd567a58d3&w=740', fit: BoxFit.cover,)

                    ),
                  ),
                ),
                // text categorie
                const SizedBox(
                  height: 35,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Catégorie',
                        style:
                        TextStyle(color: Colors.white, fontSize: 20),
                      ),
                      Icon(
                        CupertinoIcons.color_filter,
                        size: 20,
                        color: Colors.white,
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          _categorie.isNotEmpty
              ? AnimatedContainer(
            duration: const Duration(seconds: 1),
            margin: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              image: DecorationImage(image: NetworkImage('https://i.pinimg.com/564x/b7/b3/fc/b7b3fc0f87a00089b6a4900a6be059db.jpg'),fit: BoxFit.cover,opacity: 0.6),

              borderRadius: BorderRadius.circular(25),
              border: Border.all(color: Colors.black54, width: 1),
            ),
            height: anime ? 100 : 84,

            padding: const EdgeInsets.all(1),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _categorie.length,
              itemBuilder: (context, index) {
                final cat = _categorie[index];
                return GestureDetector(
                  onTap: () {
                    animateforme(true);
                    _fetchproduit(
                        "Get_categorie.php", '${cat['nom']}');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color(0xFFC09E5D), width: 2),
                      color: Colors.black38,
                      borderRadius: BorderRadius.circular(50),
                      boxShadow: const [

                        BoxShadow(
                            offset: Offset(3, 3),
                            color: Colors.black12,
                            blurRadius: 15,
                            spreadRadius: 1),
                      ],
                    ),
                    margin: const EdgeInsets.all(8.0),
                    // Marge autour du carré
                    width: anime ? 70 : 77,
                    // Largeur du carré
                    height: anime ? 60 : 40,
                    // Hauteur du carré
                    // Couleur du carré
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                      children: [
                        Transform.rotate(
                          angle: -0.10 * pi,
                          child: Container(
                              child: CachedNetworkImage(
                                imageUrl: '${cat['image']}',
                                fit: BoxFit.cover,
                                placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                                errorWidget: (context, url, error) =>
                                const Icon(Icons.image_not_supported_rounded),
                              )),
                        ),
                        Text('${cat['nom']}')
                      ],
                    ),
                  ),
                );
              },
            ),
          )
              : const CircularProgressIndicator(),
        ],
      ),


    ),

    pinned: true,


  ),

  SliverToBoxAdapter(
    child: SafeArea(
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Column(
            children: [
              // first container

              //

              //

              const SizedBox(
                height: 10,
              ),

              //                                    contaenair de categorie

              //                                                    Categorie


              //
              //
              //                                             Bar de filtrage
              Stack(
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.black54,
                    ),
                    height: 45,
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          const Expanded(
                            child: Text(
                              'Filtré',
                              style: TextStyle(
                                  color: Colors.white, fontSize: 20),
                            ),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  _fetchproduit("prixh.php", '11000');
                                });
                              },
                              icon: const Icon(
                                CupertinoIcons.arrow_up_square_fill,
                                color: Colors.green,
                                size: 30,
                              )),
                          IconButton(
                              onPressed: () {
                                _fetchproduit("prixb.php", '11000');
                              },
                              icon: const Icon(
                                CupertinoIcons.arrow_down_square_fill,
                                color: Colors.red,
                                size: 30,
                              )),

                          //
                          //
                          //                          bottom sheet filtrage par brande

                        ],
                      ),
                    ),
                  ),
                ],
              ),

              //
              //
              //                                              Titer produit

              SizedBox(
                height: 30,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Expanded(
                      child: Text(
                        'Produit',
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                    IconButton(
                        onPressed: () {
                          setState(() {
                            mode =!mode;
                          });
                        },
                        icon: mode
                            ? const Icon(
                          CupertinoIcons.increase_quotelevel,
                          size: 25,
                          color: Colors.white,
                        )
                            : const Icon(
                          Icons.grid_view_rounded,
                          size: 25,
                          color: Colors.white,
                        ))
                  ],
                ),
              ),

              //
              //
              //                                             Liste de produit
              _produit.isNotEmpty
                  ? Center(child: print_prod(mode, '${widget.useremail}'))
                  : const CircularProgressIndicator()
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

  //
  //
  //                                               requete gestion des categories
  List<Map<String, dynamic>> _categorie = [];

  Future<void> _fetchcategorie() async {
    // Remplacez l'URL par l'URL de votre API PHP

    try {
      var response = await http.post(
          Uri.parse('https://www.fe-store.pro/Get.php'),
          body: {
            "nom": 'categorie',
          });

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _categorie = responseData.cast<Map<String, dynamic>>();
        });
      } else {
        // Gérer les erreurs
        /* Get.defaultDialog(
            title:
                'Oups! : un probleme lié à gesttion des application en cours essayez de redémmaré l\'application dans 50 seconde 😉 ',
            titleStyle: const TextStyle(fontSize: 15),
            content: SizedBox(
                height: 30,
                child: LottieBuilder.network(
                    'https://lottie.host/f0025050-6107-4454-a138-1352ad883f1e/CIUGm0JMjX.json')));*/
        _fetchcategorie();
      }
    } catch (e) {
      // Gérer les erreurs ici
      print(e.toString());
    }
  }

//
//
//                                                gestion des produit avec requete
  List _produit = [];

  Future<void> _fetchproduit(String path, String name) async {
    // Remplacez l'URL par l'URL de votre API PHP

    try {
      var response = await http.post(
          Uri.parse('https://www.fe-store.pro/$path'),
          body: {
            "nom": name,
          });

      if (response.statusCode == 200) {
        final List<dynamic> responseData = json.decode(response.body);
        setState(() {
          _produit = responseData.cast<Map<String, dynamic>>();
        });
      } else {
        // Gérer les erreurs
        Get.defaultDialog(
            title:
                'Oups! pour voir les derniere nouveauté essayé juste de redémmaré l\'application apres 1 minute😉',
            titleStyle: const TextStyle(fontSize: 16),
            content: IconButton(
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const MyCustomWidget(),
                      ));
                },
                icon: const Icon(Icons.refresh_outlined)));
        print('Erreur de chargement des produits : ${response.statusCode}');
      }
    } catch (e) {
      // Gérer les erreurs ici
      print(e.toString());
      Get.snackbar(
        'Oups!',
        'Oups!essayez de verifié votre acces à internet😥.',
        duration: const Duration(seconds: 11),
      );
    }
  }

  //
  //
  //                                                        Affichage de produit
  Widget print_prod(bool mode, String userpass) {
    var y = _produit.length;
    var size = MediaQuery.of(context).size.width;
    if(size>500 || mode){
      setState(() {
        mode = true;
      });
    }else{
      setState(() {
        mode = false;
      });
    }
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(top: 19),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            mode
                ? Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.black38),
                    height: 220,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemExtent: 200,
                      cacheExtent: 100,
                      itemCount: _produit.length,
                      itemBuilder: (context, index) {
                        final product = _produit[index];

                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(33),
                            child: OpenContainer(
                              
                              transitionDuration: Duration(microseconds: 500),
                              transitionType: ContainerTransitionType.fade,

                              closedBuilder: (context, action) =>
                              Produits(
                                  image: '${product['image1']}',
                                  nom: '${product['nom']}',
                                  prix: '${product['prix']}',
                                  Code: '${product['eid']}'),
                              openBuilder: (context, action) {

                                return Description(
                                  image1: '${product['image1']}',
                                  image2: '${product['image2']}',
                                  image3: '${product['image3']}',
                                  prix: '${product['prix']}',
                                  nom: '${product['nom']}',
                                  description: '${product['description']}',
                                  quantite: '${product['quantite']}',
                                  eid: '${product['eid']}',
                                  useremail: id.get(3)
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  )
                : Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.7)),

                    height: y * 100,
                    child: GridView.builder(

                      scrollDirection: Axis.horizontal,
                      dragStartBehavior: DragStartBehavior.start,
                      itemCount: _produit.length,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisSpacing: size/19,
                          crossAxisSpacing: 8,
                          maxCrossAxisExtent:
                              size > 500 ? (270 * size) / 504 : 200,
                          mainAxisExtent: (170 * size) / 360),
                      itemBuilder: (context, index) {
                        final product = _produit[index];
                        return  Padding(
                          padding: const EdgeInsets.all(2),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: OpenContainer(
                              transitionDuration: Duration(microseconds: 500),

                              closedBuilder: (context, action) =>
                                  Produits(
                                      image: '${product['image1']}',
                                      nom: '${product['nom']}',
                                      prix: '${product['prix']}',
                                      Code: '${product['eid']}'),
                              openBuilder: (context, action) {
                                return Description(
                                  image1: '${product['image1']}',
                                  image2: '${product['image2']}',
                                  image3: '${product['image3']}',
                                  prix: '${product['prix']}',
                                  nom: '${product['nom']}',
                                  description: '${product['description']}',
                                  quantite: '${product['quantite']}',
                                  eid: '${product['eid']}',
                                  useremail: id.get(3),
                                );
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  //
  //
  //liste de brande pour la bottomsheet
  brand(String image) {
    return GestureDetector(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 4),

      child: ClipRRect(
          borderRadius: BorderRadius.circular(30),
          child: CachedNetworkImage(
            imageUrl: image,
            fit: BoxFit.cover,
            placeholder: (context, url) => const CircularProgressIndicator(),
            errorWidget: (context, url, error) =>
                const Icon(Icons.image_not_supported_rounded),
            height: 50,
          )),
    ));
  }



}
