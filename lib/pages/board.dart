
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:lottie/lottie.dart';



class Compte extends StatefulWidget {
  final String nomuser ;
  const Compte({super.key, required this.nomuser});

  @override
  State<Compte> createState() => _CompteState();
}

class _CompteState extends State<Compte> {
  @override

  List<FlSpot> lineChartData = [
    const FlSpot(0, 2),
    const FlSpot(1, 3),
    const FlSpot(2, 5),
    const FlSpot(3, 1),
    const FlSpot(4, 4),
  ];
  int c = DateTime.now().minute;
  final coin = Hive.box('mybox2');


  Future<void> reward() async {
    // Crée un flux qui émet un événement toutes les 3 secondes
    final myPeriod = Stream.periodic(const Duration(seconds: 1), (count) => count);

    int i = 10;
    if(coin.get(1)== null) {
      coin.put(1, 2);
    } else{


        // Écoute les événements émis par le flux
        final tap = myPeriod.listen((event) {
          // Incrémente le compteur 'i' de 1 à chaque événement


          setState(() {
            int  a = coin.get(1);
            a = a + i;
            if (a < 20*c  ) {
            coin.put(1, a);
          }
            else{
              coin.put(1, 2);
            }
        });
          // Affiche la nouvelle valeur de 'i'
          print(i);
        });

        // Optionnellement, annule l'écoute après 30 secondes
        Future.delayed(const Duration(seconds: 30), () {
          tap.cancel();
          print('Listener cancelled');
        });


  }

  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    reward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

        title: Text('Votre sotre est activer en mode basic' , style: TextStyle(fontSize: 18),),
        leading: Icon(Icons.offline_pin_outlined, color:Colors.blue,
        ),
      ) ,
      backgroundColor: const Color(0xFFE5D6C8),
      floatingActionButton: IconButton(
        hoverColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios, size: 30, color: Colors.white,),
      ),
      body: SafeArea(


        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(5),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(

                        decoration: BoxDecoration(
                            border: Border.all(width: 2 ,color: Colors.white),

                            color: Colors.black45,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        height: 200,
                        width:  157,
                        child:  Stack(
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child:
                              Image.network('https://i.postimg.cc/rmGgRFPT/smartmockups-luwxgvhb.jpg' , fit: BoxFit.cover,width: double.infinity,),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 98),
                              child: Text('Alors cher ${widget.nomuser},Quand passerez-vous votre prochaine commande!' ,style: const TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                      ),


                      // container de la lottie
                      Container(

                        decoration: BoxDecoration(
                            border: Border.all(width: 2 , color: Colors.white),
                            color: Colors.indigoAccent,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        height: 200,
                        width: 130,
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: LottieBuilder.network('https://lottie.host/68630fc9-9eeb-406d-9c24-569dff465bd7/jGAQNA4cfC.json')),

                            Padding(
                              padding: const EdgeInsets.only(left: 8.0, top: 125),
                              child: Text('${widget.nomuser} nous nous occupons de tout !' ,style: const TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                      )



                    ],
                  ),
                ),

                const SizedBox(
                child: Text('La Fluctuation des commande est mis ajoure a chaque instant ! '),),

                Container(width: 355,
                  height: 140,
                  margin: const EdgeInsets.only(top: 10),
                  decoration: BoxDecoration(
                      boxShadow: [

                        const BoxShadow(
                            offset: Offset(5,5),
                            color: Colors.white,
                            blurRadius: 15,
                            spreadRadius: 1
                        ),
                        BoxShadow(

                            offset: const Offset(-5,- 5),
                            color: Colors.grey.shade500,
                            blurRadius: 15,
                            spreadRadius: 1
                        ),
                      ],

                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(width: 2 ,color: Colors.white),
                      color: Colors.white.withOpacity(0.6)
                  ),


                  child:  Padding(
                    padding:  const EdgeInsets.all(0),
                    child: SimpleLineChart(
                      data: [
                         const FlSpot(1, 2),
                         const FlSpot(1, 7),
                        FlSpot(2,c*0.8),
                        const FlSpot(3,5 ),
                        const FlSpot(4, 4),
                      ],
                    ),
                  ),


                ),

                const SizedBox(height: 40,),


                Container(

                    padding: const EdgeInsets.all(10),
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(20)
                    ),
                    height: 200,
                    width: 450,

                    child: Stack(
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network('https://cdn.pixabay.com/photo/2023/05/18/05/53/sneakers-8001394_1280.jpg' , fit: BoxFit.cover, width: double.infinity,)),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: Colors.white.withOpacity(0.6),
                              border: Border.all(color: Colors.white)
                          ),
                          height: 200,
                          width: 450,
                          padding: const EdgeInsets.all(10),

                        ),
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(" Bienvenue chez Fé 😎 !   "

                                'Fé est bien plus qu\'une entreprise : c\'est une communauté où vous pouvez '
                                'explorer et commander vos produits préférés en toute tranquillité. Faites'
                                ' confiance à notre sélection et à notre service pour vous offrir une expérience '
                                'shopping exceptionnelle.'

                                ' Rejoignez-nous et découvrez la différence Fé !'
                            ),
                          ),
                        ),
                      ],
                    )



                ),
                
                Container(
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.yellow,
                  ),
                  child: Text('Reward programme '),
                ),
                
                Container(

                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),

                    image: DecorationImage(image: NetworkImage('https://i.postimg.cc/1tZtM5xJ/3d-Gold-Award-Ceremony-Wallpaper-Background-Wallpaper-Image-For-Free-Download-Pngtree.png'),fit: BoxFit.cover)
                  ),
                  child: Stack(
                    children: [
                      Center(
                        child: SizedBox(
                            height: 250,
                            child: LottieBuilder.network('https://lottie.host/49b89537-0cd0-4c8e-95f1-e2bbafaa1d7e/rtbRja4rKd.json')),
                      ),
                      Center(child: Text('${coin.get(1)} XOF' ,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),))
                    ],
                  ),
                  
                  
                )








              ],
            ),
          ),
        ),
      ),
    );
  }












}














class SimpleLineChart extends StatelessWidget {
  final List<FlSpot> data;

  const SimpleLineChart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Container(



      child: LineChart(
        LineChartData(
          lineBarsData: [
            LineChartBarData(
              shadow: Shadow(
                color: Colors.blue.withOpacity(0.3), // Couleur de l'ombre et opacité
                offset: const Offset(0, 4), // Décalage de l'ombre
                blurRadius: 6, // Flou de l'ombre
              ),
              spots: data,
              gradient: const LinearGradient(colors:
              [
                Colors.redAccent,
                Colors.yellow,
              ]

              ),
              isCurved: true,

              isStrokeCapRound: true,

              // Makes the line smooth and curved
              color: Colors.blue,
              barWidth: 4, // Thickness of the line

              dotData: const FlDotData(show: true),

              belowBarData: BarAreaData(
                show: true,
                gradient: LinearGradient(
                  colors: [
                    ColorTween(begin:Colors.redAccent, end: Colors.yellow)
                        .lerp(0.9)!
                        .withOpacity(0.9),
                    ColorTween(begin: Colors.blue, end: Colors.yellow)
                        .lerp(0.9)!
                        .withOpacity(0.7),
                  ],
                ),
              ),// Shows data points
            ),
          ],
        ),
      ),
    );
  }
}