import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/bloc_observer.dart';
import 'core/injection_container.dart' as di;
import 'core/routes/router.gr.dart';
import 'features/map/location_cubit/location_cubit.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Disable landscape mode
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown],
  );

  // Dependencies Injection
  await di.init();

  BlocOverrides.runZoned(
    () => runApp(
      DevicePreview(
        enabled: false, // true only testing
        builder: (context) => MyApp(),
      ),
    ),
    blocObserver: Observer(),
  );
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => di.sl<LocationCubit>()),
      ],
      child: MaterialApp.router(
        title: 'Tests',
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
      ),
    );
  }
}
