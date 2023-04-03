import 'package:flutter_test/flutter_test.dart';
import 'package:my_first_stacked_app/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('TodoListServiceTest -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}
