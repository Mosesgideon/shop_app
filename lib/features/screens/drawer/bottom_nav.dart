import 'package:flutter/material.dart';

class BottomNavItems extends StatefulWidget {
  const BottomNavItems({Key? key}) : super(key: key);

  @override
  State<BottomNavItems> createState() => _BottomNavItemsState();
}

class _BottomNavItemsState extends State<BottomNavItems> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 10),
        decoration: const BoxDecoration(),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Row(
              children: [
                Text(
                  'Total:',
                  style: TextStyle(fontWeight: FontWeight.w500, fontSize: 18),
                ),
                SizedBox(width: 15,),
                Text(
                  '\$67',
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18, color: Colors.red),
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
                onPressed: () {},
                child: const Text('Order Now'))
          ],
        ),
      ),
    );
  }
}
