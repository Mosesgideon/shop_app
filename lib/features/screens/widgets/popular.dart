import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/screens/item_page/presentation/item_page.dart';

class Popular extends StatefulWidget {
  const Popular({Key? key}) : super(key: key);

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  final List<String> text = [
    'TrackSuit',
    'Corporate Trouser',
    'T-Shirt',
    'Joggers shoe',
    'Suit',
    'Corporate Shoe',
    'TrackSuit',
    'Corporate Trouser',
    'Corporate Trouser',
    'Suit',
    'Corporate Shoe',
    'Corporate trouser',
    'Joggers',
    'Corporate shoe',
    'T-Shirt',
    'Sleeveless Shirt',
    'Corporate Wears',
    // 'Joggers',
    // 'TrackSuit'
  ];
  final List<String> price = [
    '20',
    '16',
    '16',
    '10',
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
    'assets/png/21.png',
    'assets/png/22.png',
    'assets/png/23.png',
    'assets/png/24.png',
    'assets/png/25.png',
    'assets/png/26.png',
    'assets/png/27.png',
    'assets/png/28.png',
    'assets/png/29.png',
    'assets/png/30.png',
    'assets/png/31.png',
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: GridView.builder(
          itemCount: 17,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              childAspectRatio: 12 / 16,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              crossAxisCount: 2),
          itemBuilder: (context, index) => InkWell(
            onTap: () => Navigator.of(context).push(CupertinoPageRoute(
                builder: (ctx) => ItemPage(
                      image: image[index],
                      price: price[index],
                      text: text[index],
                    ))),
            child: Container(
                height: 300,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          offset: const Offset(0, 3),
                          spreadRadius: 2,
                          blurRadius: 2)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 5),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Center(
                              child: Image(
                                  height: 100, image: AssetImage(image[index])),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              text[index],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 17),
                            ),
                            const Text(
                              'Buy popular wears',
                              style: TextStyle(fontSize: 14),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    const Text(
                                      "\$",
                                      style: TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      price[index],
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                                const Icon(
                                  Icons.favorite_outline,
                                  color: Colors.red,
                                )
                              ],
                            ),
                          ]),
                    ),
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
