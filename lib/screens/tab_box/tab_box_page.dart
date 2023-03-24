import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:udevs_to_do/cubit/tab_box/tab_box_cubit.dart';
import 'package:udevs_to_do/screens/tab_box/home/home_page.dart';

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
    screens.add(Container());

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
    //BlocBuilder<TabBoxCubit, int>(
    //   builder: (context, state) {
    //     var index = context.watch<TabBoxCubit>().activePageIndex;
    //     return Scaffold(
    //       body: screens[index],
    //       bottomNavigationBar: BottomNavigationBar(
    //         type: BottomNavigationBarType.fixed,
    //         currentIndex: index,
    //         // selectedItemColor: AppColors.c_246BFD,
    //         onTap: (value) =>
    //             BlocProvider.of<TabBoxCubit>(context).changePageIndex(value),
    //         items: [
    //           BottomNavigationBarItem(
    //             icon: SvgPicture.asset(
    //               index == 0 ? AppIcons.iconHomeSelected : AppIcons.iconHome,
    //             ),
    //             label: "Home",
    //           ),
    //           BottomNavigationBarItem(
    //               icon: Padding(
    //                 padding: EdgeInsets.only(top: 4.h).r,
    //                 child: SvgPicture.asset(
    //                   AppIcons.iconAdd,
    //                   width: 55.w,
    //                   height: 55.h,
    //                 ),
    //               ),
    //               label: ''),
    //           BottomNavigationBarItem(
    //             icon: SvgPicture.asset(
    //               index == 2
    //                   ? AppIcons.iconProfileSelected
    //                   : AppIcons.iconProfile,
    //             ),
    //             label: "Profile",
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}
