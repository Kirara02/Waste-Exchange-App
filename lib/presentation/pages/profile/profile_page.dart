import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:waste_exchange/presentation/misc/app_routes.dart';
import 'package:waste_exchange/presentation/misc/colors.dart';
import 'package:waste_exchange/presentation/misc/screen.dart';
import 'package:waste_exchange/presentation/misc/typography.dart';
import 'package:waste_exchange/presentation/providers/routes/router_provider.dart';
import 'package:waste_exchange/presentation/providers/user_data/user_data_provider.dart';
import 'package:waste_exchange/presentation/widgets/button/custom_button.dart';

class ProfilePage extends ConsumerStatefulWidget {
  const ProfilePage({super.key});

  @override
  ConsumerState<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends ConsumerState<ProfilePage> {
  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 224,
          decoration: BoxDecoration(
              color: AppColors.primary,
              image: const DecorationImage(
                image: AssetImage("assets/images/pattern-1-1.png"),
                fit: BoxFit.cover,
              )),
        ),
        ListView(
          padding: const EdgeInsets.only(top: 60),
          children: [
            Column(
              children: [
                ClipOval(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  "${ref.read(userDataProvider).valueOrNull?.name}",
                  style: Typogaphy.SemiBold.copyWith(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Container(
                    width: AppScreens.width,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        ProfileItem(
                          title: "Update Profile",
                          iconPath: "assets/icons/profile.svg",
                          onPressed: () => ref.read(routerProvider).push(Routes.UPDATE_POFILE),
                        ),
                        ProfileItem(
                          title: "Change Password",
                          iconPath: "assets/icons/lock.svg",
                          onPressed: () => ref.read(routerProvider).push(Routes.CHANGE_PASSWORD),
                        ),
                        ProfileItem(
                          title: "Terms & Condition",
                          iconPath: "assets/icons/file.svg",
                          onPressed: () {},
                        ),
                        ProfileItem(
                          title: "About",
                          iconPath: "assets/icons/about.svg",
                          onPressed: () => ref.read(routerProvider).push(Routes.ABOUT),
                        ),
                        ProfileItem(
                          title: "Websocket Demo",
                          iconPath: "assets/icons/filter.svg",
                          showBorder: false,
                          onPressed: () => ref.read(routerProvider).push(Routes.WSDEMO),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: AppScreens.width,
              child: CustomButton(
                title: "Logout",
                color: AppColors.primarySoft,
                onPressed: () => ref.read(userDataProvider.notifier).logout(),
              ),
            ),
            const SizedBox(height: 12),
            Text(
              "Version ${_packageInfo.version}",
              textAlign: TextAlign.center,
              style: Typogaphy.Regular.copyWith(fontSize: 12, color: AppColors.secondarySoft),
            ),
          ],
        ),
      ],
    );
  }
}

class ProfileItem extends StatelessWidget {
  final String title;
  final String iconPath;
  final VoidCallback? onPressed;
  final bool showBorder;
  const ProfileItem({
    super.key,
    required this.title,
    required this.iconPath,
    this.onPressed,
    this.showBorder = true,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: AppColors.secondary,
              width: 0.7,
              style: !showBorder ? BorderStyle.none : BorderStyle.solid,
            ),
          ),
        ),
        child: Row(
          children: [
            SvgPicture.asset(iconPath),
            const SizedBox(width: 12),
            Text(
              title,
              style: Typogaphy.Regular,
            )
          ],
        ),
      ),
    );
  }
}
