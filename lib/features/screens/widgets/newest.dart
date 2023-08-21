import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Newest extends StatefulWidget {
  const Newest({Key? key}) : super(key: key);

  @override
  State<Newest> createState() => _NewestState();
}

class _NewestState extends State<Newest> {
  // final List<String> image = [
  // ];
  final List <String>image = [
    'assets/png/1.png',
    'assets/png/2.png',
    'assets/png/3.png',
    'assets/png/4.png',
    'assets/png/5.png',
    'assets/png/6.png',
    'assets/png/7.png',
    'assets/png/8.png',
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

  final List<String> text = [
    'Office shoe',
    'Joggers',
    'Joggers',
    'Corporate shoe',
    'Joggers shoe',
    'Short',
    'Sleeveless Shirt',
    'Corporate Wears',
    'Joggers',
    'TrackSuit',
    'Office shoe',
    'Joggers',
    'Joggers',
    'Corporate shoe',
    'Joggers shoe',
    'Short',
    'Sleeveless Shirt',
    'Corporate Wears',
    // 'Joggers',
    // 'TrackSuit'
  ];

  late bool iscliked=false;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Column(
        children: [
          for (int index = 0; index < image.length; index++)
            InkWell(
              onTap: (){

              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Container(
                  width: 380,
                  height: 150,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 10,
                            offset: Offset(0, 3))
                      ]),
                  child: Expanded(
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {},
                          child: Container(
                            alignment: Alignment.center,
                            child: Image.asset(
                              image[index],
                              height: 120,
                              width: 120,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          width: 190,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                text[index],
                                style: const TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              const Text(
                                'Taste our Cool drink, we provide greate drinks',
                                style: TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              RatingBar.builder(
                                initialRating: 4,
                                minRating: 1,
                                itemCount: 5,
                                itemSize: 18,
                                glowColor: Colors.yellow,
                                allowHalfRating: true,
                                direction: Axis.horizontal,
                                itemPadding: EdgeInsets.symmetric(horizontal: 4),
                                onRatingUpdate: (index) {},
                                itemBuilder: (BuildContext context, int index) {
                                  return const Icon(
                                    Icons.star,
                                    size: 10,
                                    color: Colors.red,
                                  );
                                },
                              ),
                              const Text(
                                '\$18',
                                style: TextStyle(
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                            ],
                          ),
                        ),
                         Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              InkWell(
                                onTap:(){
                                  setState(() {
                                    iscliked=iscliked;
                                  });
                                },
                                child: iscliked?const Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                ):const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                ),
                              ),
                               InkWell(
                                 onTap: (){
                                   setState(() {
                                     iscliked=!iscliked;
                                   });
                                 },
                                child:iscliked? const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.green,
                                ): const Icon(
                                  Icons.shopping_cart,
                                  color: Colors.red,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    ));
  }
}
