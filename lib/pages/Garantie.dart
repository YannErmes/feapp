import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';




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
        title: Text('NOS GARANTIE' ,style: TextStyle(color: Colors.green),),
      ),
      body: 
      SafeArea(child:
        Stack(
          children: [
            CachedNetworkImage(imageUrl: 'https://images.pexels.com/photos/7228053/pexels-photo-7228053.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2' , fit: BoxFit.cover, height: double.infinity,)

         ,

            Center(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [

                    Center(
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        margin: EdgeInsets.symmetric(horizontal: 12),

                        width: 400,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.7),
                            border: Border.all(width: 1, color: Colors.white),
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: CachedNetworkImage(
                                imageUrl: 'https://firebasestorage.googleapis.com/v0/b/febase-a80cd.appspot.com/o/t.png?alt=media&token=44b9e999-db2a-46a6-b8bf-47205c4540db',
                                placeholder: (context, url) => CircularProgressIndicator(),height: 200,

                              ),
                            ),
                            txt('Pour tout article avec prix de livraison  '
                                'la livraison devient gratuite en cas de non respect des livreurs du delais (jours)\n '
                                'de livraison convenue.'),
                            txt('Pour tout article  livraison  gratuite , '
                                'bénéficier d\'une remise de 5% en cas de non respect du\n delais (jours)\n '
                                'de livraison convenue.'),
                            txt('Remise systématique de 5%  et cas non comformité de l\'article.'),
                            txt('Si vous changé d\'avis beneficié d\'une  possibilité de rechange de l\'article 2 fois sur une '
                                ' periode de 7 jours si  l\'article est toujours intacte.')
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        )






        ,),
    );
  }
  txt (String text){
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(Icons.offline_pin_rounded ,color: Colors.green,),
        Expanded(child: Text(text, style: TextStyle(fontSize: 16 ,fontWeight: FontWeight.bold),)),
      ],
    );
  }
}
