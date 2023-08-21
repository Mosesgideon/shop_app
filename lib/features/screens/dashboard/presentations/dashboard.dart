import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/features/screens/cart/presentation/screens/cartpage.dart';
import 'package:food_app/features/screens/drawer/drawe_widget.dart';
import 'package:food_app/features/screens/widgets/appbar.dart';
import 'package:food_app/features/screens/widgets/categories.dart';
import 'package:food_app/features/screens/widgets/newest.dart';
import 'package:food_app/features/screens/widgets/popular.dart';
import 'package:food_app/features/screens/widgets/search_widget.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: NestedScrollView(physics: BouncingScrollPhysics(),
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return [

              // SizedBox(height: 10,),
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    SizedBox(height: 10,),
                    AppBarTitle(),
                    SearchItems(),
                  ],
                ),
              )
            ];
          },
          body: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Categories',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Categories(),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Popular Wears',
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Popular(),
            ],
          ),
        ),
      ),
      drawer: const DrawerWidget(),
      floatingActionButton: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
                  offset: const Offset(0, 3))
            ]),
        child: InkWell(
            onTap: () {
              Navigator.of(context).push(CupertinoPageRoute(
                  builder: (index) => const CartPage(
                        amount: '',
                        image: '',
                    text: '',
                      )));
            },
            child: const Icon(Icons.add_shopping_cart)),
      ),
    );
  }
}
