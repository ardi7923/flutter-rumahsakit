import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rumahsakit/cubit/patient_cubit.dart';
import 'package:flutter_rumahsakit/layout/layout.dart';
import 'package:flutter_rumahsakit/model/model.dart';
import 'package:flutter_rumahsakit/screen/consult/consult.dart';
import 'package:flutter_rumahsakit/screen/doctor/doctor.dart';
import 'package:flutter_rumahsakit/service/service.dart';
import 'package:flutter_rumahsakit/shared/shared.dart';
import 'package:flutter_rumahsakit/widget/widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

part 'splashscreen.dart';
part 'home_screen.dart';
part 'patient_screen.dart';
part 'patient_detail_screen.dart';
part 'signin_screen.dart';
part 'register_screen.dart';
part 'aboutus_screen.dart';

part 'consult_home_screen.dart';