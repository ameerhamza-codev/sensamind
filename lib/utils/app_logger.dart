import 'package:logger/logger.dart';
import 'package:mindwatch/utils/app_utils.dart';

class AppLogger {
  AppLogger({String tag}) : tag = tag ?? 'Logger';

  final String tag;
  Logger logger = Logger(
    printer: PrettyPrinter(),
    filter: AppUtils.isDebugMode ? DevelopmentFilter() : ProductionFilter(),
  );

  void d(dynamic log) {
    logger.d('D/$tag : $log');
  }

  void i(dynamic log) {
    logger.i('I/$tag : $log');
  }

  void w(dynamic log) {
    print(
        'W/$tag Warning ===========================================================');
    logger.w(log);
    print(
        '==========================================================================');
  }

  void e(dynamic log) {
    print('E/$tag ----------------------Error----------------------');
    logger.e(log);
    print('---------------------------------------------------------');
  }
}
