import 'package:core_kit/app_bar/common_app_bar.dart';
import 'package:flutter/material.dart';

class BusinessBasicScreen extends StatelessWidget {
  const BusinessBasicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Center(
        child: Text('Business Basic Screen'),
      ),
    );
  }
}
