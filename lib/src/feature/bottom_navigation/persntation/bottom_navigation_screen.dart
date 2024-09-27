import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:travenor_app/src/feature/bottom_navigation/persntation/bottom_navigation_cubit.dart';
import 'package:travenor_app/src/feature/calendar_screen/persntation/calendar_screen.dart';
import 'package:travenor_app/src/feature/home_screen/persntation/home_screen.dart';
import 'package:travenor_app/src/feature/message_screen/persntation/message_screen.dart';
import 'package:travenor_app/src/feature/profile_screen/persntation/profile_screen.dart';

class BottomNavigationScreen extends StatelessWidget {
  static String routeName = "/BottomNavigationScreen";

  const BottomNavigationScreen({super.key});

  static Widget builder(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavigationCubit(),
      child: const BottomNavigationScreen(),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screen = [
      HomeScreen(),
      CalendarScreen(),
      MessageScreen(),
      ProfileScreen(),
    ];
    List screenIcon = [
      Iconsax.home,
      Iconsax.calendar_1,
      Iconsax.message,
      Iconsax.user
    ];
    List<String> screenName = ["Home", "Calender", "Message", "Profile"];

    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (context, state) {
        if (state is BottomNavigationInitial) {
          return Scaffold(
            body: screen[state.currentIndex],
            bottomNavigationBar: AnimatedBottomNavigationBar.builder(
              itemCount: screenIcon.length,
              tabBuilder: (index, isActive) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      screenIcon[index],
                      color: isActive
                          ? const Color(0xff0D6EFD)
                          : const Color(0xff7D848D),
                    ),
                    const Gap(10),
                    Text(
                      screenName[index].toString(),
                      style: isActive
                          ? Theme.of(context).textTheme.labelSmall
                          : Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                );
              },
              height: 80,
              backgroundColor: Colors.white,
              gapLocation: GapLocation.center,
              rightCornerRadius: 40,
              leftCornerRadius: 40,
              activeIndex: state.currentIndex,
              onTap: (index) {
                context.read<BottomNavigationCubit>().updateIndex(index);
              },
            ),

            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            //floatingActionButton btn
            floatingActionButton: Theme(
              data: ThemeData(useMaterial3: false),
              child: SizedBox(
                height: 60,
                width: 60,
                child: FloatingActionButton(
                  onPressed: () {},
                  child: Container(
                      height: 60,
                      width: 60,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xff0D6EFD),
                      ),
                      child:
                          const Icon(Icons.add, size: 30, color: Colors.white)),
                ),
              ),
            ),
          );
        } else if (state is BottomNavigationFailed) {
          return Scaffold(
            body: Center(
              child: Text(state.message),
            ),
          );
        }
        return const CircularProgressIndicator();
      },
    );
  }
}
