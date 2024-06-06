import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

class ProductPage extends StatelessWidget {
  const ProductPage({super.key});

  @override
  Widget build(BuildContext context) {
   // refference
    final fav = Hive.box('mybox');
    // write data
    void writebox (){
      fav.put(1, 'yanno');
      fav.put(4, 'yanno4');
      fav.put(5, 'yanno5');

    }
// red
    void redbox (){
     print( fav.get(1));
     print( fav.get(4));
     print( fav.get(5));


    }
// dele
    void delbox (){
     print( fav.delete(1));


    }




    return Scaffold(
backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: const Icon(Icons.menu),
        actions: const [
          Icon(Icons.search),
          SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: Column(
                  children: [
                    const Text(
                      'NIKE',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'React Element 55',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Text(
                      'Premium Laser Fuchsia',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Container(
                      padding: const EdgeInsets.all(20),

                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Colors.grey,
                          boxShadow: const [
                            BoxShadow(offset: Offset(5, 5), color: Colors.black,
                            blurRadius: 15,
                            spreadRadius: 1),
                            BoxShadow(offset: Offset(-5, -5), color: Colors.white,
                                blurRadius: 15,
                                spreadRadius: 1),
                          ]),
                      child: Image.network(
                        'https://i.postimg.cc/0QgNY185/url-https-california-times-brightspot-s3-amazonaws-com-b3-10-10c245034893adf233fc1cf3071a-1351750.jpg',
                        height: 200,
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Color:',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        SizedBox(width: 8),
                        CircleAvatar(backgroundColor: Colors.red, radius: 12),
                        SizedBox(width: 8),
                        CircleAvatar(backgroundColor: Colors.green, radius: 12),
                        SizedBox(width: 8),
                        CircleAvatar(backgroundColor: Colors.blue, radius: 12),
                      ],
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Size:',
                          style: TextStyle(color: Colors.white, fontSize: 16),
                        ),
                        const SizedBox(width: 8),
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text(
                            '47',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(Icons.star, color: Colors.yellow, size: 24),
                    Icon(Icons.star, color: Colors.yellow, size: 24),
                    Icon(Icons.star, color: Colors.yellow, size: 24),
                    Icon(Icons.star, color: Colors.yellow, size: 24),
                    Icon(Icons.star_border, color: Colors.yellow, size: 24),
                  ],
                ),
                Text(
                  'EUR 125.90',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FloatingActionButton(
                  onPressed: writebox,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.tab),
                ),


                FloatingActionButton(
                  onPressed: redbox,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.add),
                ),
                FloatingActionButton(
                  onPressed: delbox,
                  backgroundColor: Colors.green,
                  child: const Icon(Icons.shopping_cart),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
