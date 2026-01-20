import 'package:core_kit/core_kit.dart';
import 'package:flutter/material.dart';

class BusinessRepresentativeScreen extends StatelessWidget {
  const BusinessRepresentativeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CommonAppBar(),
      body: Column(
        children: [
          CommonText(text: 'Business Representative', fontSize: 24, fontWeight: FontWeight.bold),
          10.height,
        ],
      ),
    );
  }
}
