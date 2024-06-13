import 'package:fesneakers/api_ctrl/get_ctrl/card.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';




class cardpage extends StatefulWidget {
  final String useremail;

  const cardpage({super.key, required this.useremail});

  @override
  State<cardpage> createState() => _cardpageState();
}

class _cardpageState extends State<cardpage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: IconButton(
        style: ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.black87)),
        icon: const Icon(
          Icons.arrow_back_ios_new,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
      ),
      appBar: AppBar(
        leading: const Icon(Icons.shopify_rounded),
        title: const Text(
          'Panier',
          style: TextStyle(fontSize: 30),
        ),

          actions: [
            LottieBuilder.network('https://lottie.host/edebbfaa-0103-44a2-af14-40340146e7cb/fcCkJvHaFn.json')
          ],


      ),
      backgroundColor: const Color(0xFFB0ADB0),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               AnimatedContainer(
                  duration: Duration(seconds: 2),
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.white)),
                    height: 510,
                    width:400,
                    child:ListCard(userpass: widget.useremail)
                ),
                const SizedBox(
                  height: 10,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
