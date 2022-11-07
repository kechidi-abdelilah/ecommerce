import 'package:ecommerce/core/utils/dimesions.dart';
import 'package:ecommerce/network/Auth/auth_controller.dart';
import 'package:flutter/material.dart';

import '../../../core/utils/helper.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Favorites",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Container(child: ListView.builder(itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(0),
              child: Card(
                color: Colors.teal[50],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                Helper.getAssetName("men.png", "type"),
                                height: Dimensions.height40,
                                width: Dimensions.width40,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Men casual",
                                    style: TextStyle(fontSize: 16),
                                  ),
                                  Text(
                                    "\$22.30",
                                    style: TextStyle(fontSize: 16),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.favorite,
                            color: Colors.red,
                          ))
                    ],
                  ),
                ),
              ),
            );
          })),
        ));
  }
}
