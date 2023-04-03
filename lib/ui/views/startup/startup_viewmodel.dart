import 'package:stacked/stacked.dart';
import 'package:my_first_stacked_app/app/app.locator.dart';
import 'package:my_first_stacked_app/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

class StartupViewModel extends BaseViewModel {
  // 1. Get the Authentication and NavigationService
  final _navigationService = locator<NavigationService>();

  Future runStartupLogic() async {
    // 2. Check if the user is logged in
    _navigationService.replaceWith(Routes.todoListView);
  }
}
