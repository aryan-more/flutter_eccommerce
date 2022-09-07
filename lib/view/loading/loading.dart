import 'package:flutter/material.dart';
import 'package:flutter_eccommerce/db/db.dart';
import 'package:flutter_eccommerce/utils/theme.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key});

  @override
  Widget build(BuildContext context) {
    DataBase.init();
    final theme = Theme.of(context).theme;
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: theme.action,
        ),
      ),
    );
  }
}
