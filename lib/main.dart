import 'package:covid/providers/covidProvider.dart';
import 'package:covid/screens/getResultsController.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CovidProvider()),
      ],
      child: Builder(
        builder: (context) {
          return ScreenUtilInit(
              designSize: Size(411.428, 843.428),
              builder: () => MaterialApp(
                    debugShowCheckedModeBanner: false,
                    home: GetResults(),
                  ));
        },
      ),
    );
  }
}
