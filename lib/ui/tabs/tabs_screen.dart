import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:todo_app/ui/tabs/profile/profile_screen.dart';
import '../../data/local/db/local_database.dart';
import '../../models/todo_model/todo_model.dart';
import '../../models/todo_model/todo_status.dart';
import '../../models/todo_model_for_sql/todo_model_sql.dart';
import '../../utils/colors.dart';
import '../../utils/icons.dart';
import '../../utils/ui_itils.dart';
import '../router.dart';
import 'calendar/calendar_screen.dart';
import 'focus/focus_screen.dart';
import 'home/home_screen.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int currentIndex = 0;

  List<Widget> _screens = [];

  List<ToDoModel> toDos = [];

  _init() async {
    List<ToDoModelSql> allToDosSql = await LocalDatabase.getAllToDos();
    toDos = ToDoUtils.castToDoSqlToDoModel(allToDosSql);
    _screens[0] = HomeScreen(
      toDos: toDos
          .where((element) => element.status == ToDoStatus.inProgress)
          .toList(),
      onSomethingChanged: () {
        _init();
      },
    );
    _screens[2] = FocusScreen(
      toDos: toDos
          .where((element) => element.status != ToDoStatus.inProgress)
          .toList(),
      onSomethingChanged: () {
        _init();
      },
    );
    setState(() {});
    print('LENGTH:${allToDosSql.length}');
  }

  @override
  void initState() {
    _init();
    _screens = [
      HomeScreen(
        toDos: [],
        onSomethingChanged: () {
          _init();
        },
      ),
      CalendarScreen(),
      FocusScreen(
        toDos: [],
        onSomethingChanged: () {
          _init();
        },
      ),
      ProfileScreen(
        onChanged: () {},
      ),
    ];

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
        body: Stack(
      children: [
        _screens[currentIndex],
        Align(
          alignment: Alignment.bottomRight,
          child: Container(
            decoration: const BoxDecoration(color: AppColors.C_363636),
            height: 100,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _getMyBarItem(
                    isActive: currentIndex == 0,
                    icon: AppImages.homePassive,
                    activeIcon: AppImages.home,
                    label: "Home",
                    onTap: () {
                      setState(() {
                        currentIndex = 0;
                      });
                    }),
                _getMyBarItem(
                    isActive: currentIndex == 1,
                    icon: AppImages.calendarPassive,
                    activeIcon: AppImages.calendar,
                    label: "Calendar",
                    onTap: () {
                      setState(() {
                        currentIndex = 1;
                      });
                    }),
                const SizedBox(width: 36),
                _getMyBarItem(
                    isActive: currentIndex == 2,
                    icon: AppImages.focusPassive,
                    activeIcon: AppImages.focus,
                    label: "History",
                    onTap: () {
                      setState(() {
                        currentIndex = 2;
                      });
                    }),
                _getMyBarItem(
                    isActive: currentIndex == 3,
                    icon: AppImages.profile,
                    activeIcon: AppImages.profile,
                    label: "Profile",
                    onTap: () {
                      setState(() {
                        currentIndex = 3;
                      });
                    }),
              ],
            ),
          ),
        ),
        Positioned(
            left: (width - 64) / 2,
            right: (width - 64) / 2,
            bottom: 70,
            child: SizedBox(
              width: 64,
              height: 64,
              child: FloatingActionButton(
                backgroundColor: AppColors.C_8687E7,
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    RouteNames.addToDoScreen,
                    arguments: (toDo) async {
                      ToDoModel toDoModel = toDo as ToDoModel;
                      ToDoModelSql newToDo = await LocalDatabase.insertTodo(
                        ToDoModelSql(
                          expiredDate: toDoModel.expiredDate,
                          description: toDoModel.description,
                          title: toDoModel.title,
                          createdAt: toDoModel.createdAt,
                          categoryId: toDoModel.category.id,
                          status: toDoModel.status.index,
                          toDoImportance: toDoModel.toDoImportance.index,
                        ),
                      );
                      _init();
                      print("ADDED SUCCESSFULLY:${newToDo.id}");
                    }, //ValueChanged<ToDoModel>
                  );
                },
                child: SvgPicture.asset(
                  AppImages.add,
                ),
              ),
            ))
      ],
    ));
  }

  _getMyBarItem({
    required String icon,
    required String activeIcon,
    required String label,
    required bool isActive,
    required VoidCallback onTap,
  }) {
    return Column(children: [
      IconButton(
        onPressed: onTap,
        icon: isActive ? SvgPicture.asset(activeIcon) : SvgPicture.asset(icon),
      ),
      // SizedBox(height: 8.h),
      Text(
        label,
        style: TextStyle(
          fontSize: 12.sp,
          fontWeight: FontWeight.w400,
          color: AppColors.white,
        ),
      )
    ]);
  }
}
//
