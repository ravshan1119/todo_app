
import '../models/todo_model/todo_category.dart';
import '../utils/icons.dart';

class AppRepository {
  static List<ToDoCategory> categories = [
    ToDoCategory(
      id: 1,
      categoryName: "Grocery",
      iconPath: AppImages.grocery,
      colorInString: "CCFF80",
    ),
    ToDoCategory(
      id: 2,
      categoryName: "Work",
      iconPath: AppImages.work,
      colorInString: "FF9680",
    ),
    ToDoCategory(
      id: 3,
      categoryName: "Sport",
      iconPath: AppImages.sport,
      colorInString: "80FFFF",
    ),
    ToDoCategory(
      id: 4,
      categoryName: "Design",
      iconPath: AppImages.design,
      colorInString: "80FFD9",
    ),
    ToDoCategory(
      id: 5,
      categoryName: "University",
      iconPath: AppImages.university,
      colorInString: "809CFF",
    ),
    ToDoCategory(
      id: 6,
      categoryName: "Social",
      iconPath: AppImages.social,
      colorInString: "FF80EB",
    ),
    ToDoCategory(
      id: 7,
      categoryName: "Music",
      iconPath: AppImages.music,
      colorInString: "FC80FF",
    ),
    ToDoCategory(
      id: 8,
      categoryName: "Health",
      iconPath: AppImages.health,
      colorInString: "80FFA3",
    ),
    ToDoCategory(
      id: 9,
      categoryName: "Movie",
      iconPath: AppImages.movie,
      colorInString: "80D1FF",
    ),
    ToDoCategory(
      id: 10,
      categoryName: "Home",
      iconPath: AppImages.home,
      colorInString: "FFCC80",
    ),
  ];



}
