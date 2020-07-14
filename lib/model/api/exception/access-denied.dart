import 'package:mobile/model/api/exception/abstract-exception.dart';

class AccessDeniedException extends AbstractException {
  AccessDeniedException(message) : super(message);
}
