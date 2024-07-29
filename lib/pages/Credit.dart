import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
import 'package:url_launcher/url_launcher.dart';

final Uri _url = Uri.parse(
    'https://web.facebook.com/fesneakers?_rdc=1&_rdr');
final Uri _url2 = Uri.parse('https://wa.me/22955950259');

class Credit extends StatefulWidget {
  final String image;

  final String code;

  final String nom;


  final String prix;

  const Credit(
      {super.key, required this.image, required this.code, required this.nom, required this.prix});

  @override
  State<Credit> createState() => _CreditState();
}

class _CreditState extends State<Credit> {
  TextEditingController nom_ctrl = TextEditingController();
  TextEditingController qte_ctrl = TextEditingController();
  TextEditingController region_ctrl = TextEditingController();
  TextEditingController numero_ctrl = TextEditingController();

  Future<void> _launchUrl() async {
    if (!await launchUrl(_url)) {
      throw Exception('Could not launch $_url');
    }
  }

  Future<void> _launchUrl2() async {
    if (!await launchUrl(_url2)) {
      throw Exception('Could not launch $_url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Validé ma commande'),

      ),
      backgroundColor: const Color(0xFFE5D6C8),
      floatingActionButton: IconButton(

        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black87)),
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(
          Icons.arrow_back_ios,
          size: 30,
          color: Colors.white,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                      height: 180,
                      width: 280,

                      child:
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl:'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/Productsload%2Fpub%2F19059300_6048107.jpg?alt=media&token=65bf0f95-4376-42f9-a3f6-c90a76725b57' ,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const CircularProgressIndicator(),
                          errorWidget: (context, url, error) => const Icon(Icons.error),

                        ),
                      )



                  ),
                  Container(
                    margin: const EdgeInsets.all(15),
                    padding: const EdgeInsets.all(5),
                    width: 300,
                    decoration: BoxDecoration(
                      color: Colors.white70,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                            height: 80,
                            width: 100,
                            child: Image.network(widget.image)),
                        Column(
                          children: [
                            Text(widget.nom),
                            Text(widget.code),
                            Text(widget.prix),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    height: 380,
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.8)),
                    child: Column(
                      children: [
                        TextFormField(
                          controller: nom_ctrl,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            hintText: 'Nom du destinataire du colis',
                            suffixIcon: const Icon(Icons.person_outline),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: region_ctrl,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Addresses d'expedition",
                            suffixIcon:
                            const Icon(Icons.location_on_sharp),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: qte_ctrl,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: "Quatité",
                            suffixIcon:
                            const Icon(Icons.confirmation_num_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        TextFormField(
                          controller: numero_ctrl,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10)),
                            hintText: 'N°whatsapp ou contact',
                            suffixIcon: const Icon(Icons.phone_outlined),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        ElevatedButton.icon(
                            onPressed: () {
                              Get.defaultDialog(
                                  title: 'Petite vérification verifié',
                                  content: Column(
                                    children: [
                                      Text(
                                          'Livraison de ${qte_ctrl.text}  ${widget.nom} à ${nom_ctrl.text} dans la region de  ${region_ctrl.text}  joignable au ${numero_ctrl.text}   '),
                                      ElevatedButton.icon(
                                        onPressed:(){
                                          Get.defaultDialog(content: const CircularProgressIndicator());
                                          Envoye_de_commande();

                                        },

                                        label: const Text(
                                          'Validé',
                                          style: TextStyle(color: Colors.green),
                                        ),
                                        icon: const Icon(CupertinoIcons.paperplane ,color: Colors.green,),
                                      )
                                    ],
                                  ));
                            },
                            label: const Text('Commandre'),
                            icon: const Icon(
                              Icons.security_sharp,
                              color: Colors.green,
                            ))
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                    child: Text('Conactez nous'),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    margin: const EdgeInsets.all(10),
                    width: 300,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: _launchUrl2,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            height: 118,
                            width: 118,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                CachedNetworkImage(imageUrl:  'https://i.postimg.cc/CKkVvfGG/Untitled-image-6.png',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                )



                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        InkWell(
                          onTap: _launchUrl,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10)),
                            height: 100,
                            width: 100,
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child:
                                CachedNetworkImage(imageUrl:  'https://cdn.pixabay.com/photo/2015/07/13/07/41/icons-842893_1280.png',
                                  fit: BoxFit.cover,
                                  placeholder: (context, url) => const CircularProgressIndicator(),
                                  errorWidget: (context, url, error) => const Icon(Icons.error),
                                )

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

  Envoye_de_commande() async {
    DateTime date = DateTime.now();
    Get.back();
    try {
      var res = await http.post(
          Uri.parse('https://www.fe-store.pro/commande.php'),
          body: {
            "nom": nom_ctrl.text,
            "numero": numero_ctrl.text,
            "date": '$date',
            "commande":
            'Produit ${widget.image} nom ${widget.nom} code ${widget.code}',
            "address": region_ctrl.text,
            "quantite": qte_ctrl.text
          });

      print(jsonDecode(res.body));
      if (res.statusCode == 200) {
        var responseBodyOfSignUp = jsonDecode(res.body);
        if (responseBodyOfSignUp['success'] == true) {
          Get.back();
          Get.defaultDialog(title : 'Felicitation'  ,content: const Icon(Icons.offline_pin ,color: Colors.green,));
        } else {
          Fluttertoast.showToast(msg: "${responseBodyOfSignUp['message']}");
        }
      } else {
        // Gérer les cas où le code de statut HTTP n'est pas 200 (OK)
        Fluttertoast.showToast(msg: "Erreur de connexion au reseaux");
        var responseBodyOfSignUp = jsonDecode(res.body);
        Fluttertoast.showToast(msg: "${responseBodyOfSignUp['message']}");
      }
    } catch (e) {
      // Gérer les erreurs ici
      print(e.toString());
      Fluttertoast.showToast(msg: "Une erreur ");
    }
  }
}
