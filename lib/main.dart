import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rumahsakit/cubit/doctor_cubit.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'cubit/patient_cubit.dart';
import 'cubit/schedule_cubit.dart';
import 'screen/screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => PatientCubit()),
        BlocProvider(create: (_) => DoctorCubit()),
        BlocProvider(create: (_) => ScheduleCubit()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: "/splashscreen",
        getPages: [
          GetPage(name: "/splashscreen", page: () => SplashScreen()),
          GetPage(name: "/home", page: () => HomeScreen()),
        ],
      ),
    );
  }
}
