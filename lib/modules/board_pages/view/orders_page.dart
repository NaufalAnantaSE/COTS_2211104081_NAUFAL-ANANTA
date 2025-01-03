import 'package:flutter/material.dart';

class PromoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.local_offer, color: Colors.green),
          title: Text("Promo 1"),
          subtitle: Text("Diskon 50% untuk GoFood"),
        ),
        ListTile(
          leading: Icon(Icons.local_offer, color: Colors.green),
          title: Text("Promo 2"),
          subtitle: Text("Cashback hingga 20% dengan GoPay"),
        ),
      ],
    );
  }
}
