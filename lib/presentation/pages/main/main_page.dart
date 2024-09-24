import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:waste_exchange/presentation/extensions/build_context_extension.dart';
import 'package:waste_exchange/presentation/misc/app_routes.dart';
import 'package:waste_exchange/presentation/pages/home/home_page.dart';
import 'package:waste_exchange/presentation/pages/profile/profile_page.dart';
import 'package:waste_exchange/presentation/providers/routes/router_provider.dart';
import 'package:waste_exchange/presentation/providers/user_data/user_data_provider.dart';

class MainPage extends ConsumerStatefulWidget {
  const MainPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _MainPageState();
}

class _MainPageState extends ConsumerState<MainPage> {
  PageController pageController = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ref.listen(
      userDataProvider,
      (previous, next) {
        if (previous != null && next is AsyncData && next.value == null) {
          ref.read(routerProvider).go(Routes.LOGIN);
        } else if (next is AsyncError) {
          context.showSnackBar(next.error.toString());
        }
      },
    );

    return Scaffold(
      extendBody: true,
      body: Stack(
        children: [
          PageView(
            controller: pageController,
            onPageChanged: (value) => setState(() {
              selectedIndex = value;
            }),
            children: const [
              HomePage(),
              ProfilePage(),
            ],
          )
        ],
      ),
    );
  }
}
