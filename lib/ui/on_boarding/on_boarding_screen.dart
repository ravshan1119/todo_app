import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:todo_app/ui/on_boarding/pages/page_view_item.dart';
import '../../data/local/storage_repo/storage_repository.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../router.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int pageIndex = 0;
  final PageController pageController = PageController();

  _init() async {
    await StorageRepository.putBool("is_first", true);
  }

  @override
  void initState() {
    _init();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.C_121212,
      appBar: AppBar(
        backgroundColor: AppColors.C_121212,
        elevation: 0,
        title: Padding(
          padding: EdgeInsets.only(left: 10.w, top: 20.h),
          child: GestureDetector(
            onTap: () {
              Navigator.pushReplacementNamed(context, RouteNames.tabs);
            },
            child: Text(
              "Skip",
              style: TextStyle(
                fontFamily: "Lato",
                fontSize: 16.sp,
                color: Colors.white.withOpacity(0.4),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 2.h),
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                PageView(
                  onPageChanged: (index) {
                    setState(() {
                      pageIndex = index;
                    });
                  },
                  controller: pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  children: const [
                    PageViewItems(
                      title: "manage_your_tasks",
                      text: "on_boarding_text1",
                      img: AppImages.firstPageImage,
                    ),
                    PageViewItems(
                      title: "create_daily_routine",
                      text: "on_boarding_text2",
                      img: AppImages.secondPageImage,
                    ),
                    PageViewItems(
                      title: "organize_your_tasks",
                      text: "on_boarding_text3",
                      img: AppImages.thirdPageImage,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    pageIndex == 0
                        ? SvgPicture.asset(AppImages.rec)
                        : SvgPicture.asset(
                            AppImages.recPassive,
                            color: Colors.white.withOpacity(0.2),
                          ),
                    SizedBox(width: 2.w),
                    pageIndex == 1
                        ? SvgPicture.asset(AppImages.rec)
                        : SvgPicture.asset(
                            AppImages.recPassive,
                            color: Colors.white.withOpacity(0.2),
                          ),
                    SizedBox(width: 2.w),
                    pageIndex == 2
                        ? SvgPicture.asset(AppImages.rec)
                        : SvgPicture.asset(
                            AppImages.recPassive,
                            color: Colors.white.withOpacity(0.2),
                          ),
                  ],
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              right: 24.w,
              bottom: 62.h,
            ),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (pageIndex > 0) {
                      pageIndex--;
                      setState(() {
                        pageController.animateToPage(
                          pageIndex,
                          duration: const Duration(seconds: 1),
                          curve: Curves.bounceOut,
                        );
                      });
                    }
                  },
                  child: Container(
                    height: 48.h,
                    width: 90.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Center(
                      child: Text(
                        pageIndex != 0 ? "back" : "",
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16.sp,
                          color: Colors.white.withOpacity(0.4),
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (pageIndex < 2) {
                      pageIndex++;
                      setState(() {
                        pageController.animateToPage(
                          pageIndex,
                          duration: const Duration(seconds: 1),
                          curve: Curves.bounceOut,
                        );
                      });
                    } else {
                      Navigator.pushReplacementNamed(
                        context,
                        RouteNames.tabs,
                      );
                    }
                  },
                  child: Container(
                    height: 48.h,
                    width: pageIndex != 2 ? 90.w : 150.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: AppColors.C_8875FF,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Center(
                      child: Text(
                        pageIndex != 2 ? "next" : "get_started",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: "Lato",
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
