
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';



class Compte extends StatelessWidget {
  final String nomuser ;
  Compte({super.key, required this.nomuser,});

  List<FlSpot> lineChartData = [
    const FlSpot(0, 2),
    const FlSpot(1, 3),
    const FlSpot(2, 5),
    const FlSpot(3, 1),
    const FlSpot(4, 4),
  ];


  int c = DateTime.now().minute;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(

      ) ,
      backgroundColor: const Color(0xFFB0ADB0),
      floatingActionButton: IconButton(
        hoverColor: Colors.white,
        onPressed: () {
          Navigator.of(context).pop();
        },
        icon: const Icon(Icons.arrow_back_ios, size: 30,),
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
                              child: Text('Alors cher $nomuser,Quand passerez-vous votre prochaine commande!' ,style: const TextStyle(color: Colors.white),),
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
                              child: Text('$nomuser nous nous occupons de tout !' ,style: const TextStyle(color: Colors.white),),
                            )
                          ],
                        ),
                      )



                    ],
                  ),
                ),

                const SizedBox(height: 40,),

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