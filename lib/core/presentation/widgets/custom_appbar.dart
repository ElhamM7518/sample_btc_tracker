import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sample_btc_tracker/core/utils/extensions/on_context.dart';

class CustomAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const CustomAppbar({required this.title, super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: context.textTheme.displayLarge),
      centerTitle: true,
      automaticallyImplyLeading: false,
      leading: context.canPop()
          ? IconButton(
              icon: const Icon(Icons.arrow_back_ios_new_rounded),
              onPressed: context.pop,
            )
          : const SizedBox(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
