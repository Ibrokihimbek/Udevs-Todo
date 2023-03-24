import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_to_do/cubit/tab_box/tab_box_cubit.dart';
import 'package:udevs_to_do/screens/tab_box/home/home_page.dart';
import 'package:udevs_to_do/utils/app_colors/app_colors.dart';
import 'package:udevs_to_do/utils/app_icons/app_icons.dart';
import 'package:zoom_tap_animation/zoom_tap_animation.dart';

class TabBoxPage extends StatefulWidget {
  const TabBoxPage({super.key});

  @override
  State<TabBoxPage> createState() => _TabBoxPageState();
}

class _TabBoxPageState extends State<TabBoxPage> {
  List<Widget> screens = [];
  @override
  void initState() {
    screens.add(HomePage());
    screens.add(Container());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TabBoxCubit, int>(
      builder: (context, state) {
        var index = context.watch<TabBoxCubit>().activePageIndex;
        return Scaffold(
          floatingActionButton: ZoomTapAnimation(
            onTap: () {},
            child: SvgPicture.asset(AppIcons.iconAdd),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          body: screens[index],
          bottomNavigationBar: Theme(
            data: ThemeData(
              splashColor: Colors.transparent,
              highlightColor: Colors.transparent,
            ),
            child: BottomNavigationBar(
              elevation: 0,
              type: BottomNavigationBarType.fixed,
              currentIndex: index,
              selectedItemColor: AppColors.c_5F87E7,
              onTap: (value) =>
                  BlocProvider.of<TabBoxCubit>(context).changePageIndex(value),
              items: [
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.iconHome,
                    // ignore: deprecated_member_use
                    color: index == 0
                        ? AppColors.c_5F87E7
                        : const Color(0xffBEBEBE),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: SvgPicture.asset(
                    AppIcons.iconTask,
                    // ignore: deprecated_member_use
                    color: index == 1
                        ? AppColors.c_5F87E7
                        : const Color(0xffBEBEBE),
                  ),
                  label: "Profile",
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
