import 'package:auth/resources/style.dart';
import 'package:flutter/material.dart';

class PromotionsPage extends StatelessWidget {
  static const String routeName = '/promotions';

  const PromotionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Акции'),
      ),
      body: const Center(
        child: Text('Лента акций', style: utilityTextStyle,),
      ),
    );
  }
}
