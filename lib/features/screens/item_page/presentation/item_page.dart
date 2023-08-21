import 'package:clippy_flutter/arc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import '../../widgets/recommended.dart';

class ItemPage extends StatefulWidget {
  final String image;
  final String price;
  final String text;

  const ItemPage(
      {Key? key, required this.image, required this.price, required this.text})
      : super(key: key);

  @override
  State<ItemPage> createState() => _ItemPageState();
}

class _ItemPageState extends State<ItemPage> {
  int item = 1;
  late final int productprice;
  late double finalprice;

  void increment() {
    setState(() {
      item++;
      finalprice = double.parse(widget.price) * item;
    });
  }

  void decrement() {
    setState(() {
      // item--;
      if (item == 1) {
      } else {
        item--;
        finalprice = double.parse(widget.price) * item;
      }
    });
  }

  @override
  void initState() {
    super.initState();
    finalprice = double.parse(widget.price);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Price:',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
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
                        item == 1 ? widget.price : finalprice.toString(),
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
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                      padding: MaterialStateProperty.all(
                          const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 15)),
                      backgroundColor: MaterialStateProperty.all(Colors.red)),
                  onPressed: () => storeItems(),
                  // Navigator.of(context).push(CupertinoPageRoute(
                  //   builder: (index) => CartPage(
                  //     amount: finalprice.toString(),
                  //     image: widget.image, text: widget.text,
                  //   ),
                  // )),
                  child: const Text('Add to Cart'))
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            // AppBarTitle(),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Image.asset(
                widget.image,
                height: 300,
              ),
            ),
            Arc(
              height: 30,
              edge: Edge.TOP,
              arcType: ArcType.CONVEY,
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(top: 60),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          RatingBar.builder(
                            initialRating: 4,
                            minRating: 1,
                            itemCount: 5,
                            itemSize: 18,
                            glowColor: Colors.yellow,
                            allowHalfRating: true,
                            direction: Axis.horizontal,
                            itemPadding: const EdgeInsets.symmetric(horizontal: 4),
                            onRatingUpdate: (index) {},
                            itemBuilder: (BuildContext context, int index) {
                              return const Icon(
                                Icons.star,
                                size: 10,
                                color: Colors.red,
                              );
                            },
                          ),
                          Row(
                            children: [
                              const Text(
                                "\$",
                                style: TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                              Text(
                                widget.price,
                                style: const TextStyle(
                                    color: Colors.red,
                                    fontWeight: FontWeight.w600),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              widget.text,
                              style: const TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w500),
                            ),
                            Container(
                              width: 90,
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  InkWell(
                                    onTap: () => decrement(),
                                    child: const Icon(
                                      Icons.remove,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                  Text(
                                    '$item',
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  InkWell(
                                    onTap: () => increment(),
                                    child: const Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          "Recommended",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 15),
                        ),
                      ),
                      const Recommended(),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery time:',
                              style: TextStyle(
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                  fontStyle: FontStyle.italic),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 10.0),
                                  child: Icon(Icons.timer),
                                ),
                                Text(
                                  '30 minutes',
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<DocumentReference<Object?>> storeItems() async {
    CollectionReference reference =
        FirebaseFirestore.instance.collection("items");

    return await reference.add({
      'price': widget.price,
      'image': widget.image,
      'name': widget.text,
    }).whenComplete(() => ScaffoldMessenger.of(context)
        .showSnackBar(
        const SnackBar(content: Text('added')),
    ));
  }
}
