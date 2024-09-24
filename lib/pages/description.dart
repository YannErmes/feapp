import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:fesneakers/api_ctrl/add_ctrl/card.dart';
import 'package:fesneakers/pages/Credit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';


class Description extends StatefulWidget {


  final String image1;
  final String image2;
  final String image3;
  final double prix;
  final String nom;
  final String description;
  final String quantite;
  final String eid;
  final String? useremail;

  const Description({super.key, required this.image1, required this.image2, required this.image3, required this.prix, required this.nom, required this.description, required this.quantite, required this.eid, this.useremail});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  @override

  //initialisation des variable
  int quantiteb = 1 ;
  double final_prix = 1 ;
  DateTime dateTime = DateTime.now();
  ScrollController _scrollController = ScrollController();

  // initialisation des founction






  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Ajout d'un listener pour surveiller les événements de défilement
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {
        // L'utilisateur a atteint le bas de la page

        print('ok');
      }
    });
  }




  @override
  Widget build(BuildContext context) {
    double h =  MediaQuery.of(context).size.height;
    double w =  MediaQuery.of(context).size.width;
    return Scaffold(
      floatingActionButton: Container(
        height: 70,
        color: Colors.white,
        child: Row(
          children: [
            Spacer(),
            ElevatedButton.icon(
                style: ButtonStyle(

                    backgroundColor: WidgetStatePropertyAll(Colors.black),
                    shape: WidgetStatePropertyAll(RoundedRectangleBorder())
                ),
                onPressed: () {
                  Add_card(widget.image1, widget.nom, widget.eid, widget.useremail ?? 'fé', widget.prix );

                  print('ici');

                },
                icon: const Icon(
                  Icons.add_shopping_cart,
                  color: Colors.white,
                ),
                label: const Text(
                  'AJOUTER A MON PANIER',
                  style: TextStyle(color: Colors.white),
                )),
            SizedBox(width: 5,)
        ,          IconButton(
              hoverColor: Colors.white,
              style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black12)),
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 30,
                color: Colors.white,
              ),
            ),

          ],
        ),
      ),
      backgroundColor: const Color(0xFFE5D6C8),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: SingleChildScrollView(
            controller: _scrollController,
            scrollDirection: Axis.vertical,
            child: SafeArea(
              child: Stack(
                children: [
                  // image de fond


                  // premier column des element
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 140,
                        ),

                        // nom et taill prix comment et autre

                        Container(
                          decoration: BoxDecoration(

                              color: Colors.white.withOpacity(0.6),
                              borderRadius: BorderRadius.circular(15)),
                          height: 280,
                          width: 300,
                          child: Padding(
                            padding: const EdgeInsets.all(20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                // row de nom est prix
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // nom du produit

                                    Text(
                                      widget.nom,
                                      style: const TextStyle(
                                          fontSize: 20,
                                          ),
                                    ),

                                  ],
                                ),

                                // la row du nombre en stock est du commentaie
                                Row(
                                  children: [
                                    Text(
                                      'Nombre en stock [${widget.quantite}]',
                                      style: const TextStyle(
                                          color: Colors.redAccent),
                                    ),
                                    Spacer(),
                                    // container de prix
                                    Column(
                                      children: [
                                        Container(
                                            height: 30,
                                            width: 60,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                BorderRadius.circular(5),
                                                color: Colors.black),
                                            child: Center(
                                                child: Text(
                                                  '${(widget.prix) -((widget.prix)*0.05)}f',
                                                  style: const TextStyle(
                                                      color: Colors.white , fontWeight: FontWeight.bold),
                                                ))),
                                        Text('${widget.prix}' , style: TextStyle(decoration: TextDecoration.lineThrough, color: Colors.redAccent),)
                                      ],
                                    )
                                  ],
                                ),

                                const SizedBox(
                                  height: 15,
                                )
                              ],
                            ),
                          ),
                        ),

                        const SizedBox(
                          height: 8,
                        ),



                        //boutton de base commade et ajoute au panier
                        Container(
                          height: 40,
                          width: 355,

                          // row des boutton de base
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [

                              const SizedBox(
                                width: 4,
                              ),

                            ],
                          ),
                        ),


                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child:ListTile(
                              leading: Icon(Icons.local_shipping_outlined),
                              title: Row(
                                children: [
                                  Icon(Icons.circle_rounded, color: Colors.green,size: 15,),
                                  Text('Livraison à domicile \n ou en relais \n à partir du 12 septembre',
                                    overflow: TextOverflow.ellipsis,),
                                ],
                              ),


                            )

                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.black)
                            ),
                            child:ListTile(
                              leading: Icon(Icons.monetization_on_outlined),
                              title: Row(
                                children: [
                                  Icon(Icons.circle_rounded, color: Colors.green,size: 15,),
                                  Text('Mode de payement flèxible',
                                    overflow: TextOverflow.ellipsis,),
                                ],
                              ),


                            )

                        ),


                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          color: Colors.black12,
                          child: Column(
                            children: [

                              Txt("Offre strictement personnelle valable \n ", 17, FontWeight.bold,
                                  Colors.black),

                              Txt("du 12/09/2024 au ${dateTime.day+3}/${dateTime.month}/${dateTime.year}", 20, FontWeight.bold,
                                  Colors.red)

                              , Txt("inclus sur une sélection de produits par nos soin ", 17, FontWeight.bold,
                                  Colors.black)
                            ],
                          ),
                        )
                        ,

                        SizedBox(height: 20,),
                        Txt("${widget.description}", 15, FontWeight.normal,
                            Colors.black),
                        SizedBox(height: 20,),
                        Center(
                          child:  Txt("fé Sneakers", 30, FontWeight.bold, Colors.black),
                        ),


                        Txt("Nous nous engageons à"
                            " provoquer une transformation audacieuse dans le monde de"
                            " la mode urbaine, en mettant en valeur l’unicité de chacun "
                            "grâce à des Sneakers uniques et de grande veleur ajouté.", 15, FontWeight.normal,
                            Colors.black),
                        SizedBox(height: 10,),
                        CachedNetworkImage(imageUrl: 'https://i.postimg.cc/gk695sP9/Snaptik-app-7294040446735568174.gif',
                          placeholder: (context, url) => CircleAvatar(),
                          height: 300,)

                        , SizedBox(height: 20,),
                        Txt("Quelle sneakers avec robe?", 25, FontWeight.bold, Colors.black),
                        Txt("Porter des sneakers avec une robe ? Eh oui, c’est l'audace chic qui fait tourner les têtes !", 15, FontWeight.normal, Colors.black)

                        , Image.network('https://i.postimg.cc/9FxcyXLt/12ed925f099286dcf4399e8f10c6615f.webp', height: 300,),
                        Txt('Aller dans Accueil>Nike', 15, FontWeight.normal, Colors.grey),
                        SizedBox(height: 20,),
                        Txt("Peut-on porter des  sneakers avec un costume ?", 25, FontWeight.bold, Colors.black),
                        Txt("Bien sûr, c’est l’élégance décontractée qui surprend avec style !", 15, FontWeight.bold, Colors.black),

                        Image.network('https://i.postimg.cc/SNQyXYfx/a9e471ac93841239e1c60eec588b912e.webp',height: 300,),
                        Txt('Aller dans Accueil>fashon', 15, FontWeight.normal, Colors.grey),
                        SizedBox(height: 15,),

                        Txt(
                            "IL A ETE PROUVE QUE  La tenue vestimentaire est essentielle car elle influence"
                                " non seulement la perception que les autres ont de vous,"
                                " mais aussi la manière dont vous vous percevez vous-même."
                                " En s'habillant avec soin, vous pouvez renforcer votre confiance"
                                " en vous, améliorer votre image professionnelle et sociale, "
                                "et exprimer votre identité de manière visuelle. De plus, "
                                "les vêtements que vous portez peuvent transmettre des messages"
                                " culturels et personnels, créant ainsi une première impression "
                                "puissante et souvent durable.",
                            20,
                            FontWeight.normal,
                            Colors.black),

                        SizedBox(
                          height: 20,
                        ),

                        Txt("Nos clients ne cessent de le dire : porter des sneakers, c'est allier confort et style sans compromis, une sensation inégalée à chaque pas !   Ils ne sont pas les seuls ...", 25, FontWeight.bold, Colors.black),

                        CachedNetworkImage(imageUrl: 'https://i.postimg.cc/qq2VS4rq/Annotation-2024-09-16-135406-1.png'),

                        SizedBox(
                          height: 25,
                        ),

                        carousepreuve(),







                        // plus Information

                        SizedBox(height: 20,),
                        Center(
                          child:  Txt("Information", 20,FontWeight.bold, Colors.black),
                        ),

                        SizedBox(height: 20,),
                        ExpansionTile(
                          title: Text('Condition de livraison'),
                          leading: Icon(Icons.local_shipping_outlined, color: Colors.black),

                          children: [
                            Txt("Le délai d'expédition est de 1 à 2 jours et le délai de livraison est de 4 à 7 jours  après avoir commandé sur le site."
                                " Un WhatsApp / SMS / email de confirmation avec votre numéro de suivi vous sera envoyé dès que votre colis sera expédié de notre entrepôt.", 15, FontWeight.normal, Colors.black)
                          ],
                        ),
                        SizedBox(height: 15,),
                        ExpansionTile(
                          title: Text('Dans quel pays pouvous-nous livre ?'),

                          leading: Icon(Icons.place_outlined, color: Colors.black),
                          children: [
                            Txt("Nous livrons dans tous les pays utilisans le XOF(fcfa) mais la livraison gratuite est disponible uniquement au "
                                "Burkina-faso ; Bénin ; Cameroun ; Togo .", 15, FontWeight.normal, Colors.black)
                          ],
                        ),
                        SizedBox(height: 15,),
                        ExpansionTile(
                          title: Text('Politique de retour'),


                          leading: Icon(Icons.turn_left, color: Colors.black),
                          children: [
                            Txt("Si la couleur ou la taille de l’article reçu ne correspond pas à vos attentes, vous avez la possibilité de retourner le produit dans un délai de 7 jours après la livraison.", 20, FontWeight.normal, Colors.black)
                            ,SizedBox(height: 10,)
                            , Txt("  ¤ Remboursement : Si vous ne souhaitez pas d’échange, nous vous remboursons 50% du montant de l’article.", 15, FontWeight.normal, Colors.black)
                            , Txt("  ¤ Échange : Pour ceux qui préfèrent un échange, les frais de livraison pour l’envoi du nouvel article sont gratuits pour les membres de notre groupe Facebook ou WhatsApp et a votre charge si pas encors.", 15, FontWeight.normal, Colors.black)
                            ,SizedBox(height: 10,)
                            , Txt("N’hésitez pas à nous contacter pour toute question supplémentaire !", 20, FontWeight.normal, Colors.black)
                          ],
                        ),
                        SizedBox(height: 15,),
                        ExpansionTile(
                          title: Text('Les Moynes de payement'),

                          leading: Icon(Icons.monetization_on , color: Colors.black,),
                          children: [
                            Txt("Nous acceptons toutes les principales cartes de crédit (VISA, MasterCard, AMEX) ainsi que les paiements par Mobile Money (Moov , MTN, Celtics ou autres) soldez ou payez en deux tranches.", 15, FontWeight.normal, Colors.black)
                          ],
                        ),

                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),










                  // deuxieme couche
                  Center(
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 10,
                        ),

                        // containare des images produit
                        Container(
                          decoration: BoxDecoration(
                            boxShadow: const [
                              BoxShadow(
                                  offset: Offset(5, 5),
                                  color: Colors.black,
                                  blurRadius: 15,
                                  spreadRadius: 3),
                              BoxShadow(
                                  offset: Offset(-5, -5),
                                  color: Colors.white,
                                  blurRadius: 15,
                                  spreadRadius: 3),
                            ],
                            image: const DecorationImage(
                                image: NetworkImage(
                                 // 'https://i.postimg.cc/g099JZcT/419f1ee36d887a65dc7268ddd3b42bec.jpg'
                                    'https://i.postimg.cc/7LwYtdv9/1d8a884dec3992018cd6b5807e6966c5.jpg'
                                ),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(30),

                          ),
                          height: 280,
                          width: 250,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(30),
                            child: PageView(
                              scrollDirection: Axis.horizontal,
                                children: [
                                  SizedBox(
                                    height: 280,
                                    width: 260,
                                    child: descimage(widget.image1,context),
                                  ),
                                  SizedBox(
                                    height: 280,
                                    width: 260,
                                    child: descimage(widget.image2 ,context),
                                  ),
                                  SizedBox(
                                    height: 280,
                                    width: 260,
                                    child: descimage(widget.image3 , context),
                                  ),
                                ],

                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }






}
Widget descimage(String image, BuildContext context) {
  return GestureDetector(
    onTap: () {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(

            content: CachedNetworkImage(imageUrl: image,),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Ferme le dialog
                },
                child: Text('OK'),
              ),
            ],
          );
        },
      );
    },
    child: CachedNetworkImage(
      imageUrl: image,
      fit: BoxFit.cover,
      placeholder: (context, url) =>  LoadingAnimationWidget.flickr(
        leftDotColor: Colors.brown.shade200,
        rightDotColor: Colors.black,
        size: 50,
      ),
      errorWidget: (context, url, error) => Icon(Icons.error),
    ),
  );
}

Txt(String txt, double sze, var bld, var clr) {
  return Text(
    txt,
    style: TextStyle(
      fontSize: sze,
      fontWeight: bld,
      color: clr ?? Colors.white,
    ),
  );
}


carousepreuve() {
  List<Map<String, dynamic>> productsp = [
    {
      'image': 'https://i.postimg.cc/tJ93Pc61/IMG-20240918-WA0006.jpg',

    },
    {
      'image': 'https://i.postimg.cc/4Nb0DCP0/whatsapp-chat.jpg',

    },
    {
      'image': 'https://i.postimg.cc/5NhRQ40j/IMG-20240711-WA0016.jpg',

    },
    {
      'image': 'https://i.postimg.cc/jSx1K8kS/whatsapp-chat-2.jpg',

    },
    {
      'image': 'https://i.postimg.cc/KvkWYkmd/IMG-20240711-WA0018.jpg',

    },
    {
      'image': 'https://i.postimg.cc/CKm77SFG/IMG-20240711-WA0029.jpg',

    },
    {
      'image': 'https://i.postimg.cc/tJ93Pc61/IMG-20240918-WA0006.jpg',

    },


    // Ajoutez plus de produits ici
  ];

  return CarouselSlider(
    options: CarouselOptions(
      viewportFraction: 0.5,
      height: 400.0,
      enableInfiniteScroll: true,
      autoPlay: true,
      enlargeCenterPage: false,
      autoPlayCurve: Curves.linear,
    ),
    items: productsp.map((product) {
      return Builder(
        builder: (BuildContext context) {
          return Container(
            width: 200,
            margin: EdgeInsets.symmetric(horizontal: 5.0),
            decoration: BoxDecoration(),
            child: GestureDetector(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.network(
                    product['image'],
                    fit: BoxFit.cover,
                    height: 300,
                  ),

                ],
              ),
            ),
          );
        },
      );
    }).toList(),
  );
}
