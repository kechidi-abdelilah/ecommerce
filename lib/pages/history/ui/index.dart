import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('yyyy-MM-dd').format(now);
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          title: Text(
            "Orders",
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: SafeArea(
          child: Container(
              // color: Colors.amber,
              // padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: ListView.builder(itemBuilder: (context, i) {
            return Padding(
              padding: const EdgeInsets.all(0),
              child: Card(
                color: Colors.teal[50],
                child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Order title",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Row(
                        children: [
                          Text(
                            "Order Date: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "$formattedDate",
                            style: TextStyle(fontSize: 16),
                          )
                        ],
                      ),
                      Divider(
                        thickness: 2,
                      ),
                      IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Order ID"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("#14570")
                              ],
                            ),
                            VerticalDivider(
                              thickness: 1,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Order Amount"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("1000 DA")
                              ],
                            ),
                            VerticalDivider(
                              thickness: 1,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("Payment"),
                                SizedBox(
                                  height: 8,
                                ),
                                Text("cash")
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          })),
        ));
  }
}
