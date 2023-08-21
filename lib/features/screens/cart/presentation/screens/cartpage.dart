import 'package:flutter/material.dart';
import 'package:food_app/features/screens/drawer/bottom_nav.dart';

class CartPage extends StatefulWidget {
  final String image;
  final String text;
  final String amount;

  const CartPage({Key? key, required this.amount, required this.image, required this.text})
      : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int item = 1;
  late final int productprice;
  late double finalprice;

  void increment() {
    setState(() {
      item++;
      finalprice = double.parse(widget.amount) * item;
    });
  }

  void decrement() {
    setState(() {
      // item--;
      if (item == 1) {
      } else {
        item--;
        finalprice = double.parse(widget.amount) * item;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    finalprice = double.parse(widget.amount);
  }

  final List<String> price = [
    '20',
    '16',
    '16',
  ];
  final image = [
    'assets/png/1.png',
    'assets/png/2.png',
    'assets/png/3.png',
  ];
  final double delivery = 7;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
            // const AppBarTitle(),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              child: Text(
                'Order List',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  // for (int i = 0; i < image.length; i++)
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    child: Container(
                      height: 100,
                      width: 380,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 10,
                                spreadRadius: 3,
                                color: Colors.grey.withOpacity(0.2),
                                offset: const Offset(0, 3))
                          ],
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              alignment: Alignment.center,
                              child: Image.asset(
                                widget.image,
                                height: 120,
                                width: 100,
                              ),
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 10),
                            width: 190,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                const Text(
                                  'Trending sneakers',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                const Text(
                                  'We provide great wears,100% customer satisfaction',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                                Row(
                                  children: [
                                    const Text(
                                      '\$',
                                      style: TextStyle(color: Colors.red),
                                    ),
                                    Text(
                                      finalprice.toString(),
                                      style: const TextStyle(color: Colors.red),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 5),
                          //   child: Container(
                          //     padding: const EdgeInsets.all(5),
                          //     decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(20),
                          //         color: Colors.red),
                          //     child: Column(
                          //       mainAxisAlignment:
                          //           MainAxisAlignment.spaceBetween,
                          //       children: [
                          //         CircleAvatar(
                          //           radius: 13,
                          //           backgroundColor: Colors.white24,
                          //           child: InkWell(
                          //             onTap: () => increment(),
                          //             child: const Icon(
                          //               Icons.add,
                          //               size: 18,
                          //               color: Colors.white,
                          //             ),
                          //           ),
                          //         ),
                          //         Text(
                          //           '$item',
                          //           style: const TextStyle(
                          //               fontSize: 14, color: Colors.white),
                          //         ),
                          //         CircleAvatar(
                          //           radius: 13,
                          //           backgroundColor: Colors.white24,
                          //           child: InkWell(
                          //             onTap: () => decrement(),
                          //             child: const Icon(
                          //               Icons.remove,
                          //               size: 18,
                          //               color: Colors.white,
                          //             ),
                          //           ),
                          //         ),
                          //       ],
                          //     ),
                          //   ),
                          // ),
                          const InkWell(

                              child: Icon(
                            Icons.cancel,
                          ))
                        ],
                      ),
                    ),
                  ),
                  // const Spacer(),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(
                  //       horizontal: 20, vertical: 30),
                  //   child: Container(
                  //     // height: 100,
                  //     decoration: BoxDecoration(
                  //         color: Colors.white,
                  //         borderRadius: BorderRadius.circular(10),
                  //         boxShadow: [
                  //           BoxShadow(
                  //               color: Colors.grey.withOpacity(0.2),
                  //               blurRadius: 10,
                  //               spreadRadius: 2,
                  //               offset: Offset(0, 3))
                  //         ]),
                  //     child: Padding(
                  //       padding: EdgeInsets.all(10.0),
                  //       child: Column(
                  //         children: [
                  //           Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 vertical: 10, horizontal: 10),
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 const Text(
                  //                   ' Number Of Items ',
                  //                   style:
                  //                       TextStyle(fontWeight: FontWeight.w500),
                  //                 ),
                  //                 Text(
                  //                   '$item',
                  //                   style: const TextStyle(
                  //                       fontWeight: FontWeight.w600),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           const Divider(
                  //             color: Colors.black,
                  //           ),
                  //           Padding(
                  //             padding: const EdgeInsets.symmetric(
                  //                 vertical: 10, horizontal: 10),
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text('Sub Total'),
                  //                 Row(
                  //                   children: [
                  //                     const Text('\$',
                  //                         style: TextStyle(
                  //                             fontSize: 17, color: Colors.red)),
                  //                     Text(
                  //                       finalprice.toString(),
                  //                       style: const TextStyle(
                  //                           fontSize: 17, color: Colors.red),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //           const Divider(
                  //             color: Colors.grey,
                  //           ),
                  //           const Padding(
                  //             padding: EdgeInsets.symmetric(
                  //                 vertical: 10, horizontal: 10),
                  //             child: Row(
                  //               mainAxisAlignment:
                  //                   MainAxisAlignment.spaceBetween,
                  //               children: [
                  //                 Text(
                  //                   'Delivery',
                  //                 ),
                  //                 Text('\$7'),
                  //               ],
                  //             ),
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                ],
              ),
            )
          ],
        ),
        bottomSheet: BottomAppBar(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: const BoxDecoration(),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const Text(
                      'Total:',
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    Row(
                      children: [
                        const Text(
                          "\$",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.red),
                        ),
                        Text(
                          finalprice.toString(),
                          style: const TextStyle(
                              fontWeight: FontWeight.w500,
                              fontSize: 18,
                              color: Colors.red),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  width: 15,
                ),
                ElevatedButton(
                    style: ButtonStyle(
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20))),
                        padding: MaterialStateProperty.all(
                            const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 15)),
                        backgroundColor: MaterialStateProperty.all(Colors.red)),
                    onPressed: () {},
                    child: const Text('Order Now'))
              ],
            ),
          ),
        ));
  }
}
