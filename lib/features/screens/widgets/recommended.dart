import 'package:flutter/material.dart';

class Recommended extends StatefulWidget {
  const Recommended({Key? key}) : super(key: key);

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  final List<String> price = [
    '20',
    '16',
    '25',
    '10',
    '15',
    '17',
    '20',
    '16',
    '16',
    '16',
    '10',
    '25',
    '10',
    '15',
    '17',
  ];
  final image = [
    'assets/png/1.png',
    'assets/png/2.png',
    'assets/png/3.png',
    'assets/png/9.png',
    'assets/png/10.png',
    'assets/png/13.png',
    'assets/png/14.png',
    'assets/png/15.png',
    'assets/png/16.png',
    'assets/png/17.png',
    'assets/png/18.png',
    'assets/png/19.png',
    'assets/png/20.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          for (int i = 0; i < image.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
              child: SizedBox(
                height: 100,
                child: Container(
                  width: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            blurRadius: 2,
                            spreadRadius: 2,
                            offset: const Offset(0, 3))
                      ]),
                  child: Column(
                    children: [
                      const SizedBox(height: 5,),
                      Image(
                          height: 60, width: 100, image: AssetImage(image[i])),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Icon(
                              Icons.favorite_outline,
                              color: Colors.red,
                            ),
                            Row(
                              children: [
                                const Text(
                                  "\$",
                                  style: TextStyle(color: Colors.red),
                                ),
                                Text(
                                  price[i],
                                  style: const TextStyle(color: Colors.red),
                                ),

                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
