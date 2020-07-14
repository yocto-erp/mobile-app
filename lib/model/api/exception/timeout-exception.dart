import 'package:mobile/model/api/exception/abstract-exception.dart';

class TimeOutException extends AbstractException {
  TimeOutException(String message) : super(message);
}
