import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:waste_exchange/presentation/extensions/build_context_extension.dart';
import 'package:waste_exchange/presentation/misc/app_routes.dart';
import 'package:waste_exchange/presentation/misc/colors.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
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
      floatingActionButton: SizedBox(
        width: 64,
        height: 64,
        child: FittedBox(
          child: FloatingActionButton(
            shape: const CircleBorder(),
            onPressed: () {},
            child: SvgPicture.asset(
              "assets/icons/qrcode-scan.svg",
              width: 36,
              colorFilter: const ColorFilter.mode(Colors.white, BlendMode.srcIn),
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomAppBar(
        shape: const CircularNotchedRectangle(),
        notchMargin: 5,
        clipBehavior: Clip.antiAlias,
        color: AppColors.primaryExtraSoft,
        height: 68,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              onTap: () => setState(() {
                selectedIndex = 0;
                pageController.animateToPage(selectedIndex,
                    duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
              }),
              child: SizedBox(
                width: 58,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: (selectedIndex == 0)
                          ? SvgPicture.asset('assets/icons/home-active.svg')
                          : SvgPicture.asset('assets/icons/home.svg'),
                    ),
                    Text(
                      "Home",
                      style: Typogaphy.Regular.copyWith(
                        fontSize: 10,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () => setState(() {
                selectedIndex = 1;
                pageController.animateToPage(selectedIndex,
                    duration: const Duration(milliseconds: 200), curve: Curves.easeInOut);
              }),
              customBorder: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              child: SizedBox(
                width: 58,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(bottom: 4),
                      child: (selectedIndex == 1)
                          ? SvgPicture.asset('assets/icons/profile-active.svg')
                          : SvgPicture.asset('assets/icons/profile.svg'),
                    ),
                    Text(
                      "Saya",
                      style: Typogaphy.Regular.copyWith(
                        fontSize: 10,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
