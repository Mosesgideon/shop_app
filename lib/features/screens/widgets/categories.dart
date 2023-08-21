import 'package:flutter/material.dart';

class Categories extends StatefulWidget {
  const Categories({Key? key}) : super(key: key);

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final  image = [
    'assets/png/2.png',
    'assets/png/3.png',
    'assets/png/7.png',
    'assets/png/8.png',
    'assets/png/16.png',
    'assets/png/17.png',
    'assets/png/20.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 5),
        child: Row(
          children: [
            for (int index = 0; index < image.length; index++)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                ),
                child: Container(
                  height: 50,
                  width: 50,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(image[index]), fit: BoxFit.cover),
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow:  [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: Offset(0, 3))
                      ]),
                ),
              )
          ],
        ),
      ),
    );
  }
}
