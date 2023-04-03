import 'package:my_first_stacked_app/ui/bottom_sheets/notice/notice_sheet.dart';
import 'package:my_first_stacked_app/ui/dialogs/info_alert/info_alert_dialog.dart';
import 'package:my_first_stacked_app/ui/views/home/home_view.dart';
import 'package:my_first_stacked_app/ui/views/startup/startup_view.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';
import 'package:my_first_stacked_app/ui/views/counter/counter_view.dart';
import 'package:my_first_stacked_app/ui/views/login/login_view.dart';
import 'package:my_first_stacked_app/services/authentication_service.dart';
import 'package:my_first_stacked_app/ui/views/todo_list/todo_list_view.dart';
import 'package:my_first_stacked_app/services/todo_list_service.dart';
// @stacked-import

@StackedApp(
  routes: [
    MaterialRoute(page: HomeView),
    MaterialRoute(page: StartupView),
    MaterialRoute(page: CounterView),
    MaterialRoute(page: LoginView),
    MaterialRoute(page: TodoListView),
// @stacked-route
  ],
  dependencies: [
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: AuthenticationService),
    LazySingleton(classType: TodoListService),
// @stacked-service
  ],
  bottomsheets: [
    StackedBottomsheet(classType: NoticeSheet),
    // @stacked-bottom-sheet
  ],
  dialogs: [
    StackedDialog(classType: InfoAlertDialog),
    // @stacked-dialog
  ],
)
class App {}
