import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_exchange/presentation/misc/colors.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/providers/routes/router_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends ConsumerWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: "Waste Exchange",
      routeInformationParser: ref.watch(routerProvider).routeInformationParser,
      routeInformationProvider: ref.watch(routerProvider).routeInformationProvider,
      routerDelegate: ref.watch(routerProvider).routerDelegate,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.secondaryExtraSoft,
        fontFamily: "Poppins",
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        bottomAppBarTheme: const BottomAppBarTheme(
          color: Colors.white,
        ),
        floatingActionButtonTheme: FloatingActionButtonThemeData(
          backgroundColor: AppColors.primarySoft,
        ),
        appBarTheme: AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.black.withOpacity(0.5), // Set to your desired color
            systemNavigationBarColor: Colors.black, // Color for the navigation bar
            systemNavigationBarIconBrightness: Brightness.light, // Icon color
            statusBarIconBrightness: Brightness.light, // Status bar icon color
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: false,
          titleTextStyle: Typogaphy.Medium.copyWith(
            color: AppColors.secondary,
            fontSize: 16,
          ),
        ),
      ),
    );
  }
}
