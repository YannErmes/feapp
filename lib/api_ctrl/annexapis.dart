import 'dart:convert';

import 'package:fesneakers/pages/home.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as https;

class card_ctrl extends GetxController {

  //les fonction du panier




  delete_panier(
      String  usernom,
      String id ,
      var context ,

      )async{
    var Url = Uri.parse('https://www.fe-store.pro/delet_card.php');
    var response = await https.post(Url,
        body: {
          'eid':'$id' ?? 'pas',
          'userpass':'$usernom'?? 'pas',

        });

    if (response.statusCode == 200)
    {
      var responsecorps = jsonDecode(response.body);

      if( responsecorps['success']==true){
        print('validé');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,
            content:Text(responsecorps['message']) ));

      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,
            content:Text(responsecorps['message']) ));

      }


    }else {
      print ('une erreur');

    }

    return print(jsonDecode(response.body)["message"]);


  }












  envoiecommande(
      String  usernom,
      String  adresse ,
      String  commentaire ,
      String  numero ,
      List<dynamic> lescommandes,
      var context



      )async{
    DateTime date = DateTime.now();
    var Url = 'https://www.fe-store.pro/web_add_commande.php';
    var response = await https.post(Uri.parse(Url),
        body: {
          'usernom':'$usernom',
          'adresse':'$adresse',
          'commandes' : '$lescommandes',
          'numero' : '$numero',
          'commentaire':'$commentaire',
          'date' : '$date'

        });

    if (response.statusCode == 200)
    {
      var responsecorps = jsonDecode(response.body);

      if( responsecorps['success']== true){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.green,
            content:
            Text('Félicitation votre commnde a bien été enregistré avec succés')));
        Navigator.push(context, MaterialPageRoute(builder: (context) => homepage(t: 1),));

        return 'true';
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,
            content:
            Text('Oups! une erreur s\'est prosuite , veillez verifier votre connection et réessayer')));
        return 'false';
      }


    }else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.red,
          content:
          Text('Oups! une erreur s\'est prosuite , veillez verifier votre connection et réessayer')));

      return 'false';

    }






  }


  showpanier (String userid)async{


    var Url = 'https://www.fe-store.pro/web_view_panier.php';

    var response = await https.post(Uri.parse(Url),
        body:  {
          'userid' : '$userid'
        });

    if(response.statusCode == 200){

      var resbody  = jsonDecode(response.body);
      if(resbody['success']== true){

        List<dynamic> panierlist = resbody['todos'];
        //  Map<dynamic,dynamic> paniermap = panierlist ;
        print(panierlist);


      }
      else {
        return ["${Text('${resbody['message']}')}"];
      }


    }else {

      return ["message errreur"];
    }




  }


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