import 'package:flutter/material.dart';
import 'package:oxford_vocabulary_app/main.dart';
import 'package:oxford_vocabulary_app/utilities/configs.dart';
import 'package:oxford_vocabulary_app/utilities/constants.dart';
import 'package:oxford_vocabulary_app/widgets/drawer_settings_items.dart';
import 'package:oxford_vocabulary_app/widgets/line_separator.dart';
import 'package:oxford_vocabulary_app/widgets/profile_avatar.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      width: MediaQuery.of(context).size.width / 1.5,
      backgroundColor: kBlack,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 75),
              child: Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const ProfileAvatar(
                      size: kDrawerAvatarSize,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Text(
                      hiveService.displayName ?? "Default",
                      style: kAppBarStyle.copyWith(
                        color: kWhite,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.separated(
                  padding: const EdgeInsets.only(top: 30),
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {
                    final item = settingsItems[index];
                    return DrawerSettingsItem(
                        icon: item.icon, title: item.title, onTap: item.onTap);
                  },
                  separatorBuilder: (context, index) => const LineSeparator(
                        padding: 12,
                        color: kWhite,
                      ),
                  itemCount: settingsItems.length),
            )
          ],
        ),
      ),
    );
  }
}
