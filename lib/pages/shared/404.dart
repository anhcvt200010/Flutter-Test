import 'package:flutter/material.dart';

import '../../common/constants/constants.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(notFoundPageTitle),
      ),
      body: const Center(
        child: Text(notFoundPageContent),
      ),
    );
  }
}