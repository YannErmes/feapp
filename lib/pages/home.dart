import 'dart:convert';
import 'dart:math';
import 'dart:ui';
import 'package:animations/animations.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:fesneakers/api_ctrl/annexapis.dart';
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
import 'package:fesneakers/pages/splash.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive/hive.dart';
import 'package:http/http.dart' as https;
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:shimmer/shimmer.dart';
import 'package:url_launcher/url_launcher.dart';


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
  final userinformation = Hive.box('userauth');
  int i = 0;

  //Categorie cat_ctrl = Get.put(Categorie());
   card_ctrl paniertaille = Get.put(card_ctrl());
  @override
  void initState() {
    // TODO: implement initState
    // _fetchcategorie();
    super.initState();
    
    _fetchproduit("Get.php", "produit");
    _fetchcategorie();

    taille_panier( "${userinformation.get('utilisateurmail')}");
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



  final Uri _url = Uri.parse('https://web.facebook.com/profile.php?id=61557796385945');
  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
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
              duration: Duration(seconds: 1),
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
                                  "marque.php", 'adidas');
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
                                  "marque.php", 'fashion');
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
                                SizedBox(
                                  height:10,
                                    width: 30,
                                    child: const LinearProgressIndicator()),
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
                          (context, animation, anotheranimation) =>  ShoppingCartPage(

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
                                child:  ShoppingCartPage(),
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
                          (context, animation, anotheranimation) =>   Commentaire(nom: '${userinformation.get('utilisateurnom')}'),
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
                                child:  Commentaire(nom: '${userinformation.get('utilisateurnom')}'),
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
                            builder: (context) => PrivacyPolicyPage(),
                          ));
                    },
                    child: const Text('Politique de Confidentialité (Interne)'),

                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextButton(
                    onPressed: _launchUrl,
                    child: CachedNetworkImage(imageUrl: 'https://freepnglogo.com/images/all_img/1713419247Facebook-Logo-Black.png', height: 50,),

                  ),
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
      child: InkWell(
        onTap: () {
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

      child: CircleAvatar(backgroundColor : Colors.transparent,radius: 20,child: CachedNetworkImage(imageUrl: 'https://i.postimg.cc/Y0pZW9hn/logo-4.png',),)),
    ),
expandedHeight: 425,
    title: Text(
      " ${userinformation.get('utilisateurnom') ?? ''} Bienvenue!",
      style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold),
    ),
    actions: [
      Stack(
        children: [
          IconButton(
              onPressed: (){
                Navigator.push(
                  context,PageRouteBuilder(pageBuilder:
                    (context, animation, anotheranimation) =>  ShoppingCartPage(

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
                          child:  ShoppingCartPage(),
                        ),

                      );
                    }

                ) ,
                );

              },
              icon: Icon( Icons.shopping_bag_outlined,
                size: 40,
                color: Colors.black,)
          ),
          Positioned(
            left: 30,
            top: 9,

            child: CircleAvatar(backgroundColor: Colors.red,
              radius: 9,

              child: Text('$size',
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold, fontSize: 8)),),
          )
        ],
      ),


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
      ),

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
                  height: 70,
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
                        TextStyle(color: Colors.white, fontSize: 20, fontFamily:'Schyler' ),
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

            padding: const EdgeInsets.symmetric(horizontal: 1),
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
                                    LoadingAnimationWidget.flickr(
                                      leftDotColor: Colors.brown.shade200,
                                      rightDotColor: Colors.black,
                                      size: 35,
                                    ),
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
              :  LoadingAnimationWidget.flickr(
            leftDotColor: Colors.brown.shade200,
            rightDotColor: Colors.black,
            size: 50,
          ),
        ],
      ),


    ),

    pinned: true,



  ),

  SliverToBoxAdapter(
    child: Center(
      child: Column(
        children: [
          // first container

          //                                             Bar de filtrage
          Stack(
            children: [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
                padding: const EdgeInsets.symmetric(horizontal: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
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
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Expanded(
                  child: Text(
                    'Produits',
                    style: TextStyle(color: Colors.black87, fontSize: 23),
                  ),
                ),

              ],
            ),
          ),

          //
          //

        ],
      ),
    ),
  ),
  //                                             Liste de produit
 _produit.isNotEmpty ? SliverGrid(

    gridDelegate:  SliverGridDelegateWithFixedCrossAxisCount(
      mainAxisExtent: 287,
      crossAxisCount:  2, // Deux éléments par ligne
      crossAxisSpacing: 8,
      mainAxisSpacing: 16,
      childAspectRatio: 0.7,),
    delegate: SliverChildBuilderDelegate(

          (BuildContext context, int index) {
        final product = _produit[index];
        return  Container(

         padding: EdgeInsets.all(5),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: OpenContainer(
              transitionDuration: Duration(microseconds: 500),

              closedBuilder: (context, action) =>
                  Products(product: _produit[index]),
              openBuilder: (context, action) {
                return Description(
                  image1: '${product['image1']}',
                  image2: '${product['image2']}',
                  image3: '${product['image3']}',
                  prix: double.parse(product['prix'] ),
                  nom: '${product['nom']}',
                  description: '${product['description']}',
                  quantite: '${product['quantite']}',
                  eid: '${product['eid']}',
                  useremail:"${userinformation.get('utilisateurmail')}",
                );
              },
            ),
          ),
        ) ;

      },
      childCount: _produit.length, // Nombre d'éléments
    ),

  ):
 SliverToBoxAdapter(

   child: Container(
     
     child: SingleChildScrollView(
       child: Column(
         children: [
       
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Shimmer.fromColors(
                 baseColor: Colors.white60,
                 highlightColor: Colors.black12,
                 child: Expanded(child: Container(
       
                   decoration: BoxDecoration(
                       color: Colors.white70,
                     borderRadius: BorderRadius.circular(15)
                   ),
                   height: 150,width: 150,
                  )),
               ),
               Shimmer.fromColors(
                 baseColor: Colors.white60,
                 highlightColor: Colors.black12,
                 child: Expanded(child: Container(
       
                   decoration: BoxDecoration(
                       color: Colors.white70,
                     borderRadius: BorderRadius.circular(15)
                   ),
                   height: 150,width: 150,
                  )),
               ),
       
       
             ],
           ),
           SizedBox(height: 15,width:  1),
           Row(
             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
             children: [
               Shimmer.fromColors(
                 baseColor: Colors.white60,
                 highlightColor: Colors.black12,
                 child: Expanded(child: Container(
       
                   decoration: BoxDecoration(
                       color: Colors.white70,
                     borderRadius: BorderRadius.circular(15)
                   ),
                   height: 150,width: 150,
                  )),
               ),
               Shimmer.fromColors(
                 baseColor: Colors.white60,
                 highlightColor: Colors.black12,
                 child: Expanded(child: Container(
       
                   decoration: BoxDecoration(
                       color: Colors.white70,
                     borderRadius: BorderRadius.circular(15)
                   ),
                   height: 150,width: 150,
                  )),
               ),
       
       
             ],
           ),
           LoadingAnimationWidget.flickr(
             leftDotColor: Colors.brown.shade200,
             rightDotColor: Colors.black,
             size: 50,
           ),
         ],
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
      var response = await https.post(
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

//                                                gestion des produit avec requete
  List _produit = [];

  Future<void> _fetchproduit(String path, String name) async {
    // Remplacez l'URL par l'URL de votre API PHP

    try {
      var response = await https.post(
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
            placeholder: (context, url) =>  LoadingAnimationWidget.flickr(
              leftDotColor: Colors.brown.shade200,
              rightDotColor: Colors.black,
              size: 20,
            ),
            errorWidget: (context, url, error) =>
                const Icon(Icons.image_not_supported_rounded),
            height: 50,
          )),
    ));
  }



  // fech panier taille
  int size= 0 ;
  Future<String> taille_panier(String userid)async{
    var Url = 'https://www.fe-store.pro/web_view_panier.php';

    var response = await https.post(Uri.parse(Url),
        body:  {
          'userid' : '$userid'
        });

    if(response.statusCode == 200){

      var resbody  = jsonDecode(response.body);
      List<dynamic> panierlist = [];
      if(resbody['success']== true){

        panierlist = resbody['todos'];
        //  Map<dynamic,dynamic> paniermap = panierlist ;
        print(panierlist);
        size = panierlist.length;
        return '0' ;


      }
      else {
        print ("${Text('${resbody['message']}')}");
        return '0' ;

      }


    }else {

      print ('no request');
      return "0" ;
    }


  }






}
