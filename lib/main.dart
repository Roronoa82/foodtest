import 'package:flutter/material.dart';
import 'package:flutter_application_1/injection.dart';

import 'package:flutter_application_1/blocs/menu_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'check_frist_display.dart';

void main() {
  configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<FoodBloc>(
          create: (context) => getIt<FoodBloc>()
            ..add(const FetchFoodDataEvent(selectedSetId: '', searchQuery: '')),
        ),
      ],
      child: ResponsiveSizer(
        builder: (BuildContext context, Orientation orientation,
            ScreenType screenType) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            ),
            builder: (context, child) {
              return SafeArea(
                child: child!,
              );
            },
            home: const OrientationFirstPage(),
          );
        },
      ),
    );
  }
}
